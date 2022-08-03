package io.connectedhealth.idaas.datasynthesis.services;

import java.util.Arrays;

import javax.enterprise.context.ApplicationScoped;

import io.connectedhealth.idaas.datasynthesis.dtos.ZipCode;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingZipCodeUsEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class ZipCodeUSService extends RandomizerService<DataExistingZipCodeUsEntity, ZipCode> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingZipCodeUsEntity.count();
        }
        return DataExistingZipCodeUsEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataExistingZipCodeUsEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingZipCodeUsEntity.findAll();
        }
        return DataExistingZipCodeUsEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected ZipCode mapEntityToDTO(DataExistingZipCodeUsEntity e) {
        ZipCode zipCode = new ZipCode(e.getZipCode(), e.getState(), e.getCity());
        zipCode.id = e.getZipCodeId();
        return zipCode;
    }

    public ZipCode retrieve(long id) throws DataSynthesisException {
        DataExistingZipCodeUsEntity entity = DataExistingZipCodeUsEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }
}
