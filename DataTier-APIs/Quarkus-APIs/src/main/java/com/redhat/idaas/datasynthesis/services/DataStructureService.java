package com.redhat.idaas.datasynthesis.services;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import com.redhat.idaas.datasynthesis.dtos.DataStructure;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.PlatformAppSettingsDataAttributesEntity;
import com.redhat.idaas.datasynthesis.models.PlatformDataAttributesEntity;


import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Timer;
import io.quarkus.arc.Arc;

@ApplicationScoped
public class DataStructureService extends BaseService {

    @Inject
    private MeterRegistry registry;
    
    public List<DataStructure> retrieveDataStructures(String name, int count) throws DataSynthesisException {
        Timer.Sample timer = Timer.start(registry);
        try {
            List<PlatformDataAttributesEntity> attributes = PlatformDataAttributesEntity.findByPlatformDataStructure(name);
            
            List<DataStructure> structureList = new ArrayList<DataStructure>(count);
            for (PlatformDataAttributesEntity attribute : attributes) {

                PlatformAppSettingsDataAttributesEntity appSetting = PlatformAppSettingsDataAttributesEntity.findByPlatformDataAttribute(attribute.getPlatformDataAttributesId());
                if (null == appSetting) {
                    throw new DataSynthesisException("Could not find PlatfromAppSettingsDataAttributes for attribute " + attribute.getDataAttributeName() + " with id " + attribute.getPlatformDataAttributesId());
                }
                String className = appSetting.getServiceClassName();
                if (null == className) {
                    throw new DataSynthesisException("No ServiceClassName specified for attribute " + attribute.getDataAttributeName() + " with id " + attribute.getPlatformDataAttributesId());
                }
                try {
                    Class<?> c = Class.forName("com.redhat.idaas.datasynthesis.services." + className);
                    RandomizerService<?,?> service = (RandomizerService<?,?>) Arc.container().instance(c).get();
                    if (null == service) {
                        throw new DataSynthesisException("Invalid ServiceClassName " + className + " specified for attribute " + attribute.getDataAttributeName() + " with id " + attribute.getPlatformDataAttributesId());
                    }
                    List<?> data = service.retrieveRandomData(count);

                    for (int i=0; i<data.size(); i++) {
                        if (i >= structureList.size()) {
                            structureList.add(new DataStructure());
                        }

                        DataStructure s = structureList.get(i);
                        s.addObject(data.get(i));
                    }

                } catch (ClassNotFoundException e) {
                    throw new DataSynthesisException("Invalid or unkown ServiceClassName " + className, e);
                }
            }
            
            
            return structureList;
        } finally {
            timer.stop(registry.timer("DataStructures."+name));
        }
    }
}
