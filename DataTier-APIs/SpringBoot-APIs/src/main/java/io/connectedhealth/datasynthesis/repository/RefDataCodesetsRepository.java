package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataCodeSetEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataCodesetsRepository extends JpaRepository<RefDataCodeSetEntity, Long> {

    List<RefDataCodeSetEntity> findByCodeSetNameContainingIgnoreCase(String countrycode);

}
