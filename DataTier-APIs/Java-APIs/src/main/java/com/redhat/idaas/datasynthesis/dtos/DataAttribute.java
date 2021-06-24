package com.redhat.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class DataAttribute {
    public short dataAttributeID;
    public String dataAttributeName;

    public DataAttribute(){

    }

    public DataAttribute(short id, String name) {
        this.dataAttributeID = id;
        this.dataAttributeName = name;
    }

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
