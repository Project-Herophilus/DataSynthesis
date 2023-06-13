package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.DataExistingAbaBankingEntity;
import io.connectedhealth.datasynthesis.repository.DataExistingAbaBankingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/*
 *  Code
 *  https://spring.io/guides/gs/rest-service/
 *  https://www.javaguides.net/2019/01/springboot-postgresql-jpa-hibernate-crud-restful-api-tutorial.html
 */

@RestController
@RequestMapping("/api/")
/*@Path("/ababanking")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)*/
public class AbaBankingController {

    @Autowired
    private DataExistingAbaBankingRepository abaBankingRepository;

    // get all employees
    @GetMapping("/ababanking")
    public List<DataExistingAbaBankingEntity> getAllABABanks(){
        return abaBankingRepository.findAll();
    }

    // get abanks by id rest api
    @GetMapping("/ababanking/id/{abaBankId}")
    public DataExistingAbaBankingEntity getABABanksByID(@PathVariable Long abaBankId){
        return abaBankingRepository.findByAbaBankingId(abaBankId);
    }
    // get abanks by like names
    @GetMapping("/ababanking/name/{abaBankname}")
    public List<DataExistingAbaBankingEntity> getABABanksNamesLike(@PathVariable String abaBankname){
        return abaBankingRepository.findByTelegraphicNameContainingIgnoreCase(abaBankname);
    }

}
