package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataModelDataDomainsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataModelDataDomainsRepository extends JpaRepository<DataModelDataDomainsEntity, Long> {

    List<DataModelDataDomainsEntity> findByDomainInformationContainingIgnoreCase(String domaindesccode);

}
