package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedPhoneNumberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedPhoneNumberRepository extends JpaRepository<DataGeneratedPhoneNumberEntity, Long> {

    List<DataGeneratedPhoneNumberEntity> findByPhoneNumberValueContainingIgnoreCase(String numbervalue);

}
