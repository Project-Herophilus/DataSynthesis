package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class NameLast {
    @Schema(readOnly = true)
    public long id;

    public String lastName;

    public NameLast() {
    }

    public NameLast(String name) {
        this.lastName = name;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
