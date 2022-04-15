package io.connectedhealth.idaas.datasynthesis.services;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import io.connectedhealth.idaas.datasynthesis.dtos.CreditCard;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.DataGeneratedCreditCardEntity;
import io.connectedhealth.idaas.datasynthesis.models.PlatformDataAttributesEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataDataGenTypesEntity;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import io.quarkus.test.TestTransaction;
import io.quarkus.test.junit.QuarkusTest;

@QuarkusTest
@TestTransaction
public class CreditCardServiceTest {
    @Inject
    CreditCardService service;

    private final static String VISA_FORMAT = "^4[0-9]{12}(?:[0-9]{3})?$";
    private final static String MASTER_FORMAT = "^5[1-5][0-9]{14}$";

    private short[] initDB() {
        Common.seed();
        PlatformDataAttributesEntity dataAttribute = new PlatformDataAttributesEntity();
        dataAttribute.setDataAttributeName("Credit Cards");
        dataAttribute.persist();

        RefDataDataGenTypesEntity dataType1 = new RefDataDataGenTypesEntity();
        dataType1.setDataGenTypeDescription("Visa");
        dataType1.setDefinition(VISA_FORMAT);
        dataType1.setDataAttribute(dataAttribute);
        dataType1.persist();

        RefDataDataGenTypesEntity dataType2 = new RefDataDataGenTypesEntity();
        dataType2.setDataGenTypeDescription("Master");
        dataType2.setDefinition(MASTER_FORMAT);
        dataType2.setDataAttribute(dataAttribute);
        dataType2.persist();
        return new short[]{dataType1.getDataGenTypeId(), dataType2.getDataGenTypeId()};
    }

    @Test
    @Transactional
    public void testRandomGenerateAndRetrieve() throws DataSynthesisException {
        initDB();
        service.generateCreditCards(10, null);
        Assertions.assertEquals(10, DataGeneratedCreditCardEntity.count());

        List<CreditCard> cards = service.retrieveRandomCreditCards(8, null);
        for(CreditCard card : cards) {
            Common.validatePattern(card.name.equals("Visa") ? VISA_FORMAT : MASTER_FORMAT, card.number);
        }
    }

    @Test
    @Transactional
    public void testRandomGenerateAndRetrievePerType() throws DataSynthesisException {
        short[] ids = initDB();
        service.generateCreditCards(10, ids[0]);
        service.generateCreditCards(10, ids[1]);

        List<CreditCard> cards = service.retrieveRandomCreditCards(20, ids[0]);
        Assertions.assertEquals(10, cards.size());
        for(CreditCard card : cards) {
            Assertions.assertEquals("Visa", card.name);
        }
    }
}
