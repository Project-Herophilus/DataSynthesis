package com.redhat.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@Schema(name = "TypeAndCount")
public class TypeAndCount {
    @Schema(description = "Number of random records to be inserted to database")
    public int count;

    @Schema(required = false, description = "optional")
    public short dataGenTypeId;
    
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
