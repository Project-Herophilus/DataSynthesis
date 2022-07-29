package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.eclipse.microprofile.openapi.annotations.media.Schema;

public class DLN {
    @Schema(readOnly = true)
    public long id;

    public String dLNNumber;
    public String dLNState;
    public String completeDLN;

    public DLN(String dLNNumber, String dLNState, String completeDLN) {
        this.dLNNumber = dLNNumber;
        this.dLNState = dLNState;
        this.completeDLN = completeDLN;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
