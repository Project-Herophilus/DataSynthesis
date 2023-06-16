package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataGeneratedEinEntity;
import io.connectedhealth.datasynthesis.repository.DataGeneratedEINRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class EINController {
    @Autowired
    private DataGeneratedEINRepository einRepository;

    // get all eins
    @GetMapping("/ein")
    public List<DataGeneratedEinEntity> getAllEINs(){ return einRepository.findAll();}

    // get accountnumbers like specific value
    @GetMapping("/ein/value/{numbervalue}")
    public List<DataGeneratedEinEntity> getCreditCardNumber(@PathVariable String numbervalue){
        return (List<DataGeneratedEinEntity>) einRepository.findByEinValueContainingIgnoreCase(numbervalue);
    }


}
