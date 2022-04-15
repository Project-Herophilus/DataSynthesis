package io.connectedhealth.idaas.datasynthesis.services;

import java.util.Set;

import javax.inject.Inject;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataExistingNameFirstEntity;
import io.connectedhealth.idaas.datasynthesis.dtos.NameFirst;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class NameFirstServiceTest {
    @Inject
    NameFirstService service;

    @Test
    @Transactional
    public void testInsertFirstHappy() throws DataSynthesisException {
        Common.seed();
        Assertions.assertTrue(service.insertNameFirst(new NameFirst("name1", "F")));
        Assertions.assertTrue(service.insertNameFirst(new NameFirst("name1", "M")));
        Assertions.assertEquals(2, DataExistingNameFirstEntity.count());
    }

    @Test
    @Transactional
    public void testInsertFirstDuplicate() throws DataSynthesisException {
        Common.seed();
        Assertions.assertTrue(service.insertNameFirst(new NameFirst("name1", "F")));
        Assertions.assertFalse(service.insertNameFirst(new NameFirst("name1", "F")));
        Assertions.assertEquals(1, DataExistingNameFirstEntity.count());
        validateNameFirstEntity((DataExistingNameFirstEntity) DataExistingNameFirstEntity.listAll().get(0));
    }

    private void validateNameFirstEntity(DataExistingNameFirstEntity entity) {
        Assertions.assertEquals("name1", entity.getFirstName());
        Assertions.assertEquals("F", entity.getGender());
        Assertions.assertNotNull(entity.getStatus());
        Assertions.assertNotNull(entity.getCreatedDate());
        Assertions.assertNotNull(entity.getRegisteredApp());
    }

    @Test
    @Transactional
    public void testInertFirstNoSeed() {
        Assertions.assertThrows(DataSynthesisException.class, () -> {
            service.insertNameFirst(new NameFirst("name1", "F"));
        });
    }

    @Test
    @Transactional
    public void testGetWithFilter() throws DataSynthesisException {
        Common.seed();
        service.insertNameFirst(new NameFirst("name1", "F"));
        service.insertNameFirst(new NameFirst("name2", "M"));
        Set<DataExistingNameFirstEntity> results = service.findRandomRows(10, "gender", "F");
        Assertions.assertEquals(1, results.size());
        Assertions.assertEquals("F", results.toArray(new DataExistingNameFirstEntity[0])[0].getGender());

        Assertions.assertEquals(2, service.findRandomRows(10).size());
    }
}
