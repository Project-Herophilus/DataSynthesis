package io.connectedhealth.datasynthesis.repository;

import io.connectedhealth.datasynthesis.entities.PlatformAppSettingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlatformAppSettingsRepository extends JpaRepository<PlatformAppSettingEntity, Long> {

    List<PlatformAppSettingEntity> findByAppSettingNameContainingIgnoreCase(String sensitivitycode);


}
