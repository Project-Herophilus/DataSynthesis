package io.connectedhealth.idaas.datasynthesis.services;

import java.util.ArrayList;
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
        attributes.add(attrEntity);
        attrEntity = new PlatformDataAttributesEntity();
        attrEntity.setPlatformDataAttributesId((short)2);
        attrEntity.setDataAttributeName("Names - First");
        attributes.add(attrEntity);

        PanacheMock.mock(PlatformDataAttributesEntity.class);
        Mockito.when(PlatformDataAttributesEntity.findByPlatformDataStructure(Mockito.anyString())).thenReturn(attributes);

        PlatformAppSettingsDataAttributesEntity last = new PlatformAppSettingsDataAttributesEntity();
        last.setServiceClassName("NameLastService");
        PlatformAppSettingsDataAttributesEntity first = new PlatformAppSettingsDataAttributesEntity();
        first.setServiceClassName("NameFirstService");

        PanacheMock.mock(PlatformAppSettingsDataAttributesEntity.class);
        Mockito.when(PlatformAppSettingsDataAttributesEntity.findByPlatformDataAttribute(Mockito.eq((short)1))).thenReturn(last);
        Mockito.when(PlatformAppSettingsDataAttributesEntity.findByPlatformDataAttribute(Mockito.eq((short)2))).thenReturn(first);

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
}
