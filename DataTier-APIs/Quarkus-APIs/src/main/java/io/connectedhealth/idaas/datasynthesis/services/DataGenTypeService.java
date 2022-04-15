package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.DataGenType;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class DataGenTypeService extends BaseService {
    @Transactional
    public void createDataGenType(DataGenType dataType) throws DataSynthesisException {
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        PlatformDataAttributesEntity dataAttribute = PlatformDataAttributesEntity.findById(dataType.dataAttributeID);

        RefDataDataGenTypesEntity entity = new RefDataDataGenTypesEntity();
        entity.setCreatedDate(createdDate);
        entity.setDataAttribute(dataAttribute);
        entity.setStatus(defaultStatus);
        entity.setDefinition(dataType.definition);
        entity.setDataGenTypeDescription(dataType.description);

        entity.persist();
    }

    public List<DataGenType> retrieveAllDataGenTypes() {
        PanacheQuery<RefDataDataGenTypesEntity> entities = RefDataDataGenTypesEntity.findAll();
        return entities.stream().map(e -> mapEntityToDTO(e)).collect(Collectors.toList());
    }
    
    protected DataGenType mapEntityToDTO(RefDataDataGenTypesEntity e) {
        DataGenType dataType = new DataGenType();
        dataType.statusID = e.getDataAttribute().getStatus().getStatusId();
        dataType.definition = e.getDefinition();
        dataType.description = e.getDataGenTypeDescription();
        dataType.dataAttributeID = e.getDataAttribute().getPlatformDataAttributesId();
        dataType.dataGenID = e.getDataGenTypeId();
        return dataType;
    }
}
