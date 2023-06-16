package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingUpcCodesEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingUPCCodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class UPCCodeController {
    @Autowired
    private DataExistingUPCCodeRepository upcCodeRepository;

    // get all upccodes
    @GetMapping("/upccodes")
    public List<DataExistingUpcCodesEntity> getAllUPCCodes(){ return upcCodeRepository.findAll();}

    // get upccodes by like desc
    /*@GetMapping("/upccodes/desc/{upcdescvalue}")
    public List<DataExistingUpcCodesEntity> getUSStateCodeDetails(@PathVariable String upcdescvalue){
        return (List<DataExistingUpcCodesEntity>) upcCodeRepository.FindByUPCCodeDescContainsIgnoreCase(upcdescvalue);
    }*/

}
