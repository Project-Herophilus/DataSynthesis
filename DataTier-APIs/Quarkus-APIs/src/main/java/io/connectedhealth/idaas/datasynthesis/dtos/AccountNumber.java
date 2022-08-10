package io.connectedhealth.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class AccountNumber {
    @Schema(readOnly = true)
    public long id;
    
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
