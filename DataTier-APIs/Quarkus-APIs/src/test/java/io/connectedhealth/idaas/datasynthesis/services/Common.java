package io.connectedhealth.idaas.datasynthesis.services;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import org.junit.jupiter.api.Assertions;

public class Common {
    public static void seed() {
        RefDataApplicationEntity app = new RefDataApplicationEntity();
        app.setAppGuid("common");
        app.setApplicationCustomCode("DSynth");
        app.persist(); 

        RefDataStatusEntity status = new RefDataStatusEntity();
        status.setStatusDescription("Active");
        status.persist();
    }

    public static void validatePattern(String patternString, String actual) {
        Pattern pattern = Pattern.compile(patternString);
        Matcher matcher = pattern.matcher(actual);
        Assertions.assertTrue(matcher.matches());        
    }
}
