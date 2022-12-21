package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.github.curiousoddman.rgxgen.RgxGen;
import io.connectedhealth.idaas.datasynthesis.dtos.UserIdentity;
import io.connectedhealth.idaas.datasynthesis.dtos.UserIdentityWithType;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedUserIdentitiesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class UserIdentitiesService extends RandomizerService<DataGeneratedUserIdentitiesEntity, UserIdentity> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedUserIdentitiesEntity.count();
        }
        return DataGeneratedUserIdentitiesEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedUserIdentitiesEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedUserIdentitiesEntity.findAll();
        }
        return DataGeneratedUserIdentitiesEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected UserIdentity mapEntityToDTO(DataGeneratedUserIdentitiesEntity e) {
        UserIdentity user = new UserIdentity(e.getUserIdentityValue(), e.getUserDomain(), e.getAdditionalAttributes());
        user.id = e.getUserIdentitiesId();
        return user;
    }

    public List<UserIdentity> retrieveRandomUserIdentities(int count, Short typeId) {
        if (typeId == null) {
            return retrieveRandomData(count);
        }
        
        RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(typeId);
        return retrieveRandomData(count, "DataGenTypeID", dataType);
    }

    @Transactional
    public List<UserIdentity> generateUserIdentities(UserIdentityWithType uIdentity) throws DataSynthesisException {
        List<UserIdentity> results = new ArrayList<UserIdentity>(uIdentity.count);
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());


        RefDataDataGenTypesEntity dataType = RefDataDataGenTypesEntity.findById(uIdentity.dataGenTypeId);
        RgxGen rgxGen = new RgxGen(dataType.getDefinition());

        for (int i = 0; i < uIdentity.count;) {
            DataGeneratedUserIdentitiesEntity entity = new DataGeneratedUserIdentitiesEntity();
            entity.setCreatedDate(createdDate);
            entity.setStatus(defaultStatus);
            entity.setRegisteredApp(app);
            entity.setUserIdentityValue(rgxGen.generate(rand));
            entity.setUserDomain(uIdentity.domainValue);
            entity.setAdditionalAttributes(uIdentity.additionalDetail);
            entity.setDataGenType(dataType);

            if (uIdentity.dryRun || entity.safePersist()) {
                results.add(mapEntityToDTO(entity));
                i++;
            }
        }

        return results;
    }

    public UserIdentity retrieve(long id) throws DataSynthesisException {
        DataGeneratedUserIdentitiesEntity entity = DataGeneratedUserIdentitiesEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }
}
