package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingNameLastEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingNameLastRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class NameLastController {

    @Autowired
    private DataExistingNameLastRepository nameLastRepository;

    // get all lastnames
    @GetMapping("/lastname")
    public List<DataExistingNameLastEntity> getAllLastNames(){
        return nameLastRepository.findAll();
    }

    // get lastname by like names
    @GetMapping("/lastname/name/{lastNameValue}")
    public List<DataExistingNameLastEntity> getLastNameLike(@PathVariable String lastNameValue){
        return nameLastRepository.findByLastNameContainingIgnoreCase(lastNameValue);
    }

}
