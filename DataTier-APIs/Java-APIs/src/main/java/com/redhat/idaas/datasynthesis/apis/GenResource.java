package com.redhat.idaas.datasynthesis.apis;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.redhat.idaas.datasynthesis.dtos.NameFirst;
import com.redhat.idaas.datasynthesis.dtos.NameLast;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
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

@Path("/gen")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class GenResource {

    @Inject
    SSNService ssnService;

    @Inject
    AccountNumberService accountNumberService;

    @Inject
    AddressService addressService;

    @Inject
    CreditCardService creditCardService;

    @Inject
    DateOfBirthService dobService;

    @Inject
    DriversLicenseNumberService dlnService;

    @Inject
    EINService einService;

    @Inject
    PhoneNumberService phoneNumberService;

    @Inject
    UserIdentityService userIdentityService;

    @Inject
    NameLastService nameLastService;

    @Inject
    NameFirstService nameFirstService;

    @POST
    @Path("ssn/{count}")
    public Response generateSSNs(@PathParam int count) throws DataSynthesisException {
        ssnService.generateSSN(count);
        return Response.status(Status.CREATED).build();
    }

    @POST
    @Path("accountnumber/{count}")
    public Response generateAccountNumbers(@PathParam int count) {
        throw new UnsupportedOperationException("generateAccountNumbers Not yet implemented");
    }

    @POST
    @Path("creditcard/{count}")
    public Response generateCreditCards(@PathParam int count) {
        throw new UnsupportedOperationException("generateCreditCards Not yet implemented");
    }

    @POST
    @Path("birthdate/{count}")
    public Response generateBirthDates(@PathParam int count) throws DataSynthesisException {
        dobService.generatedDateOfBirthEntities(count);
        return Response.status(Status.CREATED).build();
    }

    @POST
    @Path("ein/{count}")
    public Response generateEINs(@PathParam int count) throws DataSynthesisException {
        einService.generateEinNumber(count);
        return Response.status(Status.CREATED).build();
    }

    @POST
    @Path("phonenumber/{count}")
    public Response generatePhoneNumbers(@PathParam int count) throws DataSynthesisException {
        phoneNumberService.generatePhoneNumber(count);
        return Response.status(Status.CREATED).build();
    }

    @POST
    @Path("useridentity/{count}")
    public Response generateUserIdentities(@PathParam int count) {
        throw new UnsupportedOperationException("generateUserIdentities Not yet implemented");
    }

    @POST
    @Path("lastname")
    public Response generateLastName(NameLast lastName) throws DataSynthesisException {
        if (lastName == null || lastName.lastName == null || lastName.lastName.isEmpty()) {
            throw new DataSynthesisException("Missing attribute lastName");
        }
        if (nameLastService.insertNameLast(lastName.lastName)) {
            return Response.status(Status.CREATED).build();
        }
        return Response.status(Status.CONFLICT).build();
    }

    @POST
    @Path("firstname")
    public Response generateFirstName(NameFirst firstName) throws DataSynthesisException {
        if (firstName == null || firstName.firstName == null || firstName.firstName.isEmpty()) {
            throw new DataSynthesisException("Missing attribute firstName");
        }
        if (!"M".equals(firstName.gender) && !"F".equals(firstName.gender)) {
            System.out.println("gender input: " + firstName.gender);
            throw new DataSynthesisException("Attribute gender should be either M or F");
        }
        if (nameFirstService.insertNameFirst(firstName.firstName, firstName.gender)) {
            return Response.status(Status.CREATED).build();
        }
        return Response.status(Status.CONFLICT).build();
    }

    @POST
    @Path("driverlicense/{count}")
    public Response generateDriverLicenses(@PathParam int count, @QueryParam("state") String state)
            throws DataSynthesisException {
        dlnService.generatedDriverLicenses(count, state);
        return Response.status(Status.CREATED).build();       
    }

    @POST
    @Path("address/{count}")
    public Response generateAddresses(@PathParam int count) throws DataSynthesisException {
        addressService.generateAddresses(count);
        return Response.status(Status.CREATED).build(); 
    }
}
