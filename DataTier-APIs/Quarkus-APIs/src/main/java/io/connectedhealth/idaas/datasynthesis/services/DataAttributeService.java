package io.connectedhealth.idaas.datasynthesis.services;

import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;

import io.connectedhealth.idaas.datasynthesis.dtos.DataAttribute;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class DataAttributeService extends BaseService {
    public List<DataAttribute> retrieveAllDataAttributes() {
        PanacheQuery<PlatformDataAttributesEntity> entities = PlatformDataAttributesEntity.findAll();
        return entities.stream().map(e -> mapEntityToDTO(e)).collect(Collectors.toList());
    }
    
    protected DataAttribute mapEntityToDTO(PlatformDataAttributesEntity e) {
        return new DataAttribute(e.getPlatformDataAttributesId(), e.getDataAttributeName());
    }
}
