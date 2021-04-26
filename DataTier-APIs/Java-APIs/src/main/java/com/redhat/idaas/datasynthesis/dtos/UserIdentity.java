package com.redhat.idaas.datasynthesis.dtos;

import javax.json.bind.annotation.JsonbProperty;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class UserIdentity {
    
    @JsonbProperty(value = "userIdentity")
    public String userId;
    public String domainValue;
    public String additionalDetail;

    public UserIdentity(String userId, String domainValue, String additionalDetail) {
        this.userId = userId;
        this.domainValue = domainValue;
        this.additionalDetail = additionalDetail;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
