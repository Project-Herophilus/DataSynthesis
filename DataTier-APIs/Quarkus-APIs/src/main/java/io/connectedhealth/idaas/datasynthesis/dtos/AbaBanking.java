package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class AbaBanking {
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