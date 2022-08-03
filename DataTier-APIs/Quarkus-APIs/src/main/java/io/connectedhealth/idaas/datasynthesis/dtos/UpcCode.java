package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class UpcCode {
    @Schema(readOnly = true)
    public long id;
    
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