package com.redhat.idaas.datasynthesis.services;

import java.util.Arrays;

import javax.enterprise.context.ApplicationScoped;

import com.redhat.idaas.datasynthesis.dtos.AreaCode;
import com.redhat.idaas.datasynthesis.models.DataExistingAreaCodeEntity;

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
        return new AreaCode(e.getAreaCodeValue(), e.getTimeZone().getTimeZoneValue(), e.getState().getStateId());
    }
}
