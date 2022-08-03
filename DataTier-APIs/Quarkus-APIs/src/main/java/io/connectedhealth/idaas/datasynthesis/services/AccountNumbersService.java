package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.github.curiousoddman.rgxgen.RgxGen;
import io.connectedhealth.idaas.datasynthesis.dtos.AccountNumber;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedAccountNumbersEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AccountNumbersService extends RandomizerService<DataGeneratedAccountNumbersEntity, AccountNumber> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedAccountNumbersEntity.count();
        }
        return DataGeneratedAccountNumbersEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedAccountNumbersEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedAccountNumbersEntity.findAll();
        }
        return DataGeneratedAccountNumbersEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    public AccountNumber retrieve(long id) throws DataSynthesisException {
        DataGeneratedAccountNumbersEntity entity = DataGeneratedAccountNumbersEntity.findById(id);
        if(entity == null)
            throw new DataSynthesisException("Record does not exist");
        return mapEntityToDTO(entity);
    }

    @Override
    protected AccountNumber mapEntityToDTO(DataGeneratedAccountNumbersEntity e) {
        AccountNumber account = new AccountNumber(e.getAccountNumberValue());
        account.id = e.getAccountNumbersId();
        return account;
    }
 
    public List<AccountNumber> retrieveRandomAccountNumbers(int count, Short typeId) {
        if (typeId == null) {
            return retrieveRandomData(count);
        }
        
        RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
        return retrieveRandomData(count, "DataGenTypeID", dataType);
    }

    @Transactional
    public List<DataGeneratedAccountNumbersEntity> generateAccountNumbers(int count, Short typeId) throws DataSynthesisException {
        List<DataGeneratedAccountNumbersEntity> results = new ArrayList<DataGeneratedAccountNumbersEntity>(count);
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        List<RefDataDataGenTypesEntity> allTypes = null;
        if (typeId != null) {
            RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
            allTypes = new ArrayList<RefDataDataGenTypesEntity>();
            allTypes.add(dataType);
        } else {
            PlatformDataAttributesEntity dataAttribute = PlatformDataAttributesEntity.findByDataAttributeName("Account Numbers");
            allTypes = RefDataDataGenTypesEntity.find("dataAttribute", dataAttribute).list();
        }
        RgxGen[] rgxGens = new RgxGen[allTypes.size()];

        for (int i = 0; i < count;) {
            int selected = rand.nextInt(allTypes.size());
            RefDataDataGenTypesEntity dataType = allTypes.get(selected);
            RgxGen rgxGen = rgxGens[selected];
            if (rgxGen == null) {
                rgxGen = new RgxGen(dataType.getDefinition());
                rgxGens[selected] = rgxGen;
            }

            DataGeneratedAccountNumbersEntity entity = new DataGeneratedAccountNumbersEntity();
            entity.setCreatedDate(createdDate);
            entity.setStatus(defaultStatus);
            entity.setRegisteredApp(app);
            entity.setAccountNumberValue(rgxGen.generate(rand));
            entity.setDataGenType(dataType);

            if (entity.safePersist()) {
                results.add(entity);
                i++;
            }
        }

        return results;
    }
}
