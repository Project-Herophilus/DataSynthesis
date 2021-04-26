package com.redhat.idaas.datasynthesis.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.models.DataGeneratedDateOfBirthEntity;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class DateOfBirthServiceTest {
    @Inject
    DateOfBirthService service;

    @Test
    @Transactional
    public void testDobGeneration() throws Exception {
        Common.seed();
        List<DataGeneratedDateOfBirthEntity> list = service.generatedDateOfBirthEntities(10);
        Assertions.assertEquals(10, list.size());
        Assertions.assertEquals(10, DataGeneratedDateOfBirthEntity.count());
        validateDobEntry(list.get(0));
    }

    private void validateDobEntry(DataGeneratedDateOfBirthEntity entity) throws ParseException {
        String patternString = "^([1-9]|1[0-2])/([1-9]|1\\d|2\\d|3[01])/(19|20)\\d{2}$";
        Common.validatePattern(patternString, entity.getDateOfBirth());

        Assertions.assertTrue(entity.getAge() <= 100);

        SimpleDateFormat formatter = new SimpleDateFormat("M/d/yyyy");
        Date dob = formatter.parse(entity.getDateOfBirth());
        //accuracy up to day
        Assertions.assertTrue(Math.abs(dob.getTime() - entity.getDateOfBirthDate().getTime())/86400000 <= 1);

        Assertions.assertNotNull(entity.getStatus());
        Assertions.assertNotNull(entity.getCreatedDate());
        Assertions.assertNotNull(entity.getRegisteredApp());
    }
    
}
