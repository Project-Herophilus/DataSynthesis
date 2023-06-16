package io.connectedhealth.datasynthesis.apis;

import io.connectedhealth.datasynthesis.entities.RefDataTimeZonesEntity;
import io.connectedhealth.datasynthesis.repository.RefDataTimeZoneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class TimeZoneController {
    @Autowired
    private RefDataTimeZoneRepository timeZoneRepository;

    // get all timezones
    @GetMapping("/timezones")
    public List<RefDataTimeZonesEntity> getAllTimeZones(){ return timeZoneRepository.findAll();}

    // get timezones by code
    @GetMapping("/timezones/id/{timezonevalue}")
    public List<RefDataTimeZonesEntity> getTimeZoneCodeDetails(@PathVariable String timezonevalue){
        return (List<RefDataTimeZonesEntity>) timeZoneRepository.findByTimeZoneValueContainingIgnoreCase(timezonevalue);
    }
  // TimeZones by TimeZone Desc
    @GetMapping("/timezones/desc/{timezonedesc}")
    public List<RefDataTimeZonesEntity> getTimeZoneDescDetails(@PathVariable String timezonedesc){
        return (List<RefDataTimeZonesEntity>) timeZoneRepository.findByTimeZoneDescContainsIgnoreCase(timezonedesc);
    }

}
