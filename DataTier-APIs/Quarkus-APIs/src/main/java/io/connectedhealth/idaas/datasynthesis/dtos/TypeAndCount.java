package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

@Schema(name = "TypeAndCount")
public class TypeAndCount {
    @Schema(description = "Number of random records to be inserted to database")
    public int count;

    @Schema(required = false, description = "optional")
    public short dataGenTypeId;

    @Schema(required = false, description = "Dry run only. Do not actually insert")
    public boolean dryRun = false;
    
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
