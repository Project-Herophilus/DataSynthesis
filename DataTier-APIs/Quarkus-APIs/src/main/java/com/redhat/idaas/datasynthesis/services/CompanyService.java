package com.redhat.idaas.datasynthesis.services;

import java.util.Arrays;
import java.sql.Timestamp;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.Company;
import com.redhat.idaas.datasynthesis.models.DataExistingCompaniesEntity;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class CompanyService extends RandomizerService<DataExistingCompaniesEntity, Company> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingCompaniesEntity.count();
        }
        return DataExistingCompaniesEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataExistingCompaniesEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataExistingCompaniesEntity.findAll();
        }
        return DataExistingCompaniesEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected Company mapEntityToDTO(DataExistingCompaniesEntity e) {
        return new Company(e.getCompanyName());
    }

    @Transactional
    public boolean insertCompany(Company company) throws DataSynthesisException {
        DataExistingCompaniesEntity entity = new DataExistingCompaniesEntity();
        entity.setCompanyName(company.companyName);
        entity.setRegisteredApp(getRegisteredApp());
        entity.setStatus(getDefaultStatus());
        entity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        return entity.safePersist();
    }
}
