package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataModelDataDomainsEntity;
import io.connectedhealth.datasynthesis.repository.DataModelDataDomainsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DataModelDataDomainController {

    @Autowired
    private DataModelDataDomainsRepository dataModelDataDomainsRepository;

    // get all platform data attributes
    @GetMapping("/datamodeldatadomains")
    public List<DataModelDataDomainsEntity> getAllDataDomains(){
        return dataModelDataDomainsRepository.findAll();
    }

    // get datagentypes by like names
    @GetMapping("/datamodeldatadomains/desc/{datamodeldesc}")
    public List<DataModelDataDomainsEntity> getDataGenTypesLike(@PathVariable String datamodeldesc){
        return dataModelDataDomainsRepository.findByDomainInformationContainingIgnoreCase(datamodeldesc);
    }

}
