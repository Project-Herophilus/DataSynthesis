package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@Schema(name = "NameFirst")
public class NameFirst {
    @Schema(readOnly = true)
    public long id;

    public String firstName;

    @Schema(enumeration = {"F", "M"})
    public String gender;

    public NameFirst() {
    }

    public NameFirst(String name, String gender) {
        this.firstName = name;
        this.gender = gender;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
