package io.connectedhealth.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.Count;
import io.connectedhealth.idaas.datasynthesis.dtos.PhoneNumber;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.PhoneNumberService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/phonenumbers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PhoneNumberResource {
    @Inject
    PhoneNumberService service;

    @Audited
    @GET
    public List<PhoneNumber> getPhoneNumbers(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count) {
            return service.retrieveRandomData(count);
    }

    @Audited
    @GET
    @Path("/{id}")
    public PhoneNumber getPhoneNumber(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }
    
    @Audited
    @POST
    public List<PhoneNumber> generatePhoneNumbers(Count countBody) throws DataSynthesisException {
        return service.generatePhoneNumber(countBody.count, countBody.dryRun);
    }
}
