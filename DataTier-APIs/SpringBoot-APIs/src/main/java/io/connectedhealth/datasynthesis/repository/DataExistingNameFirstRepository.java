package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingNameFirstEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataExistingNameFirstRepository extends JpaRepository<DataExistingNameFirstEntity, Long> {

    List<DataExistingNameFirstEntity> findByFirstNameContainingIgnoreCase(String firstName);
    List<DataExistingNameFirstEntity> findByFirstNameContainingIgnoreCaseAndGenderContainingIgnoreCase(String firstName, String genderValue);


}
