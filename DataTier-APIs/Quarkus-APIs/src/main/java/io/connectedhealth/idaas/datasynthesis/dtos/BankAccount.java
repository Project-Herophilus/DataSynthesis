package io.connectedhealth.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class BankAccount {

    @JsonbProperty(value = "bankAccount")
    public String accountNumber;

    public BankAccount(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
