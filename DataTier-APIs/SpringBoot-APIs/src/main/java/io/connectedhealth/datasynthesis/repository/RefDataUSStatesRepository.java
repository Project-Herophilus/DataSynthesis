package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataUsStatesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataUSStatesRepository extends JpaRepository<RefDataUsStatesEntity, Long> {

    List<RefDataUsStatesEntity> findByStateDescriptionIgnoreCase(String statecode);
    List<RefDataUsStatesEntity> findByStateDescriptionContainsIgnoreCase(String statecode);

}
