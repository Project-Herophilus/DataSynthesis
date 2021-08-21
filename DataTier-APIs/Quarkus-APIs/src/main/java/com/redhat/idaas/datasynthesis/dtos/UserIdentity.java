package com.redhat.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class UserIdentity {
    public String userIdentity;
    public String domainValue;
    public String additionalDetail;

    public UserIdentity(String userId, String domainValue, String additionalDetail) {
        this.userIdentity = userId;
        this.domainValue = domainValue;
        this.additionalDetail = additionalDetail;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
