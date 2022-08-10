package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class Company {
    @Schema(readOnly = true)
    public long id;

    public String companyName;

    public Company() {
    }

    public Company(String name) {
        companyName = name;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}