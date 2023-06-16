package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataStatusEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataStatusRepository extends JpaRepository<RefDataStatusEntity, Long> {

    List<RefDataStatusEntity> findByStatusDescriptionContainingIgnoreCase(String StatusDescription);


}
