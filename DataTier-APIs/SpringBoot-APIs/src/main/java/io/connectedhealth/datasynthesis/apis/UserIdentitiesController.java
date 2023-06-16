package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedUserIdentitiesEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedUserIdentitiesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UserIdentitiesController {
    @Autowired
    private DataGeneratedUserIdentitiesRepository userIdentitiesRepository;

    // get all phonenumber
    @GetMapping("/useridentities")
    public List<DataGeneratedUserIdentitiesEntity> getAllUserIdentities(){ return userIdentitiesRepository.findAll();}

    // get phonenumbers like specific value
    @GetMapping("/useridentities/value/{numbervalue}")
    public List<DataGeneratedUserIdentitiesEntity> getUserIdentitiesValues(@PathVariable String numbervalue){
        return (List<DataGeneratedUserIdentitiesEntity>) userIdentitiesRepository.findByUserIdentityValueContainingIgnoreCase(numbervalue);
    }


}
