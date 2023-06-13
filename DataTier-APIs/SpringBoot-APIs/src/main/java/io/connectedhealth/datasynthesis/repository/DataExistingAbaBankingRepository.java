package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingAbaBankingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataExistingAbaBankingRepository extends JpaRepository<DataExistingAbaBankingEntity, Long> {

    DataExistingAbaBankingEntity findByAbaBankingId(Long abaBankingId);
    List<DataExistingAbaBankingEntity> findByTelegraphicNameContainingIgnoreCase(String abaBankName);

}
