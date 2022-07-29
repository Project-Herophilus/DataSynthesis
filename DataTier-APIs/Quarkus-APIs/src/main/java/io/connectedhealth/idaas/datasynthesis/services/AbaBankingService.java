package io.connectedhealth.idaas.datasynthesis.services;

import java.util.Arrays;
import java.sql.Timestamp;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.AbaBanking;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingAbaBankingEntity;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AbaBankingService extends RandomizerService<DataExistingAbaBankingEntity, AbaBanking> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingAbaBankingEntity.count();
        }
        return DataExistingAbaBankingEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataExistingAbaBankingEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingAbaBankingEntity.findAll();
        }
        return DataExistingAbaBankingEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    public AbaBanking retrieve(long id) throws DataSynthesisException {
        DataExistingAbaBankingEntity entity = DataExistingAbaBankingEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }

    @Override
    protected AbaBanking mapEntityToDTO(DataExistingAbaBankingEntity e) {
        AbaBanking ab = new AbaBanking();
        ab.id = e.getAbaBankingId();
        ab.city = e.getCity();
        ab.customerName = e.getCustomerName();
        ab.state = e.getState();
        ab.telegraphicName = e.getTelegraphicName();
        ab.zipCode = e.getZipCode();
        ab.routingNumber = e.getRoutingNumber();
        return ab;
    }

    @Transactional
    public boolean insertAbaBanking(AbaBanking banking) throws DataSynthesisException {
        DataExistingAbaBankingEntity entity = new DataExistingAbaBankingEntity();
        entity.setCity(banking.city);
        entity.setCustomerName(banking.customerName);
        entity.setState(banking.state);
        entity.setTelegraphicName(banking.telegraphicName);
        entity.setZipCode(banking.zipCode);
        entity.setRoutingNumber(banking.routingNumber);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }
}
