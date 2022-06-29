package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class Count {
    @Schema(description = "Number of random records to be inserted to database")
    public int count;

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }    
}
