package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.NameFirst;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataExistingNameFirstEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class NameFirstService extends RandomizerService<DataExistingNameFirstEntity> {

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

    @Transactional
    public boolean insertNameFirst(String firstName, String gender) throws DataSynthesisException {
        DataExistingNameFirstEntity entity = new DataExistingNameFirstEntity(firstName, gender);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }

    public List<NameFirst> retrieveNameFirsts(int count, String gender) {
        Set<DataExistingNameFirstEntity> entities = null;
        if (gender == null) {
            entities = findRandomRows(count);
        } else {
            entities = findRandomRows(count, "gender", gender);
        }
        return entities.stream().map(e -> new NameFirst(e.getFirstName(), e.getGender())).collect(Collectors.toList());
    }
}
