package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class EIN {
    @Schema(readOnly = true)
    public long id;

    public String einNumber;

    public EIN(String einNumber) {
        this.einNumber = einNumber;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
