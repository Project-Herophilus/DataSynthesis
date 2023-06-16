package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataIndustryStdEntity;
import io.connectedhealth.datasynthesis.repository.RefDataIndustryStdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class IndustryStdsController {
    @Autowired
    private RefDataIndustryStdRepository industryStdRepository;

    // get all industrystds
    @GetMapping("/industrystds")
    public List<RefDataIndustryStdEntity> getAllIndustryStds(){ return industryStdRepository.findAll();}

    // get industrystds by like desc
    @GetMapping("/industrystds/desc/{termnamevalue}")
    public List<RefDataIndustryStdEntity> getIndustryStdsDetails(@PathVariable String termnamevalue){
        return (List<RefDataIndustryStdEntity>) industryStdRepository.findByIndustryStdContainsIgnoreCase(termnamevalue);
    }

}
