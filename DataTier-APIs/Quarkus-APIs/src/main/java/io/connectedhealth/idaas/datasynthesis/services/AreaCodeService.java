package io.connectedhealth.idaas.datasynthesis.services;

import java.util.Arrays;

import javax.enterprise.context.ApplicationScoped;

import io.connectedhealth.idaas.datasynthesis.dtos.AreaCode;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingAreaCodeEntity;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AreaCodeService extends RandomizerService<DataExistingAreaCodeEntity, AreaCode> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingAreaCodeEntity.count();
        }
        return DataExistingAreaCodeEntity.count((String) queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }
    
    @Override
    protected PanacheQuery<DataExistingAreaCodeEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingAreaCodeEntity.findAll();
        }
        return DataExistingAreaCodeEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }
    
    @Override
    protected AreaCode mapEntityToDTO(DataExistingAreaCodeEntity e) {
        AreaCode code = new AreaCode(e.getAreaCodeValue(), e.getTimeZone().getTimeZoneValue(), e.getState().getStateId());
        code.id = e.getAreaCodeId();
        return code;
    }

    public AreaCode retrieve(long id) throws DataSynthesisException {
        DataExistingAreaCodeEntity entity = DataExistingAreaCodeEntity.findById(id);
        if(entity == null)
            throw new DataSynthesisException("Record does not exist");
        return mapEntityToDTO(entity);
    }
}
