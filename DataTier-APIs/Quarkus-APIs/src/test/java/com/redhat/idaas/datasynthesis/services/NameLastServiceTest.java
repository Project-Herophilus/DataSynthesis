package com.redhat.idaas.datasynthesis.services;

import javax.inject.Inject;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataExistingNameLastEntity;
import com.redhat.idaas.datasynthesis.dtos.NameLast;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class NameLastServiceTest {
    @Inject
    NameLastService service;

    @Test
    @Transactional
    public void testInsertLastHappy() throws DataSynthesisException {
        Common.seed();
        Assertions.assertTrue(service.insertNameLast(new NameLast("name1")));
        Assertions.assertTrue(service.insertNameLast(new NameLast("name2")));
        Assertions.assertEquals(2, DataExistingNameLastEntity.count());
    }

    @Test
    @Transactional
    public void testInsertLastDuplicate() throws DataSynthesisException {
        Common.seed();
        Assertions.assertTrue(service.insertNameLast(new NameLast("name1")));
        Assertions.assertFalse(service.insertNameLast(new NameLast("name1")));
        Assertions.assertEquals(1, DataExistingNameLastEntity.count());
        validateNameLastEntity((DataExistingNameLastEntity)DataExistingNameLastEntity.listAll().get(0));
    }

    private void validateNameLastEntity(DataExistingNameLastEntity entity){
        Assertions.assertEquals("name1", entity.getLastName());
        Assertions.assertNotNull(entity.getStatus());
        Assertions.assertNotNull(entity.getCreatedDate());
        Assertions.assertNotNull(entity.getRegisteredApp());
    }

    @Test
    @Transactional
    public void testInertLastNoSeed() {
        Assertions.assertThrows(DataSynthesisException.class, () -> {
            service.insertNameLast(new NameLast("name1"));
        });
    }
}
