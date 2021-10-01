package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.github.curiousoddman.rgxgen.RgxGen;
import com.redhat.idaas.datasynthesis.dtos.BankAccount;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedBankAccountEntity;
import com.redhat.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import com.redhat.idaas.datasynthesis.models.RefDataApplicationEntity;
import com.redhat.idaas.datasynthesis.models.RefDataDataGenTypesEntity;
import com.redhat.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class BankAccountService extends RandomizerService<DataGeneratedBankAccountEntity, BankAccount> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedBankAccountEntity.count();
        }
        return DataGeneratedBankAccountEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedBankAccountEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedBankAccountEntity.findAll();
        }
        return DataGeneratedBankAccountEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected BankAccount mapEntityToDTO(DataGeneratedBankAccountEntity e) {
        return new BankAccount(e.getBankAccountValue());
    }
 
    public List<BankAccount> retrieveRandomBankAccounts(int count, Short typeId) {
        if (typeId == null) {
            return retrieveRandomData(count);
        }
        
        RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
        return retrieveRandomData(count, "DataGenTypeID", dataType);
    }

    @Transactional
    public List<DataGeneratedBankAccountEntity> generateBankAccounts(int count, Short typeId) throws DataSynthesisException {
        List<DataGeneratedBankAccountEntity> results = new ArrayList<DataGeneratedBankAccountEntity>(count);
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

            DataGeneratedBankAccountEntity entity = new DataGeneratedBankAccountEntity();
            entity.setCreatedDate(createdDate);
            entity.setStatus(defaultStatus);
            entity.setRegisteredApp(app);
            entity.setBankAccountValue(rgxGen.generate(rand));
            entity.setDataGenType(dataType);

            if (entity.safePersist()) {
                results.add(entity);
                i++;
            }
        }

        return results;
    }
}
