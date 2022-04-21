package io.connectedhealth.idaas.datasynthesis.dtos;

import java.util.Date;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class BirthDate {
    public String dateOfBirth;
    public Date dateOfBirthDate;
    public int age;

    public BirthDate(String dateOfBirth, Date dateOfBirthDate, int age) {
        this.dateOfBirth = dateOfBirth;
        this.dateOfBirthDate = dateOfBirthDate;
        this.age = age;
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
