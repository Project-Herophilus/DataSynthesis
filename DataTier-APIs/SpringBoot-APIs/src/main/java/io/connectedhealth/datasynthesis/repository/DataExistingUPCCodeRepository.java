package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.DataExistingUpcCodesEntity;
import org.springframework.data.jpa.repository.JpaRepository;


public interface DataExistingUPCCodeRepository extends JpaRepository<DataExistingUpcCodesEntity, Long> {

    //List<DataExistingUpcCodesEntity> FindByUPCCodeDescContainsIgnoreCase(String upccode);
}
