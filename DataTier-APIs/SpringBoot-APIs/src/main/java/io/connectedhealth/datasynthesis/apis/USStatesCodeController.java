package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataUsStatesEntity;
import io.connectedhealth.datasynthesis.repository.RefDataUSStatesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class USStatesCodeController {
    @Autowired
    private RefDataUSStatesRepository usStatesRepository;

    // get all usstates
    @GetMapping("/usstates")
    public List<RefDataUsStatesEntity> getAllUSStateCodes(){ return usStatesRepository.findAll();}

    // get usstates by like desc
    @GetMapping("/usstates/desc/{statecodevalue}")
    public List<RefDataUsStatesEntity> getUSStateCodeDetails(@PathVariable String statecodevalue){
        return (List<RefDataUsStatesEntity>) usStatesRepository.findByStateDescriptionContainsIgnoreCase(statecodevalue);
    }

}
