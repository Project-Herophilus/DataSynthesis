package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.PlatformAppSettingEntity;
import io.connectedhealth.datasynthesis.repository.PlatformAppSettingsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PlatformAppSettingsController {

    @Autowired
    private PlatformAppSettingsRepository platformAppSettingsRepository;

    // get all platform data attributes
    @GetMapping("/platformappsettings")
    public List<PlatformAppSettingEntity> getAllPlatformAppSettings(){
        return platformAppSettingsRepository.findAll();
    }

    // get datagentypes by like names
    @GetMapping("/platformappsettings/desc/{datatypedesc}")
    public List<PlatformAppSettingEntity> getDataGenTypesLike(@PathVariable String datatypedesc){
        return platformAppSettingsRepository.findByAppSettingNameContainingIgnoreCase(datatypedesc);
    }

}
