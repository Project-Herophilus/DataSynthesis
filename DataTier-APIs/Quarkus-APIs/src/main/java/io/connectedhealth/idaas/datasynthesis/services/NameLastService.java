package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.List;

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
        NameLast name = new NameLast(e.getLastName());
        name.id = e.getLastNameId();
        return name;
    }

    @Transactional
    public boolean insertNameLast(NameLast name) throws DataSynthesisException {
        DataExistingNameLastEntity entity = new DataExistingNameLastEntity(name.lastName);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }

    public List<NameLast> retrieveNameLasts(int count, String firstLetter) {
        String likeFL = wrapForLike(firstLetter, false, true);

        if (null == likeFL) {
            return retrieveRandomData(count);
        }
            
        return retrieveRandomData(count, "lastName like ?1", likeFL);
    }

    public NameLast retrieve(long id) throws DataSynthesisException {
        DataExistingNameLastEntity entity = DataExistingNameLastEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }
}
