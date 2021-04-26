package com.redhat.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class NameFirst {
    @JsonbProperty(value = "firstName")
    public String firstName;

    @JsonbProperty(value = "gender")
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
