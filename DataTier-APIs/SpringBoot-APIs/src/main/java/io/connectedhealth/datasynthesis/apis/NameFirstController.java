package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingNameFirstEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingNameFirstRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class NameFirstController {

    @Autowired
    private DataExistingNameFirstRepository nameFirstRepository;

    // get all firstnames
    @GetMapping("/firstname")
    public List<DataExistingNameFirstEntity> getAllFirstNames(){
        return nameFirstRepository.findAll();
    }

    // get firstname by like names
    @GetMapping("/firstname/name/{firstNameValue}")
    public List<DataExistingNameFirstEntity> getFirstNameLike(@PathVariable String firstNameValue){
        return nameFirstRepository.findByFirstNameContainingIgnoreCase(firstNameValue);
    }

    // get firstname by like names with gender
    @GetMapping("/firstname/name/{firstNameValue}/gender/{genderValue}")
    public List<DataExistingNameFirstEntity> getFirstNameWithGenderLike(@PathVariable String firstNameValue,@PathVariable String genderValue){
        return nameFirstRepository.findByFirstNameContainingIgnoreCaseAndGenderContainingIgnoreCase(firstNameValue, genderValue);
    }
}
