package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedAccountNumbersEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedAccountNumbersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class AccountNumbersController {
    @Autowired
    private DataGeneratedAccountNumbersRepository dataGeneratedAccountNumbersRepository;

    // get all accountnumbers
    @GetMapping("/accountnumbers")
    public List<DataGeneratedAccountNumbersEntity> getAllAccountNumbers(){ return dataGeneratedAccountNumbersRepository.findAll();}

    // get accountnumbers like specific value
    @GetMapping("/accountnumbers/value/{accountnumbervalue}")
    public List<DataGeneratedAccountNumbersEntity> getOrganizationDetails(@PathVariable String accountnumbervalue){
        return (List<DataGeneratedAccountNumbersEntity>) dataGeneratedAccountNumbersRepository.findByAccountNumberValueNotContainsIgnoreCase(accountnumbervalue);
    }

}
