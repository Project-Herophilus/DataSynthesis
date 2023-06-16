package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataCountriesEntity;
import io.connectedhealth.datasynthesis.repository.RefDataCountriesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class CountriesController {
    @Autowired
    private RefDataCountriesRepository countriesRepository;

    // get all countries
    @GetMapping("/countries")
    public List<RefDataCountriesEntity> getAllCountries(){ return countriesRepository.findAll();}

    // get countries by like codename
    @GetMapping("/countries/desc/{countrycodevalue}")
    public List<RefDataCountriesEntity> getCountryDetails(@PathVariable String countrycodevalue){
        return (List<RefDataCountriesEntity>) countriesRepository.findByCountryNameContainingIgnoreCase(countrycodevalue);
    }

}
