package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.RefDataTimeZonesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RefDataTimeZoneRepository extends JpaRepository<RefDataTimeZonesEntity, Long> {

    List<RefDataTimeZonesEntity> findByTimeZoneValueContainingIgnoreCase(String timezonevalue);
    List<RefDataTimeZonesEntity> findByTimeZoneDescContainsIgnoreCase(String timezonedesc);
   /* List<RefDataTimeZonesEntity> findByTimeZoneDescIgnoreCase(String timezonedesc);
    List<RefDataTimeZonesEntity> findByTimeZoneValueContainingIgnoreCasee(String timezone);*/

}
