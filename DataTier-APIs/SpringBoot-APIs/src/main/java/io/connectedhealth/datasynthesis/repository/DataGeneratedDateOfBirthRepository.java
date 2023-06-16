package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedDateOfBirthEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedDateOfBirthRepository extends JpaRepository<DataGeneratedDateOfBirthEntity, Long> {

    List<DataGeneratedDateOfBirthEntity> findByDateOfBirthDateContaining(String dobvalue);
    List<DataGeneratedDateOfBirthEntity> findByAgeContaining(Integer agevalue);
}
