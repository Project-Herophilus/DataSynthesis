package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataOrganizationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataOrganizationRepository extends JpaRepository<RefDataOrganizationEntity, Long> {

    List<RefDataOrganizationEntity> findByOrganizationNameContainingIgnoreCase(String statecode);

}
