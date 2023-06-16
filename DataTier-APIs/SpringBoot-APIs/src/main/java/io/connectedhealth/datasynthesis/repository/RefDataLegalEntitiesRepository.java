package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataLegalEntityEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataLegalEntitiesRepository extends JpaRepository<RefDataLegalEntityEntity, Long> {

    List<RefDataLegalEntityEntity> findByLocationNameContainingIgnoreCase(String locationDetails);

}
