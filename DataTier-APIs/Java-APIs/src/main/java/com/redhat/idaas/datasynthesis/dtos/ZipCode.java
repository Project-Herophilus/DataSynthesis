package com.redhat.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class ZipCode {
    public String areaCodeValue;
    public String timeZone;
    public String stateCode;

    public ZipCode(String areaCodeValue, String timeZone, String stateCode) {
        this.areaCodeValue = areaCodeValue;
        this.timeZone = timeZone;
        this.stateCode = stateCode;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}