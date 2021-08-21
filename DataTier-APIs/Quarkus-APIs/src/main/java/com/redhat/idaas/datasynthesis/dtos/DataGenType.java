package com.redhat.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@Schema(name = "DataGenType")
public class DataGenType {
    @Schema(readOnly = true)
    public short dataGenID;
    public String description;
    public String definition;
    public short dataAttributeID;
    @Schema(required = false, description = "optional", defaultValue = "1")
    public short statusID;

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
