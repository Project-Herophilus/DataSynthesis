package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class SSN {
    @Schema(readOnly = true)
    public long id;

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
