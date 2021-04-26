package com.redhat.idaas.datasynthesis.services;

import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;

import com.redhat.idaas.datasynthesis.dtos.CreditCard;
import com.redhat.idaas.datasynthesis.models.DataGeneratedCreditCardEntity;

import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public class CreditCardService extends RandomizerService<DataGeneratedCreditCardEntity> {

    @Override
    protected long count(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedCreditCardEntity.count();
        }
        return DataGeneratedCreditCardEntity.count((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    @Override
    protected PanacheQuery<DataGeneratedCreditCardEntity> findAll(Object... queryOpts) {
        if (queryOpts.length <= 1) {
            return DataGeneratedCreditCardEntity.findAll();
        }
        return DataGeneratedCreditCardEntity.find((String)queryOpts[0], Arrays.copyOfRange(queryOpts, 1, queryOpts.length));
    }

    public List<CreditCard> retrieveRandomCreditCards(int count) {
        Set<DataGeneratedCreditCardEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new CreditCard(e.getCreditCardNumber(), e.getCreditCardName())).collect(Collectors.toList());
    }
    // Generate Data
    /*
    @Transactional
    public List<DataGeneratedCreditCardEntity> generatedCCNumber(long generationCounter) {
        List<DataGeneratedCreditCardEntity> ccnnumberList = new ArrayList<DataGeneratedCreditCardEntity>(
                (int) generationCounter);
        int upperBound1 = 99;
        int upperBound2 = 9999999;

        for (int i = 0; i < generationCounter; i++)
        {
            StringBuilder ccnumber = new StringBuilder();
            // Credit Cards selection need to be randomized

            // Create the first 16 phone number digits
            // ccnumber.append(StringUtils.leftPad(String.valueOf(einRandomizer.nextInt(upperBound1)), 16, "0"));

            //Existing Code from .Net Core
            
               // Create List for return
                List<DataSynthesis.Data.Business.Models.genRefData.CreditCard> creditcardList = new List<DataSynthesis.Data.Business.Models.genRefData.CreditCard>();
                //Create list object to store data in
                ArrayList ccList = new ArrayList();

                //Create ArrayList of CreditCards
                ArrayList creditCardName = new ArrayList();
                creditCardName.Add("AMEX");
                creditCardName.Add("Discover");
                creditCardName.Add("Visa");
                creditCardName.Add("Mastercard");

                Random rndmGen = new Random();
                Random rndmAMEXGenPt1 = new Random();
                Random rndmAMEXGenPt2 = new Random();
                Random rndmAMEXGenPt3 = new Random();
                Random rndmOtherCCGenPt1 = new Random();

                string creditCardNumbers;
                //loop
                for (int i = 0; i <= generationCount - 1; i++)
                {
                    int n = rndmGen.Next(0, creditCardName.Count);

                    // Create Credit Card Number Based on Credit Card Name
                    string strName0 = creditCardName[n].ToString();

                    if (!strName0.Equals("AMEX"))
                    {
                        creditCardNumbers = Convert.ToString(rndmOtherCCGenPt1.Next(0, 1001).ToString().PadLeft(4, '0') + " " +
                            Convert.ToString(rndmOtherCCGenPt1.Next(0, 1001).ToString().PadLeft(4, '0')) + " " +
                            Convert.ToString(rndmOtherCCGenPt1.Next(0, 1001).ToString().PadLeft(4, '0')) + " " +
                            Convert.ToString(rndmOtherCCGenPt1.Next(0, 1001).ToString().PadLeft(4, '0')));
                        // Persist to list object
                        ccList.Add(strName0 + "|" + creditCardNumbers);
                        // Add To ArrayList if unique value
                        if (!ccList.Contains(strName0 + "|" + creditCardNumbers))
                        {
                            ccList.Add(strName0 + "|" + creditCardNumbers);
                        }
                    }
                    else
                    {
                        creditCardNumbers = Convert.ToString(rndmAMEXGenPt1.Next(0, 10001)) + " " +
                            Convert.ToString(rndmAMEXGenPt2.Next(0, 1001)) + " " +
                            Convert.ToString(rndmAMEXGenPt3.Next(0, 100001));
                        //Persist to List Object
                        ccList.Add(strName0 + "|" + creditCardNumbers);
                        // Add To ArrayList if unique value
                        if (!ccList.Contains(strName0 + "|" + creditCardNumbers))
                        {
                            ccList.Add(strName0 + "|" + creditCardNumbers);
                        }
                    }
                }

             


            
            DataGeneratedEinEntity einNumberEntity = DataGeneratedEinEntity
                    .findByEinNumber(einnumber.toString());
            if (einNumberEntity == null) {
                einNumberEntity = new DataGeneratedEinEntity();
                einNumberEntity.setEinValue(einnumber.toString());
                DataGeneratedEinEntity.persist(einNumberEntity);
            }

            einnumberList.add(einNumberEntity);
        }

        return einnumberList;
    }

    // Persist Data
    public List<EIN> retrieveRandomEINs(int count) {
        Set<DataGeneratedEinEntity> entities = findRandomRows(count);
        return entities.stream().map(e -> new EIN(e.getEinValue())).collect(Collectors.toList());
    }
         */
}
