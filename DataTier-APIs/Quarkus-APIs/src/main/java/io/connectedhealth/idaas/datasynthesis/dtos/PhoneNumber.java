package io.connectedhealth.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class PhoneNumber {
    
    @JsonbProperty(value = "phoneNumber")
    public String value;

    public PhoneNumber(String value) {
        this.value = value;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
