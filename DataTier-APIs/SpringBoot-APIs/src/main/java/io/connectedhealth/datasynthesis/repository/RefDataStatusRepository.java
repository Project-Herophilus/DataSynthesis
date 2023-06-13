package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataStatusEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface RefDataStatusRepository extends JpaRepository<RefDataStatusEntity, Long> {

    RefDataStatusRepository findByStatusDescription(String StatusDescription);

}
