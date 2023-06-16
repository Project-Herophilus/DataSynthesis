package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataIndustryStdEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataIndustryStdRepository extends JpaRepository<RefDataIndustryStdEntity, Long> {

    List<RefDataIndustryStdEntity> findByIndustryStdContainsIgnoreCase(String termcode);

}
