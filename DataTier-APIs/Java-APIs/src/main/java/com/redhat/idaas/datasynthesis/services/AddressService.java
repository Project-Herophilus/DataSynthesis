package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.common.Randomization;
import com.redhat.idaas.datasynthesis.dtos.Address;
import com.redhat.idaas.datasynthesis.dtos.NameLast;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedAddressesEntity;
import com.redhat.idaas.datasynthesis.models.RefDataApplicationEntity;
import com.redhat.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AddressService extends RandomizerService<DataGeneratedAddressesEntity> {
    final static String[] STREET_TYPES = new String[] {"Way", "Ave", "Lane", "Street", "Court", "Place", "Walk", "Pike", "Run"};
    final static String[] DIRECTIONS = new String[] {"N", "S", "E", "W", "NW", "NE", "SW", "SE"};

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedAddressesEntity.count();
        }
        return DataGeneratedAddressesEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedAddressesEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedAddressesEntity.findAll();
        }
        return DataGeneratedAddressesEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Transactional
    public List<DataGeneratedAddressesEntity> generateAddresses(int count) throws DataSynthesisException {
        List<DataGeneratedAddressesEntity> entities = new ArrayList<DataGeneratedAddressesEntity>();

        Randomization rndService = new Randomization(this.rand);
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());
        List<NameLast> lastNames = new NameLastService().retrieveNameLasts(count);
        String[] lastNameArray = lastNames.stream().map(e -> e.lastName).toArray(String[]::new);
        for(int i = 0; i < count;) {
            DataGeneratedAddressesEntity entity = new DataGeneratedAddressesEntity();
            entity.setRegisteredApp(app);
            entity.setStatus(defaultStatus);
            entity.setCreatedDate(createdDate);

            String address = rand.nextInt(10000) + 1 + " ";
            String direction = rndService.randomEntry(DIRECTIONS, 25);
            if (direction.length() > 0) {
                address = address + direction + " ";
            }
            address = address + rndService.randomEntry(lastNameArray) + " " + rndService.randomEntry(STREET_TYPES);

            entity.setAddressStreet(address);

            if (entity.safePersist()) {
                entities.add(entity);
                i++;
            }
        }

        return entities;
    }

    public List<Address> retrieveAddresses(int count) {
        Set<DataGeneratedAddressesEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new Address(e.getAddressStreet())).collect(Collectors.toList());
    }    
}
