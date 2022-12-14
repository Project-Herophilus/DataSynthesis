package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class UserIdentityWithType {
    @Schema(description = "Number of random records to be inserted to database")
    public int count;
 
    public short dataGenTypeId;
    public String domainValue;
 
    @Schema(required = false, description = "optional", nullable = true)
    public String additionalDetail;
 
    @Schema(required = false, description = "Dry run only. Do not actually insert")
    public boolean dryRun = false;

    public UserIdentityWithType() {

    }

    public UserIdentityWithType(int count, short typeId, String domainValue) {
        this(count, typeId, domainValue, null, false);
    }

    public UserIdentityWithType(int count, short typeId, String domainValue, String additionalDetail, boolean dryRun) {
        this.count = count;
        this.dataGenTypeId = typeId;
        this.domainValue = domainValue;
        this.additionalDetail = additionalDetail;
        this.dryRun = dryRun;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}