package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataSensitivityFlagEntity;
import io.connectedhealth.datasynthesis.repository.RefDataSensitivityFlagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class SensitivityFlagController {
    @Autowired
    private RefDataSensitivityFlagRepository sensitivityFlagRepository;

    // get all sensitivityflags
    @GetMapping("/sensitivityflags")
    public List<RefDataSensitivityFlagEntity> getAllSensitivityCodes(){ return sensitivityFlagRepository.findAll();}

    // get sensitivityflags by like desc
    @GetMapping("/sensitivityflags/desc/{sensitivitycodevalue}")
    public List<RefDataSensitivityFlagEntity> getUSStateCodeDetails(@PathVariable String sensitivitycodevalue){
        return (List<RefDataSensitivityFlagEntity>) sensitivityFlagRepository.findBySensitiveFlagDescContainingIgnoreCase(sensitivitycodevalue);
    }

}
