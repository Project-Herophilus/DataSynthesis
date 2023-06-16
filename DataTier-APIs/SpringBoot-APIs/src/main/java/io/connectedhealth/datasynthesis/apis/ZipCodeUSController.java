package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingZipCodeUsEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingZipCodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class ZipCodeUSController {
    @Autowired
    private DataExistingZipCodeRepository zipCodeRepository;

    // get all upccodes
    @GetMapping("/zipcodes")
    public List<DataExistingZipCodeUsEntity> getAllZipcodesUSCodes(){ return zipCodeRepository.findAll();}

    // get upccodes by like desc
    /*@GetMapping("/upccodes/desc/{upcdescvalue}")
    public List<DataExistingUpcCodesEntity> getUSStateCodeDetails(@PathVariable String upcdescvalue){
        return (List<DataExistingUpcCodesEntity>) upcCodeRepository.FindByUPCCodeDescContainsIgnoreCase(upcdescvalue);
    }*/

}
