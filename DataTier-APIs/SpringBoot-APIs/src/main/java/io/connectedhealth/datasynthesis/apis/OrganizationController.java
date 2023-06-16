package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataOrganizationEntity;
import io.connectedhealth.datasynthesis.repository.RefDataOrganizationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class OrganizationController {
    @Autowired
    private RefDataOrganizationRepository organizationRepository;

    // get all organizations
    @GetMapping("/organizations")
    public List<RefDataOrganizationEntity> getAllOrganizations(){ return organizationRepository.findAll();}

    // get organizations by like desc
    @GetMapping("/organizations/desc/{orgvalue}")
    public List<RefDataOrganizationEntity> getOrganizationDetails(@PathVariable String orgvalue){
        return (List<RefDataOrganizationEntity>) organizationRepository.findByOrganizationNameContainingIgnoreCase(orgvalue);
    }

}
