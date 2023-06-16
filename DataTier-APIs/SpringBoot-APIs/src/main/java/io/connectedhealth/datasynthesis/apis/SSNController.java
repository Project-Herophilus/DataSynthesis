package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedSocialSecurityNumberEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedSSNRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class SSNController {
    @Autowired
    private DataGeneratedSSNRepository ssnRepository;

    // get all ssns
    @GetMapping("/ssn")
    public List<DataGeneratedSocialSecurityNumberEntity> getAllSSNs(){ return ssnRepository.findAll();}

    // get phonenumbers like specific value
    @GetMapping("/ssn/value/{numbervalue}")
    public List<DataGeneratedSocialSecurityNumberEntity> getSSNNumbers(@PathVariable String numbervalue){
        return (List<DataGeneratedSocialSecurityNumberEntity>) ssnRepository.findBySocialSecurityNumberValueContainingIgnoreCase(numbervalue);
    }
}
