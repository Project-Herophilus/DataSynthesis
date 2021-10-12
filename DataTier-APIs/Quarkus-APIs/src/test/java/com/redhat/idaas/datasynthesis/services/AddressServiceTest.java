package com.redhat.idaas.datasynthesis.services;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.models.DataGeneratedAddressesEntity;
import com.redhat.idaas.datasynthesis.dtos.NameLast;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class AddressServiceTest {
    @Inject
    AddressService addressService;

    @Inject
    NameLastService nameService;

    @Test
    @Transactional
    public void testAddressGeneration() throws Exception {
        Common.seed();
        nameService.insertNameLast(new NameLast("Last1"));
        nameService.insertNameLast(new NameLast("Last2"));

        List<DataGeneratedAddressesEntity> list = addressService.generateAddresses(10);
        Assertions.assertEquals(10, list.size());
        Assertions.assertEquals(10, DataGeneratedAddressesEntity.count());
        for (DataGeneratedAddressesEntity entity : list) {
            validateAddressEntry(entity);
        }
    }

    private void validateAddressEntry(DataGeneratedAddressesEntity entity) {
        String address = entity.getAddressStreet();
        String[] segments = address.split(" ");
        Assertions.assertTrue(segments.length == 3 || segments.length == 4);
        int i = 0;
        Assertions.assertTrue(Integer.parseInt(segments[i++]) < 10000);

        if (segments.length == 4) {
            Assertions.assertTrue(Arrays.stream(AddressService.DIRECTIONS).anyMatch(segments[i]::equals));
            i++;
        }
        Assertions.assertTrue(segments[i].equals("Last1") || segments[i].equals("Last2"));
        i++;

        Assertions.assertTrue(Arrays.stream(AddressService.STREET_TYPES).anyMatch(segments[i]::equals));
    }
}
