package com.redhat.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.redhat.idaas.datasynthesis.dtos.AccountNumber;
import com.redhat.idaas.datasynthesis.dtos.Address;
import com.redhat.idaas.datasynthesis.dtos.BirthDate;
import com.redhat.idaas.datasynthesis.dtos.CreditCard;
import com.redhat.idaas.datasynthesis.dtos.DLN;
import com.redhat.idaas.datasynthesis.dtos.EIN;
import com.redhat.idaas.datasynthesis.dtos.NameFirst;
import com.redhat.idaas.datasynthesis.dtos.NameLast;
import com.redhat.idaas.datasynthesis.dtos.PhoneNumber;
import com.redhat.idaas.datasynthesis.dtos.SSN;
import com.redhat.idaas.datasynthesis.dtos.UserIdentity;
import com.redhat.idaas.datasynthesis.services.AccountNumberService;
import com.redhat.idaas.datasynthesis.services.AddressService;
import com.redhat.idaas.datasynthesis.services.CreditCardService;
import com.redhat.idaas.datasynthesis.services.DateOfBirthService;
import com.redhat.idaas.datasynthesis.services.DriversLicenseNumberService;
import com.redhat.idaas.datasynthesis.services.EINService;
import com.redhat.idaas.datasynthesis.services.NameFirstService;
import com.redhat.idaas.datasynthesis.services.NameLastService;
import com.redhat.idaas.datasynthesis.services.PhoneNumberService;
import com.redhat.idaas.datasynthesis.services.SSNService;
import com.redhat.idaas.datasynthesis.services.UserIdentityService;

import org.jboss.resteasy.annotations.jaxrs.PathParam;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/data")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class DataResource {

    @Inject
    SSNService ssnService;

    @Inject
    UserIdentityService userIdentityService;

    @Inject
    AccountNumberService accountNumberService;

    @Inject
    DateOfBirthService dobService;

    @Inject
    AddressService addressService;

    @Inject
    CreditCardService creditCardService;

    @Inject
    DriversLicenseNumberService dlnService;

    @Inject
    PhoneNumberService phoneNumberService;

    @Inject
    EINService einService;

    @Inject
    NameLastService nameLastService;

    @Inject
    NameFirstService nameFirstService;

    @GET
    @Path("ssn/{count}")
    public List<SSN> getSSNs(@PathParam int count) {
        return ssnService.retrieveRandomSSNs(count);
    }

    @GET
    @Path("accountnumber/{count}")
    public List<AccountNumber> getAccountNumbers(@PathParam int count) {
       return accountNumberService.retrieveRandomAccountNumbers(count);
    }

    @GET
    @Path("creditcard/{count}")
    public List<CreditCard> getCreditCards(@PathParam int count) {
        return creditCardService.retrieveRandomCreditCards(count);
    }

    @GET
    @Path("birthdate/{count}")
    public List<BirthDate> getBirthDates(@PathParam int count) {
        return dobService.retrieveRandomBirthDates(count);
    }

    @GET
    @Path("ein/{count}")
    public List<EIN> getEINs(@PathParam int count) {
        return einService.retrieveRandomEINs(count);
    }

    @GET
    @Path("phonenumber/{count}")
    public List<PhoneNumber> getPhoneNumbers(@PathParam int count) {
        return phoneNumberService.retrieveRandomPhoneNumbers(count);
    }

    @GET
    @Path("useridentity/{count}")
    public List<UserIdentity> getUserIdentities(@PathParam int count) {
        return userIdentityService.retrieveRandomUserIdentities(count);
    }

    @GET
    @Path("lastname/{count}")
    public List<NameLast> getLastNames(@PathParam int count) {
        return nameLastService.retrieveNameLasts(count);
    }

    @GET
    @Path("firstname/{count}")
    public List<NameFirst> getFirstNames(@PathParam int count, @QueryParam("gender") String gender) {
        return nameFirstService.retrieveNameFirsts(count, gender);
    }

    @GET
    @Path("driverlicense/{count}")
    public List<DLN> getDriverLicenses(@PathParam int count, @QueryParam("state") String state) {
        return dlnService.retrieveRandomDriverLicenses(count, state);
    }

    @GET
    @Path("address/{count}")
    public List<Address> getAddresses(@PathParam int count) {
        return addressService.retrieveAddresses(count);
    }
}
