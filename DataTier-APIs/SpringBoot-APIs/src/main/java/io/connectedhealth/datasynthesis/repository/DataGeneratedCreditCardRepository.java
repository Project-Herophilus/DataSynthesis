package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedCreditCardEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedCreditCardRepository extends JpaRepository<DataGeneratedCreditCardEntity, Long> {

    List<DataGeneratedCreditCardEntity> findByCreditCardNumberContainingIgnoreCase(String bankaccountnumbervalue);

}
