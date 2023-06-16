package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataCodeSetEntity;
import io.connectedhealth.datasynthesis.repository.RefDataCodesetsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CodesetsController {
    @Autowired
    private RefDataCodesetsRepository codesetsRepository;

    // get all countries
    @GetMapping("/codesets")
    public List<RefDataCodeSetEntity> getAllCountries(){ return codesetsRepository.findAll();}

    // get countries by like codename
    @GetMapping("/codesets/desc/{codesetvalue}")
    public List<RefDataCodeSetEntity> getCountryDetails(@PathVariable String codesetvalue){
        return (List<RefDataCodeSetEntity>) codesetsRepository.findByCodeSetNameContainingIgnoreCase(codesetvalue);
    }

}
