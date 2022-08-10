package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class ZipCode {
    @Schema(readOnly = true)
    public long id;
    
    public String zipCode;
    public String state;
    public String city;

    public ZipCode(String zipCode, String state, String city) {
        this.zipCode = zipCode;
        this.state = state;
        this.city = city;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}