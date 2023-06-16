package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataApplicationEntity;
import io.connectedhealth.datasynthesis.repository.RefDataApplicationsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ApplicationController {
    @Autowired
    private RefDataApplicationsRepository applicationsRepository;

    // get all applications
    @GetMapping("/applications")
    public List<RefDataApplicationEntity> getAllApplications(){ return applicationsRepository.findAll();}

    // get applications by like desc
    @GetMapping("/applications/desc/{appcodedescvalue}")
    public List<RefDataApplicationEntity> getOrganizationDetails(@PathVariable String appcodedescvalue){
        return (List<RefDataApplicationEntity>) applicationsRepository.findByApplicationDescContainingIgnoreCase(appcodedescvalue);
    }

}
