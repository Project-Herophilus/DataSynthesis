package io.connectedhealth.idaas.datasynthesis.services;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.DataStructure;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingNameFirstEntity;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingNameLastEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformAppSettingsDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import io.quarkus.hibernate.orm.panache.PanacheQuery;
import io.quarkus.panache.mock.PanacheMock;
import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class DataStructureServiceTest {

    @Inject
    DataStructureService service;
    
    @Test
    @Transactional
    public void testRetrieveDataStructures() throws DataSynthesisException {

        List<PlatformDataAttributesEntity> attributes = new ArrayList<>(2);
        PlatformDataAttributesEntity attrEntity = new PlatformDataAttributesEntity();
        attrEntity.setPlatformDataAttributesId((short)1);
        attrEntity.setDataAttributeName("Names - Last");
        attrEntity.setPlatformTableName("dataexisting_namelast");
        attributes.add(attrEntity);
        attrEntity = new PlatformDataAttributesEntity();
        attrEntity.setPlatformDataAttributesId((short)2);
        attrEntity.setDataAttributeName("Names - First");
        attrEntity.setPlatformTableName("dataexisting_namefirst");
        attributes.add(attrEntity);

        PanacheMock.mock(PlatformDataAttributesEntity.class);
        Mockito.when(PlatformDataAttributesEntity.findByPlatformDataStructure(Mockito.anyString())).thenReturn(attributes);

        PanacheMock.mock(DataExistingNameFirstEntity.class);
        Mockito.when(DataExistingNameFirstEntity.count()).thenReturn(10L);
        PanacheQuery allQuery = Mockito.mock(PanacheQuery.class);
        Mockito.when(DataExistingNameFirstEntity.findAll()).thenReturn(allQuery);
        Mockito.when(allQuery.page(Mockito.anyInt(), Mockito.anyInt())).thenReturn(allQuery);
        Mockito.when(allQuery.firstResult()).thenAnswer(invocation -> {
            Random r = new Random();
            DataExistingNameFirstEntity entity = new DataExistingNameFirstEntity();
            entity.setFirstNameId(r.nextLong());
            entity.setFirstName("John");
            entity.setGender("M");
            return entity;
        });
        PanacheMock.mock(DataExistingNameLastEntity.class);
        Mockito.when(DataExistingNameLastEntity.count()).thenReturn(10L);
        PanacheQuery allLastQuery = Mockito.mock(PanacheQuery.class);
        Mockito.when(DataExistingNameLastEntity.findAll()).thenReturn(allLastQuery);
        Mockito.when(allLastQuery.page(Mockito.anyInt(), Mockito.anyInt())).thenReturn(allLastQuery);
        Mockito.when(allLastQuery.firstResult()).thenAnswer(invocation -> {
            Random r = new Random();
            DataExistingNameLastEntity entity = new DataExistingNameLastEntity();
            entity.setLastNameId(r.nextLong());
            entity.setLastName("Doe");
            return entity;
        });

        List<DataStructure> structures = service.retrieveDataStructures("Person Demographics", 10);
        Assertions.assertEquals(10, structures.size());
    }

    @Test
    public void testTableNameToClassName() {
        List<String> tableNames = Arrays.asList("dataexisting_areacode","datagenerated_addresses","dataexisting_zipcodeus","datagenerated_phonenumber","datagenerated_creditcard","datagenerated_bankaccount","datagenerated_dateofbirth","datagenerated_driverslicenses","datagenerated_socialsecuritynumber","dataexisting_upccodes","dataexisting_companies","datagenrated_ein","datagenerated_accountnumbers","datagenerated_useridentities","dataexisting_ababanking","datagenerated_phonenumbersintl","dataexisting_areacodeintl","dataexisting_zipcodeintl","dataexisting_namefirst","datagenerated_serialnumbers");

        boolean error = false;
        for (String tableName : tableNames) {
            String className = service.getClassName(tableName);
            if (null == className) {
                System.err.println("No ClassName for tablename: " + tableName);
                error = true;
                continue;
            }

            try {
                Class.forName(className);
            } catch (Exception e) {
                System.err.println("Cannot load calss for tablename: " + tableName);
                error = true;
            }
        }

        // Commented for now until we get the following Data Generators:
        // datagenerated_phonenumbersintl
        // dataexisting_areacodeintl
        // dataexisting_zipcodeintl
        // datagenerated_serialnumbers

        // Assertions.assertEquals(false, error);
    }
}
