package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class SSN {
    public String socialSecurityNumber;

    public SSN(String socialSecurityNumberValue) {
        this.socialSecurityNumber = socialSecurityNumberValue;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
