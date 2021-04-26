package com.redhat.idaas.datasynthesis.services;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;

import com.redhat.idaas.datasynthesis.dtos.AreaCode;
import com.redhat.idaas.datasynthesis.models.DataExistingAreaCodeEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AreaCodeService extends RandomizerService<DataExistingAreaCodeEntity> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedUserIdentitiesEntity.count();
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
    public List<AreaCode> retrieveRandomAreaCode(int count) {
        Set<DataExistingAreaCodeEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new AreaCode(e.areaCodeValue(), e.getTimeZone(),
                e.getStateCode())).collect(Collectors.toList());
    }
}