package io.connectedhealth.idaas.datasynthesis.services;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.DLN;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedDriversLicensesEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class DriverLicenseNumberServiceTest {
    @Inject
    DriversLicensesService service;

    private short[] initDB() {
        Common.seed();

        PlatformDataAttributesEntity dataAttribute = new PlatformDataAttributesEntity();
        dataAttribute.setDataAttributeName("Drivers License Number");
        dataAttribute.persist();

        RefDataDataGenTypesEntity dataType1 = new RefDataDataGenTypesEntity();
        dataType1.setDataGenTypeDescription("AL");
        dataType1.setDefinition("^[0-9]{7,8}$");
        dataType1.setDataAttribute(dataAttribute);
        dataType1.persist();

        RefDataDataGenTypesEntity dataType2 = new RefDataDataGenTypesEntity();
        dataType2.setDataGenTypeDescription("CA");
        dataType2.setDefinition("^[A-Z]{1}[0-9]{7}$");
        dataType2.setDataAttribute(dataAttribute);
        dataType2.persist();

        RefDataDataGenTypesEntity dataType3 = new RefDataDataGenTypesEntity();
        dataType3.setDataGenTypeDescription("HI");
        dataType3.setDefinition("^H[0-9]{8}$");
        dataType3.setDataAttribute(dataAttribute);
        dataType3.persist();

        RefDataDataGenTypesEntity dataType4 = new RefDataDataGenTypesEntity();
        dataType4.setDataGenTypeDescription("RI");
        dataType4.setDefinition("(^V[0-9]{6}$)|(^[0-9]{7}$)");
        dataType4.setDataAttribute(dataAttribute);
        dataType4.persist();

        return new short[]{dataType1.getDataGenTypeId(), dataType2.getDataGenTypeId(), 
            dataType3.getDataGenTypeId(), dataType4.getDataGenTypeId()};
    }

    @Test
    @Transactional
    public void testALLicense() throws DataSynthesisException {
        short[] ids = initDB();
        List<DLN> dlns = service.generatedDriverLicenses(10, ids[0], true);
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DLN entity : dlns) {
            String num = entity.dLNNumber;
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
        short[] ids = initDB();
        List<DLN> dlns = service.generatedDriverLicenses(10, ids[1], true);
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DLN entity : dlns) {
            String num = entity.dLNNumber;
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
        short[] ids = initDB();
        List<DLN> dlns = service.generatedDriverLicenses(10, ids[2], true);
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DLN entity : dlns) {
            String num = entity.dLNNumber;
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
        short[] ids = initDB();
        List<DLN> dlns = service.generatedDriverLicenses(10, ids[3], true);
        Assertions.assertEquals(10, DataGeneratedDriversLicensesEntity.count());
        for(DLN entity : dlns) {
            String num = entity.dLNNumber;
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
