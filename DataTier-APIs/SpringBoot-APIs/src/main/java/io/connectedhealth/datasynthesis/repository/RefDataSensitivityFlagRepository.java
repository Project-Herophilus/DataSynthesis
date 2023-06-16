package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataSensitivityFlagEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataSensitivityFlagRepository extends JpaRepository<RefDataSensitivityFlagEntity, Long> {

    List<RefDataSensitivityFlagEntity> findBySensitiveFlagDescContainingIgnoreCase(String sensitivitycode);


}
