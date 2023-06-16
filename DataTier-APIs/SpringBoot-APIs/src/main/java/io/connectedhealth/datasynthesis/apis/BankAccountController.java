package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedBankAccountEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedBankAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class BankAccountController {
    @Autowired
    private DataGeneratedBankAccountRepository bankAccountRepository;

    // get all accountnumbers
    @GetMapping("/bankaccounts")
    public List<DataGeneratedBankAccountEntity> getAllBankAccountNumbers(){ return bankAccountRepository.findAll();}

    // get accountnumbers like specific value
    @GetMapping("/bankaccounts/value/{accountnumbervalue}")
    public List<DataGeneratedBankAccountEntity> getBankAccountNumber(@PathVariable String accountnumbervalue){
        return (List<DataGeneratedBankAccountEntity>) bankAccountRepository.findByBankAccountValueContainingIgnoreCase(accountnumbervalue);
    }

}
