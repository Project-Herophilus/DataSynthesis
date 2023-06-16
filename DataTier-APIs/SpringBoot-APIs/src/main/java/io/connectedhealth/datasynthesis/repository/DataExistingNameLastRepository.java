package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingNameLastEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataExistingNameLastRepository extends JpaRepository<DataExistingNameLastEntity, Long> {

    List<DataExistingNameLastEntity> findByLastNameContainingIgnoreCase(String lastName);

}
