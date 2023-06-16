package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedEinEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedEINRepository extends JpaRepository<DataGeneratedEinEntity, Long> {

    List<DataGeneratedEinEntity> findByEinValueContainingIgnoreCase(String accountnumbervalue);

}
