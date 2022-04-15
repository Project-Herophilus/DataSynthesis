package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class UpcCode {
    public String upcCode;
    public String productName;

    public UpcCode() {
    }

    public UpcCode(String code, String product) {
        upcCode = code;
        productName = product;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}