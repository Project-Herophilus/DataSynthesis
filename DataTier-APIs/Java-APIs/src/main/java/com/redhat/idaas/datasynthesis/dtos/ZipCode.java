package com.redhat.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class ZipCode {
    public String zipCode;
    public String state;
    public String city;

    public ZipCode(String zipCode, String state, String city) {
        this.zipCode = zipCode;
        this.state = state;
        this.city = city;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}