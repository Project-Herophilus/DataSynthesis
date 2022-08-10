package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class AreaCode {
    @Schema(readOnly = true)
    public long id;
    
    public String areaCodeValue;
    public String timeZone;
    public String stateCode;

    public AreaCode(String areaCodeValue, String timeZone, String stateCode) {
        this.areaCodeValue = areaCodeValue;
        this.timeZone = timeZone;
        this.stateCode = stateCode;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}