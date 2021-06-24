package com.redhat.idaas.datasynthesis.services;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.AccountNumber;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.models.DataGeneratedAccountNumbersEntity;
import com.redhat.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import com.redhat.idaas.datasynthesis.models.RefDataDataGenTypesEntity;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class AccountNumberServiceTest {
    @Inject
    AccountNumberService service;

    private final static String GOLD_FORMAT = "^G4[0-9]{12}(?:[0-9]{3})?$";
    private final static String PLATINUM_FORMAT = "^P5[1-5][0-9]{14}$";

    private short[] initDB() {
        Common.seed();
        PlatformDataAttributesEntity dataAttribute = new PlatformDataAttributesEntity();
        dataAttribute.setDataAttributeName("Account Numbers");
        dataAttribute.persist();

        RefDataDataGenTypesEntity dataType1 = new RefDataDataGenTypesEntity();
        dataType1.setDataGenTypeDescription("Gold");
        dataType1.setDefinition(GOLD_FORMAT);
        dataType1.setDataAttribute(dataAttribute);
        dataType1.persist();

        RefDataDataGenTypesEntity dataType2 = new RefDataDataGenTypesEntity();
        dataType2.setDataGenTypeDescription("Platinum");
        dataType2.setDefinition(PLATINUM_FORMAT);
        dataType2.setDataAttribute(dataAttribute);
        dataType2.persist();

        return new short[]{dataType1.getDataGenTypeId(), dataType2.getDataGenTypeId()};
    }

    @Test
    @Transactional
    public void testRandomGenerateAndRetrieve() throws DataSynthesisException {
        initDB();
        service.generateAccountNumbers(10, null);
        Assertions.assertEquals(10, DataGeneratedAccountNumbersEntity.count());

        List<AccountNumber> accounts = service.retrieveRandomAccountNumbers(8, null);
        for(AccountNumber account : accounts) {
            Common.validatePattern(account.value.startsWith("G") ? GOLD_FORMAT : PLATINUM_FORMAT, account.value);
        }
    }

    @Test
    @Transactional
    public void testRandomGenerateAndRetrievePerType() throws DataSynthesisException {
        short[] ids = initDB();
        service.generateAccountNumbers(10, ids[0]);
        service.generateAccountNumbers(10, ids[1]);

        List<AccountNumber> accounts = service.retrieveRandomAccountNumbers(20, ids[0]);
        Assertions.assertEquals(10, accounts.size());
        for(AccountNumber account : accounts) {
            Common.validatePattern(GOLD_FORMAT, account.value);
        }
    }
}
