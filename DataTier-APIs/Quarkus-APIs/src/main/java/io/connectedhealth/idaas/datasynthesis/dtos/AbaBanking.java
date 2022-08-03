package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class AbaBanking {
    @Schema(readOnly = true)
    public long id;
    
    public String routingNumber;
    public String telegraphicName;
    public String customerName;
    public String city;
    public String state;
    public String zipCode;

    public AbaBanking() {
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}