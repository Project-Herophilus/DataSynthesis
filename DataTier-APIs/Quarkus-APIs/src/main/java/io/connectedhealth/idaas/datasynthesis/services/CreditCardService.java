package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.github.curiousoddman.rgxgen.RgxGen;
import io.connectedhealth.idaas.datasynthesis.dtos.CreditCard;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedCreditCardEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class CreditCardService extends RandomizerService<DataGeneratedCreditCardEntity, CreditCard> {
    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedCreditCardEntity.count();
        }
        return DataGeneratedCreditCardEntity.count((String) queryOpts[0],
                Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedCreditCardEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedCreditCardEntity.findAll();
        }
        return DataGeneratedCreditCardEntity.find((String) queryOpts[0],
                Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected CreditCard mapEntityToDTO(DataGeneratedCreditCardEntity e) {
        CreditCard cc = new CreditCard(e.getCreditCardNumber(), e.getCreditCardName());
        cc.id = e.getCreditCardId();
        return cc;
    }

    public CreditCard retrieve(long id) throws DataSynthesisException {
        DataGeneratedCreditCardEntity entity = DataGeneratedCreditCardEntity.findById(id);
        if(entity == null)
            throw new DataSynthesisException("Record does not exist");
        return mapEntityToDTO(entity);
    }
    
    public List<CreditCard> retrieveRandomCreditCards(int count, Short typeId) {
        if (typeId == null) {
            return retrieveRandomData(count);
        }
        
        RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
        return retrieveRandomData(count, "DataGenTypeID", dataType);
    }

    @Transactional
    public List<DataGeneratedCreditCardEntity> generateCreditCards(int count, Short genTypeId)
            throws DataSynthesisException {
        List<DataGeneratedCreditCardEntity> ccnList = new ArrayList<DataGeneratedCreditCardEntity>(count);
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        List<RefDataDataGenTypesEntity> creditCardTypes = null;
        if (genTypeId != null) {
            RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(genTypeId);
            creditCardTypes = new ArrayList<RefDataDataGenTypesEntity>();
            creditCardTypes.add(dataType);
        } else {
            PlatformDataAttributesEntity ccDataAttribute = PlatformDataAttributesEntity.findByDataAttributeName("Credit Cards");
            creditCardTypes = RefDataDataGenTypesEntity.find("dataAttribute", ccDataAttribute).list();
        }
        RgxGen[] rgxGens = new RgxGen[creditCardTypes.size()];

        for (int i = 0; i < count;) {
            int selected = rand.nextInt(creditCardTypes.size());
            RefDataDataGenTypesEntity dataType = creditCardTypes.get(selected);
            RgxGen rgxGen = rgxGens[selected];
            if (rgxGen == null) {
                rgxGen = new RgxGen(dataType.getDefinition());
                rgxGens[selected] = rgxGen;
            }

            DataGeneratedCreditCardEntity entity = new DataGeneratedCreditCardEntity();
            entity.setCreatedDate(createdDate);
            entity.setStatus(defaultStatus);
            entity.setRegisteredApp(app);
            entity.setCreditCardNumber(rgxGen.generate(rand));
            entity.setCreditCardName(dataType.getDataGenTypeDescription());
            entity.setDataGenType(dataType);

            if (entity.safePersist()) {
                ccnList.add(entity);
                i++;
            }
        }

        return ccnList;
    }
}
