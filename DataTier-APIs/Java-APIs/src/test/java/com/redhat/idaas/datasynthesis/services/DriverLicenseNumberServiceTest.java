package com.redhat.idaas.datasynthesis.services;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedDriversLicensesEntity;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class DriverLicenseNumberServiceTest {
    @Inject
    DriversLicenseNumberService service;

    @Test
    @Transactional
    public void testALLicense() throws DataSynthesisException {
        Common.seed();
        List<DataGeneratedDriversLicensesEntity> dlns = service.generatedDriverLicenses(10, "AL");
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DataGeneratedDriversLicensesEntity entity : dlns) {
            String num = entity.getDln();
            Assertions.assertTrue(num.length() == 7 || num.length() == 8);
            for(int i = 0; i < 7; i++) {
                char ch = num.charAt(i);
                Assertions.assertTrue( ch >= '0' && ch <= '9');
            }
            if (num.length() == 8) {
                char ch = num.charAt(7);
                Assertions.assertTrue( ch >= '0' && ch <= '9');
            }
        }
    }

    @Test
    @Transactional
    public void testCALicense() throws DataSynthesisException {
        Common.seed();
        List<DataGeneratedDriversLicensesEntity> dlns = service.generatedDriverLicenses(10, "CA");
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DataGeneratedDriversLicensesEntity entity : dlns) {
            String num = entity.getDln();
            Assertions.assertEquals(8, num.length());
            char first = num.charAt(0);
            Assertions.assertTrue( first >= '0' && first <= '9' || first >= 'A' && first <= 'Z');
            for(int i = 1; i < 7; i++) {
                char ch = num.charAt(i);
                Assertions.assertTrue( ch >= '0' && ch <= '9');
            }
        }
    }

    @Test
    @Transactional
    public void testHILicense() throws DataSynthesisException {
        Common.seed();
        List<DataGeneratedDriversLicensesEntity> dlns = service.generatedDriverLicenses(10, "HI");
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DataGeneratedDriversLicensesEntity entity : dlns) {
            String num = entity.getDln();
            Assertions.assertEquals(9, num.length());
            char first = num.charAt(0);
            Assertions.assertEquals('H', first);
            for(int i = 1; i < 8; i++) {
                char ch = num.charAt(i);
                Assertions.assertTrue( ch >= '0' && ch <= '9');
            }
        }
    }

    @Test
    @Transactional
    public void testRILicense() throws DataSynthesisException {
        Common.seed();
        List<DataGeneratedDriversLicensesEntity> dlns = service.generatedDriverLicenses(10, "RI");
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DataGeneratedDriversLicensesEntity entity : dlns) {
            String num = entity.getDln();
            Assertions.assertEquals(7, num.length());
            char first = num.charAt(0);
            Assertions.assertTrue( first >= '0' && first <= '9' || first == 'V');
            for(int i = 1; i < 7; i++) {
                char ch = num.charAt(i);
                Assertions.assertTrue( ch >= '0' && ch <= '9');
            }
        }
    }
}
