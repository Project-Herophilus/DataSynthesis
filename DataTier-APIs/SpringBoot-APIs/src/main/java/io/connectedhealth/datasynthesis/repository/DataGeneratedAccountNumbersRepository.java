package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedAccountNumbersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedAccountNumbersRepository extends JpaRepository<DataGeneratedAccountNumbersEntity, Long> {

    List<DataGeneratedAccountNumbersEntity> findByAccountNumberValueNotContainsIgnoreCase(String accountnumbervalue);

}
