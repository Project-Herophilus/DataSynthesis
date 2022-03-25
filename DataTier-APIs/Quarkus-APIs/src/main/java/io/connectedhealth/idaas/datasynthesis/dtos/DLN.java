package io.connectedhealth.idaas.datasynthesis.dtos;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class DLN {
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
