package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataApplicationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataApplicationsRepository extends JpaRepository<RefDataApplicationEntity, Long> {

    List<RefDataApplicationEntity> findByApplicationDescContainingIgnoreCase(String appdesccode);

}
