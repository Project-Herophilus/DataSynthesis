package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingAreaCodeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataExistingAreaCodeRepository extends JpaRepository<DataExistingAreaCodeEntity, Long> {

    List<DataExistingAreaCodeEntity> findByAreaCodeValue(String areacodevalue);
    List<DataExistingAreaCodeEntity> findByState_StateId(String statecodeval);
}
