package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.NameFirst;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingNameFirstEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class NameFirstService extends RandomizerService<DataExistingNameFirstEntity, NameFirst> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingNameFirstEntity.count();
        }
        return DataExistingNameFirstEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataExistingNameFirstEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingNameFirstEntity.findAll();
        }
        return DataExistingNameFirstEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected NameFirst mapEntityToDTO(DataExistingNameFirstEntity e) {
        return new NameFirst(e.getFirstName(), e.getGender());
    }

    @Transactional
    public boolean insertNameFirst(NameFirst name) throws DataSynthesisException {
        DataExistingNameFirstEntity entity = new DataExistingNameFirstEntity(name.firstName, name.gender);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }

    public List<NameFirst> retrieveNameFirsts(int count, String gender, String firstLetter) {
        String likeFL = wrapForLike(firstLetter, false, true);

        if (null == gender && null == likeFL) {
            return retrieveRandomData(count);
        } else if (null == gender) {
            return retrieveRandomData(count, "firstName like ?1", likeFL);
        } else if (null == likeFL) {
            return retrieveRandomData(count, "gender", gender);
        }
            
        return retrieveRandomData(count, "gender = ?1 and firstName like ?2", gender, likeFL);
    }
}
