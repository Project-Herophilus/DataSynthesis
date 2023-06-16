package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataStatusEntity;
import io.connectedhealth.datasynthesis.repository.RefDataStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class StatusCodeController {
    @Autowired
    private RefDataStatusRepository statusCodeRepository;

    // get all statuscodes
    @GetMapping("/statuscodes")
    public List<RefDataStatusEntity> getAllStatusCodes(){ return statusCodeRepository.findAll();}

    // get statuscodes by like codename
    @GetMapping("/statuscodes/desc/{statuscodevalue}")
    public List<RefDataStatusEntity> getAreaCodeDetails(@PathVariable String statuscodevalue){
        return (List<RefDataStatusEntity>) statusCodeRepository.findByStatusDescriptionContainingIgnoreCase(statuscodevalue);
    }

}
