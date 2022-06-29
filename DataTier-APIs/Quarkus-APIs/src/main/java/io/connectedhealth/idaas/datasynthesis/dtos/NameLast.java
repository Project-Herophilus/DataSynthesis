package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class NameLast {
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
