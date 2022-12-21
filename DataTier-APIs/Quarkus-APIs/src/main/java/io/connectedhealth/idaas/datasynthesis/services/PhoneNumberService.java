package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.PhoneNumber;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedPhoneNumberEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import org.apache.commons.lang3.StringUtils;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class PhoneNumberService extends RandomizerService<DataGeneratedPhoneNumberEntity, PhoneNumber> {
    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedPhoneNumberEntity.count();
        }
        return DataGeneratedPhoneNumberEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedPhoneNumberEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedPhoneNumberEntity.findAll();
        }
        return DataGeneratedPhoneNumberEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PhoneNumber mapEntityToDTO(DataGeneratedPhoneNumberEntity e) {
        PhoneNumber number = new PhoneNumber(e.getPhoneNumberValue());
        number.id = e.getPhoneNumberId();
        return number;
    }

    // Generate Data
    @Transactional
    public List<PhoneNumber> generatePhoneNumber(long generationCounter, boolean dryRun) throws DataSynthesisException {
        List<PhoneNumber> phoneNumberList = new ArrayList<PhoneNumber>((int) generationCounter);
        int upperBound1 = 999;
        int upperBound2 = 9999;
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        for (int i = 0; i < generationCounter;) {
            StringBuilder phoneNumber = new StringBuilder();
            // Create the first 3 phone number digits
            phoneNumber.append(StringUtils.leftPad(String.valueOf(rand.nextInt(upperBound1 + 1)), 3, "0")).append('-')
                    // Create the last four name and make sure length is correct
                    .append(StringUtils.leftPad(String.valueOf(rand.nextInt(upperBound2 + 1)), 4, "0"));

            DataGeneratedPhoneNumberEntity phoneNumberEntity = new DataGeneratedPhoneNumberEntity(phoneNumber.toString());
            phoneNumberEntity.setRegisteredApp(app);
            phoneNumberEntity.setStatus(defaultStatus);
            phoneNumberEntity.setCreatedDate(createdDate);
            if (dryRun || phoneNumberEntity.safePersist()) {
                phoneNumberList.add(mapEntityToDTO(phoneNumberEntity));
                i++;
            }
        }

        return phoneNumberList;
    }

    public PhoneNumber retrieve(long id) throws DataSynthesisException {
        DataGeneratedPhoneNumberEntity entity = DataGeneratedPhoneNumberEntity.findById(id);
        if (entity == null) {
            throw new DataSynthesisException("record does not exist");
        }
        return mapEntityToDTO(entity);
    }
}
