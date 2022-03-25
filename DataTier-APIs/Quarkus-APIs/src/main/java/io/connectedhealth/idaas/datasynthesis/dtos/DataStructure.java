package io.connectedhealth.idaas.datasynthesis.dtos;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class DataStructure {

    public List<Object> object;

    public DataStructure() {
        object = new ArrayList<>();
    }
    
    public DataStructure(List<Object> object) {
        this.object = object;
    }

    public void addObject(Object p) {
       if (null == object) {
        object = new ArrayList<>();
       } 

       object.add(p);
    }

    //toString
    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
