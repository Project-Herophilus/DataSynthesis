package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataLegalEntityEntity;
import io.connectedhealth.datasynthesis.repository.RefDataLegalEntitiesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class LegalEntitiesController {
    @Autowired
    private RefDataLegalEntitiesRepository legalEntitiesRepository;

    // get all legalentities
    @GetMapping("/legalentities")
    public List<RefDataLegalEntityEntity> getAllLegalEntities(){ return legalEntitiesRepository.findAll();}

    // get legalentities by like desc
    @GetMapping("/legalentities/desc/{orgvalue}")
    public List<RefDataLegalEntityEntity> getOrganizationDetails(@PathVariable String orgvalue){
        return (List<RefDataLegalEntityEntity>) legalEntitiesRepository.findByLocationNameContainingIgnoreCase(orgvalue);
    }

}
