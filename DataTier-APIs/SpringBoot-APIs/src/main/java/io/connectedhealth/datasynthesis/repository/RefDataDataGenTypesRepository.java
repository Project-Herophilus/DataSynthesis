package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataDataGenTypesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataDataGenTypesRepository extends JpaRepository<RefDataDataGenTypesEntity, Long> {

    List<RefDataDataGenTypesEntity> findByDataGenTypeDescriptionContainingIgnoreCase(String appdesccode);

}
