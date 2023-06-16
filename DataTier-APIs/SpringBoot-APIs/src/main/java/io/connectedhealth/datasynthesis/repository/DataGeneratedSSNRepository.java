package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataGeneratedSocialSecurityNumberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataGeneratedSSNRepository extends JpaRepository<DataGeneratedSocialSecurityNumberEntity, Long> {

    List<DataGeneratedSocialSecurityNumberEntity> findBySocialSecurityNumberValueContainingIgnoreCase(String numbervalue);

}
