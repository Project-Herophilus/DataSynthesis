package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataModelDataTablesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataModelDataTablesRepository extends JpaRepository<DataModelDataTablesEntity, Long> {

    List<DataModelDataTablesEntity> findByTableNameContainsIgnoreCase(String appdesccode);

}
