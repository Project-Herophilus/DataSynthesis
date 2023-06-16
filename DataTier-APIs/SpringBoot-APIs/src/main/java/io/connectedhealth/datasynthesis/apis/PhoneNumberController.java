package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedPhoneNumberEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedPhoneNumberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PhoneNumberController {
    @Autowired
    private DataGeneratedPhoneNumberRepository phoneNumberRepository;

    // get all phonenumber
    @GetMapping("/phonenumber")
    public List<DataGeneratedPhoneNumberEntity> getAllPhoneNumbers(){ return phoneNumberRepository.findAll();}

    // get phonenumbers like specific value
    @GetMapping("/phonenumber/value/{numbervalue}")
    public List<DataGeneratedPhoneNumberEntity> getPhoneNumbers(@PathVariable String numbervalue){
        return (List<DataGeneratedPhoneNumberEntity>) phoneNumberRepository.findByPhoneNumberValueContainingIgnoreCase(numbervalue);
    }


}
