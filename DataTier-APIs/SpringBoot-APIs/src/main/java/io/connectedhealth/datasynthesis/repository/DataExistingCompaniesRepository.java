package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingCompaniesEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface DataExistingCompaniesRepository extends JpaRepository<DataExistingCompaniesEntity, Long> {

    List<DataExistingCompaniesEntity> findByCompanyNameContainingIgnoreCase(String companyname);

}
