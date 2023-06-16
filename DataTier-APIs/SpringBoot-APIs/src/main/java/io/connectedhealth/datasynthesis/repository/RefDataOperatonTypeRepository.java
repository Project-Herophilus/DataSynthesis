package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataOperationTypeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataOperatonTypeRepository extends JpaRepository<RefDataOperationTypeEntity, Long> {

    List<RefDataOperationTypeEntity> findByOperationTypeNameContainingIgnoreCase(String optypecode);

}
