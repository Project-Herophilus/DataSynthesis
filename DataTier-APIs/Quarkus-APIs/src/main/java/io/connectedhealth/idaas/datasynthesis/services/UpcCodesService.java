package io.connectedhealth.idaas.datasynthesis.services;

import java.util.Arrays;
import java.sql.Timestamp;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.UpcCode;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingUpcCodesEntity;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class UpcCodesService extends RandomizerService<DataExistingUpcCodesEntity, UpcCode> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingUpcCodesEntity.count();
        }
        return DataExistingUpcCodesEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataExistingUpcCodesEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingUpcCodesEntity.findAll();
        }
        return DataExistingUpcCodesEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected UpcCode mapEntityToDTO(DataExistingUpcCodesEntity e) {
        UpcCode code = new UpcCode(e.getUpcCodeName(), e.getUpcProductName());
        code.id = e.getUpcCodeId();
        return code;
    }

    @Transactional
    public boolean insertUpcCode(UpcCode upcCode) throws DataSynthesisException {
        DataExistingUpcCodesEntity entity = new DataExistingUpcCodesEntity();
        entity.setUpcCodeName(upcCode.upcCode);
        entity.setUpcProductName(upcCode.productName);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }

    public UpcCode retrieve(long id) throws DataSynthesisException {
        DataExistingUpcCodesEntity entity = DataExistingUpcCodesEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }
}
