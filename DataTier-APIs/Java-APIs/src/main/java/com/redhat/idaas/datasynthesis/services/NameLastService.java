package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.NameLast;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataExistingNameLastEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class NameLastService extends RandomizerService<DataExistingNameLastEntity> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingNameLastEntity.count();
        }
        return DataExistingNameLastEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataExistingNameLastEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingNameLastEntity.findAll();
        }
        return DataExistingNameLastEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Transactional
    public boolean insertNameLast(String lastName) throws DataSynthesisException {
        DataExistingNameLastEntity entity = new DataExistingNameLastEntity(lastName);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }

    public List<NameLast> retrieveNameLasts(int count) {
        Set<DataExistingNameLastEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new NameLast(e.getLastName())).collect(Collectors.toList());
    }
}
