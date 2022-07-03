package io.connectedhealth.idaas.datasynthesis.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import io.connectedhealth.idaas.datasynthesis.dtos.DataStructure;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.PlatformAppSettingsDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;


import io.micrometer.core.instrument.MeterRegistry;
import io.micrometer.core.instrument.Timer;
import io.quarkus.arc.Arc;

import org.reflections.Reflections;

@ApplicationScoped
public class DataStructureService extends BaseService {

    @Inject
    MeterRegistry registry;

    private static final String SERVICE = "service";

    private static final Map<String, String> CLASS_MAP;

    static {
        
        CLASS_MAP = new HashMap<>();

        Reflections reflections = new Reflections("io.connectedhealth.idaas.datasynthesis.services");

        Set<Class<? extends BaseService>> allClasses = reflections.getSubTypesOf(BaseService.class);
        for (Class<? extends BaseService> c : allClasses) {
            CLASS_MAP.put(c.getSimpleName().toLowerCase(), c.getName());
        }
    }

    public String getClassName(String tableName) {
        if (null == tableName) {
            return null;
        }

        int index = tableName.indexOf("_");
        if (-1 == index) {
            return null;
        }

        String simpleName = tableName.substring(index+1) + SERVICE;
        return CLASS_MAP.get(simpleName);
    }
    
    public List<DataStructure> retrieveDataStructures(String name, int count) throws DataSynthesisException {
        Timer.Sample timer = Timer.start(registry);
        try {
            List<PlatformDataAttributesEntity> attributes = PlatformDataAttributesEntity.findByPlatformDataStructure(name);
            
            List<DataStructure> structureList = new ArrayList<DataStructure>(count);
            for (PlatformDataAttributesEntity attribute : attributes) {

                
                String tableName = attribute.getPlatformTableName();
                if (null == tableName) {
                    throw new DataSynthesisException("No PlatFormTableName specified for attribute " + attribute.getDataAttributeName() + " with id " + attribute.getPlatformDataAttributesId());
                }
                // Get classname from tablename
                String className = getClassName(tableName);
                if (null == className) {
                    throw new DataSynthesisException("PlatFormTableName " + tableName + " for attribute " + attribute.getDataAttributeName() + " with id " + attribute.getPlatformDataAttributesId() + " does not map to Class name");
                }

                try {
                    Class<?> c = Class.forName(className);
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
                    throw new DataSynthesisException("Invalid or unknown ServiceClassName " + className, e);
                }
            }
            
            
            return structureList;
        } finally {
            timer.stop(registry.timer("DataStructures."+name));
        }
    }
}
