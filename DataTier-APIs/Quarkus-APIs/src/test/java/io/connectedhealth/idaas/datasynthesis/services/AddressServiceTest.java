package io.connectedhealth.idaas.datasynthesis.services;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedAddressesEntity;
import io.connectedhealth.idaas.datasynthesis.dtos.Address;
import io.connectedhealth.idaas.datasynthesis.dtos.NameLast;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class AddressServiceTest {
    @Inject
    AddressesService addressService;

    @Inject
    NameLastService nameService;

    @Test
    @Transactional
    public void testAddressGeneration() throws Exception {
        Common.seed();
        nameService.insertNameLast(new NameLast("Last1"));
        nameService.insertNameLast(new NameLast("Last2"));

        List<Address> list = addressService.generateAddresses(10, true);
        Assertions.assertEquals(10, list.size());
        Assertions.assertEquals(10, DataGeneratedAddressesEntity.count());
        for (Address entity : list) {
            validateAddressEntry(entity);
        }
    }

    private void validateAddressEntry(Address entity) {
        String address = entity.address1;
        String[] segments = address.split(" ");
        Assertions.assertTrue(segments.length == 3 || segments.length == 4);
        int i = 0;
        Assertions.assertTrue(Integer.parseInt(segments[i++]) < 10000);

        if (segments.length == 4) {
            Assertions.assertTrue(Arrays.stream(AddressesService.DIRECTIONS).anyMatch(segments[i]::equals));
            i++;
        }
        Assertions.assertTrue(segments[i].equals("Last1") || segments[i].equals("Last2"));
        i++;

        Assertions.assertTrue(Arrays.stream(AddressesService.STREET_TYPES).anyMatch(segments[i]::equals));
    }
}
