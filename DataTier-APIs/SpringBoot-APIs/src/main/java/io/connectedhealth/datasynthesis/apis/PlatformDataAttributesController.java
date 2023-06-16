package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.PlatformDataAttributesEntity;
import io.connectedhealth.datasynthesis.repository.PlatformDataAttributesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PlatformDataAttributesController {

    @Autowired
    private PlatformDataAttributesRepository platformDataAttributesRepository;

    // get all platform data attributes
    @GetMapping("/platformdataattributes")
    public List<PlatformDataAttributesEntity> getAllPlatformDataAttributes(){
        return platformDataAttributesRepository.findAll();
    }

    // get datagentypes by like names
    @GetMapping("/platformdataattributes/desc/{datatypedesc}")
    public List<PlatformDataAttributesEntity> getDataGenTypesLike(@PathVariable String datatypedesc){
        return platformDataAttributesRepository.findByDataAttributeNameContainingIgnoreCase(datatypedesc);
    }

}
