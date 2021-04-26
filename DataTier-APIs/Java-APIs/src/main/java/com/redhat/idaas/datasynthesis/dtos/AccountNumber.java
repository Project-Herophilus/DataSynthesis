package com.redhat.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class AccountNumber {
    @JsonbProperty(value = "accountNumber")
    public String value;

    public AccountNumber(String value) {
        this.value = value;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
