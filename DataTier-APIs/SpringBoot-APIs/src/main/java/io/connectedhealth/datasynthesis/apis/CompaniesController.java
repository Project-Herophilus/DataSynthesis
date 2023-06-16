package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingCompaniesEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingCompaniesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CompaniesController {

    @Autowired
    private DataExistingCompaniesRepository companiesRepository;

    // get all employees
    @GetMapping("/companies")
    public List<DataExistingCompaniesEntity> getAllCompanies(){
        return companiesRepository.findAll();
    }

    /*
    // get companies by id rest api
    @GetMapping("/companies/id/{abaBankId}")
    public DataExistingAbaBankingEntity getABABanksByID(@PathVariable Long abaBankId){
        return abaBankingRepository.findByAbaBankingId(abaBankId);
    }
    /*
    */
    // get abanks by like names
    @GetMapping("/companies/name/{companyName}")
    public List<DataExistingCompaniesEntity> getABABanksNamesLike(@PathVariable String companyName){
        return companiesRepository.findByCompanyNameContainingIgnoreCase(companyName);
    }

}
