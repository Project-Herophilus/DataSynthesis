package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.PlatformDataAttributesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PlatformDataAttributesRepository extends JpaRepository<PlatformDataAttributesEntity, Long> {

    List<PlatformDataAttributesEntity> findByDataAttributeNameContainingIgnoreCase(String codeDesc);

}
