package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataOperationTypeEntity;
import io.connectedhealth.datasynthesis.repository.RefDataOperatonTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class OperationTypeController {
    @Autowired
    private RefDataOperatonTypeRepository operatonTypeRepository;

    // get all statuscodes
    @GetMapping("/operationtypes")
    public List<RefDataOperationTypeEntity> getAllOperationTypesCodes(){ return operatonTypeRepository.findAll();}

    // get statuscodes by like codename
    @GetMapping("/operationtypes/desc/{optypecodevalue}")
    public List<RefDataOperationTypeEntity> getAreaCodeDetails(@PathVariable String optypecodevalue){
        return (List<RefDataOperationTypeEntity>) operatonTypeRepository.findByOperationTypeNameContainingIgnoreCase(optypecodevalue);
    }

}
