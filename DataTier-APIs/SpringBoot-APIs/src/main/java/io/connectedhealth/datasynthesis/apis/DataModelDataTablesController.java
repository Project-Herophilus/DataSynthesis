package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataModelDataTablesEntity;
import io.connectedhealth.datasynthesis.repository.DataModelDataTablesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DataModelDataTablesController {

    @Autowired
    private DataModelDataTablesRepository dataModelDataTablesRepository;

    // get all platform data attributes
    @GetMapping("/datamodeldatatables")
    public List<DataModelDataTablesEntity> getAllPlatformAppSettings(){
        return dataModelDataTablesRepository.findAll();
    }

    // get datagentypes by like names
    @GetMapping("/datamodeldatatables/desc/{datamodeldesc}")
    public List<DataModelDataTablesEntity> getDataGenTypesLike(@PathVariable String datamodeldesc){
        return dataModelDataTablesRepository.findByTableNameContainsIgnoreCase(datamodeldesc);
    }

}
