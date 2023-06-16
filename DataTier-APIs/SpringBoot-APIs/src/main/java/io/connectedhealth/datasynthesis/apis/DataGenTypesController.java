package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataDataGenTypesEntity;
import io.connectedhealth.datasynthesis.repository.RefDataDataGenTypesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DataGenTypesController {

    @Autowired
    private RefDataDataGenTypesRepository dataDataGenTypesRepository;

    // get all datagentypes
    @GetMapping("/datagentypes")
    public List<RefDataDataGenTypesEntity> getAllDataGenTypes(){
        return dataDataGenTypesRepository.findAll();
    }

    // get datagentypes by like names
    @GetMapping("/datagentypes/desc/{datagentypedesc}")
    public List<RefDataDataGenTypesEntity> getDataGenTypesLike(@PathVariable String datagentypedesc){
        return dataDataGenTypesRepository.findByDataGenTypeDescriptionContainingIgnoreCase(datagentypedesc);
    }

}
