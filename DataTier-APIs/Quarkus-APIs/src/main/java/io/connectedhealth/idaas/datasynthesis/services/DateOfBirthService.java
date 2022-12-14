package io.connectedhealth.idaas.datasynthesis.services;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.BirthDate;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedDateOfBirthEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class DateOfBirthService extends RandomizerService<DataGeneratedDateOfBirthEntity, BirthDate> {
    private final long MILLS_IN_100YRS = 3155695200000L; // milliseconds in 100 years
    private final int DAYS_IN_100YRS = 36525;
    private final long MILLS_IN_DAY = 86400000L;

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedDateOfBirthEntity.count();
        }
        return DataGeneratedDateOfBirthEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedDateOfBirthEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedDateOfBirthEntity.findAll();
        }
        return DataGeneratedDateOfBirthEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected BirthDate mapEntityToDTO(DataGeneratedDateOfBirthEntity e) {
        BirthDate bod = new BirthDate(e.getDateOfBirth(), e.getDateOfBirthDate(), e.getAge());
        bod.id = e.getDateofBirthsId();
        return bod;
    }

    public BirthDate retrieve(long id) throws DataSynthesisException {
        DataGeneratedDateOfBirthEntity entity = DataGeneratedDateOfBirthEntity.findById(id);
        if(entity == null)
            throw new DataSynthesisException("Record does not exist");
        return mapEntityToDTO(entity);
    }

    // Create Generated Data
    @Transactional
    public List<BirthDate> generatedDateOfBirthEntities(int count, boolean dryRun) throws DataSynthesisException {
        long now = System.currentTimeMillis();
        Timestamp createdDate = new Timestamp(now);
        RefDataApplicationEntity registeredApp = getRegisteredApp();
        RefDataStatusEntity defaultStatus = getDefaultStatus();
        SimpleDateFormat sdf = new SimpleDateFormat("M/d/yyyy");
        List<BirthDate> entities = new ArrayList<BirthDate>();

        for(int i = 0; i<count;) {
            long dobMills = this.rand.nextInt(DAYS_IN_100YRS) * MILLS_IN_DAY + now - MILLS_IN_100YRS;
            Date dob = new Date(dobMills);

            DataGeneratedDateOfBirthEntity entity = new DataGeneratedDateOfBirthEntity();            
            entity.setRegisteredApp(registeredApp);
            entity.setStatus(defaultStatus);
            entity.setDateOfBirthDate(dob);
            entity.setDateOfBirth(sdf.format(dob));
            entity.setAge((int)((now - dobMills) / MILLS_IN_DAY / 365));
            entity.setCreatedDate(createdDate);

            if (dryRun || entity.safePersist()) {
                entities.add(mapEntityToDTO(entity));
                i++;
            }
        }

        return entities;
    } 
}
