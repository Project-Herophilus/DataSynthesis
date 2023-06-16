package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingZipCodeUsEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface DataExistingZipCodeRepository extends JpaRepository<DataExistingZipCodeUsEntity, Long> {

    //List<DataExistingZipCodeUsEntity>
}
