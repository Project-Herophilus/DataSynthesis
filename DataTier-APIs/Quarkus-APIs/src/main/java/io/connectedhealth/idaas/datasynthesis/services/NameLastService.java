package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.Arrays;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.NameLast;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingNameLastEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class NameLastService extends RandomizerService<DataExistingNameLastEntity, NameLast> {

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

    @Override
    protected NameLast mapEntityToDTO(DataExistingNameLastEntity e) {
        return new NameLast(e.getLastName());
    }

    @Transactional
    public boolean insertNameLast(NameLast name) throws DataSynthesisException {
        DataExistingNameLastEntity entity = new DataExistingNameLastEntity(name.lastName);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }
}
