package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedDateOfBirthEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedDateOfBirthRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DateOfBirthController {
    @Autowired
    private DataGeneratedDateOfBirthRepository dobRepository;

    // get all dobs
    @GetMapping("/dob")
    public List<DataGeneratedDateOfBirthEntity> getAllDOBs(){ return dobRepository.findAll();}

    // get dobs like specific value
    @GetMapping("/dob/value/{datevalue}")
    public List<DataGeneratedDateOfBirthEntity> getDOBByReference(@PathVariable String datevalue){
        return (List<DataGeneratedDateOfBirthEntity>) dobRepository.findByDateOfBirthDateContaining(datevalue);
    }
    // get dobs like specific value
    @GetMapping("/dob/age/{agevalue}")
    public List<DataGeneratedDateOfBirthEntity> getDOBByAge(@PathVariable Integer agevalue){
        return (List<DataGeneratedDateOfBirthEntity>) dobRepository.findByAgeContaining(agevalue);
    }

}
