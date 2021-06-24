package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.PhoneNumber;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedPhoneNumberEntity;
import com.redhat.idaas.datasynthesis.models.RefDataApplicationEntity;
import com.redhat.idaas.datasynthesis.models.RefDataStatusEntity;

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
        return new PhoneNumber(e.getPhoneNumberValue());
    }

    // Generate Data
    @Transactional
    public List<DataGeneratedPhoneNumberEntity> generatePhoneNumber(long generationCounter) throws DataSynthesisException {
        List<DataGeneratedPhoneNumberEntity> phoneNumberList = new ArrayList<DataGeneratedPhoneNumberEntity>((int) generationCounter);
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
            if (phoneNumberEntity.safePersist()) {
                phoneNumberList.add(phoneNumberEntity);
                i++;
            }
        }

        return phoneNumberList;
    }
}
