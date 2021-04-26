package com.redhat.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class NameLast {
    @JsonbProperty(value = "lastName")
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
