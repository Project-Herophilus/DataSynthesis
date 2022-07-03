package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.common.Randomization;
import io.connectedhealth.idaas.datasynthesis.dtos.Address;
import io.connectedhealth.idaas.datasynthesis.dtos.NameLast;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedAddressesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AddressesService extends RandomizerService<DataGeneratedAddressesEntity, Address> {
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

    @Override
    protected Address mapEntityToDTO(DataGeneratedAddressesEntity e) {
        return new Address(e.getAddressStreet());
    }

    @Transactional
    public List<DataGeneratedAddressesEntity> generateAddresses(int count) throws DataSynthesisException {
        List<DataGeneratedAddressesEntity> entities = new ArrayList<DataGeneratedAddressesEntity>();

        Randomization rndService = new Randomization(this.rand);
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());
        List<NameLast> lastNames = new NameLastService().retrieveRandomData(count);
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
}