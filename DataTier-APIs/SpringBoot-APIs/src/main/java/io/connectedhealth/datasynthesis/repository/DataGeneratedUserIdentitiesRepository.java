package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedUserIdentitiesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedUserIdentitiesRepository extends JpaRepository<DataGeneratedUserIdentitiesEntity, Long> {

    List<DataGeneratedUserIdentitiesEntity> findByUserDomainContainingIgnoreCase(String numbervalue);
    List<DataGeneratedUserIdentitiesEntity> findByUserIdentityValueContainingIgnoreCase(String numbervalue);


}
