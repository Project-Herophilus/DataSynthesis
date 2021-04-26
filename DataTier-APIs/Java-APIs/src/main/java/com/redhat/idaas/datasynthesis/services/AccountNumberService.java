package com.redhat.idaas.datasynthesis.services;

import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;

import com.redhat.idaas.datasynthesis.dtos.AccountNumber;
import com.redhat.idaas.datasynthesis.models.DataGeneratedAccountNumbersEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class AccountNumberService extends RandomizerService<DataGeneratedAccountNumbersEntity> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedAccountNumbersEntity.count();
        }
        return DataGeneratedAccountNumbersEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedAccountNumbersEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedAccountNumbersEntity.findAll();
        }
        return DataGeneratedAccountNumbersEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    public List<AccountNumber> retrieveRandomAccountNumbers(int count) {
        Set<DataGeneratedAccountNumbersEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new AccountNumber(e.getAccountNumberValue())).collect(Collectors.toList());
    }
}
