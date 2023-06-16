package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedCreditCardEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedCreditCardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CreditCardController {
    @Autowired
    private DataGeneratedCreditCardRepository creditCardRepository;

    // get all accountnumbers
    @GetMapping("/creditcard")
    public List<DataGeneratedCreditCardEntity> getAllCreditCards(){ return creditCardRepository.findAll();}

    // get accountnumbers like specific value
    @GetMapping("/creditcard/value/{accountnumbervalue}")
    public List<DataGeneratedCreditCardEntity> getCreditCardNumber(@PathVariable String accountnumbervalue){
        return (List<DataGeneratedCreditCardEntity>) creditCardRepository.findByCreditCardNumberContainingIgnoreCase(accountnumbervalue);
    }


}
