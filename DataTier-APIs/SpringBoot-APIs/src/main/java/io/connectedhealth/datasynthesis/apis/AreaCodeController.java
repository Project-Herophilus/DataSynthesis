package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingAreaCodeEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingAreaCodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class AreaCodeController {

    @Autowired
    private DataExistingAreaCodeRepository areaCodeRepository;

    // get all areacodes
    @GetMapping("/areacode")
    public List<DataExistingAreaCodeEntity> getAllAreaCodes(){
        return areaCodeRepository.findAll();
    }


    @GetMapping("/areacode/state/{statecodeval}")
    public List<DataExistingAreaCodeEntity> getAreaCodesByState(@PathVariable String statecodeval){
        return areaCodeRepository.findByState_StateId(statecodeval);
    }
    // get areacodes by areacode value
    @GetMapping("/areacode/value/{areacodevalue}")
    public List<DataExistingAreaCodeEntity> getAreaCodeDetails(@PathVariable String areacodevalue){
        return areaCodeRepository.findByAreaCodeValue(areacodevalue);
    }

}
