package com.redhat.idaas.datasynthesis.services;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.EIN;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedEinEntity;
import com.redhat.idaas.datasynthesis.models.RefDataApplicationEntity;
import com.redhat.idaas.datasynthesis.models.RefDataStatusEntity;

import org.apache.commons.lang3.StringUtils;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class EINService extends RandomizerService<DataGeneratedEinEntity> {
    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedEinEntity.count();
        }
        return DataGeneratedEinEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedEinEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedEinEntity.findAll();
        }
        return DataGeneratedEinEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    // Generate Data
    @Transactional
    public List<DataGeneratedEinEntity> generateEinNumber(long generationCounter) throws DataSynthesisException {
        List<DataGeneratedEinEntity> einNumberList = new ArrayList<DataGeneratedEinEntity>((int) generationCounter);
        int upperBound1 = 99;
        int upperBound2 = 9999999;
        RefDataApplicationEntity app = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        Timestamp createdDate = new Timestamp(System.currentTimeMillis());

        for (int i = 0; i < generationCounter; ) {
            StringBuilder einNumber = new StringBuilder();
            // Create the first 3 phone number digits
            einNumber.append(StringUtils.leftPad(String.valueOf(rand.nextInt(upperBound1 + 1)), 2, "0")).append('-')
            // Create the last four name and make sure length is correct
            .append(StringUtils.leftPad(String.valueOf(rand.nextInt(upperBound2 + 1)), 7, "0"));

            DataGeneratedEinEntity einNumberEntity = new DataGeneratedEinEntity(einNumber.toString());
            einNumberEntity.setRegisteredApp(app);
            einNumberEntity.setStatus(defaultStatus);
            einNumberEntity.setCreatedDate(createdDate);
            if (einNumberEntity.safePersist()) {
                einNumberList.add(einNumberEntity);
                i++;
            } 
        }

        return einNumberList;
    }

    // Persist Data
    public List<EIN> retrieveRandomEINs(int count) {
        Set<DataGeneratedEinEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new EIN(e.getEinValue())).collect(Collectors.toList());
    }
}
