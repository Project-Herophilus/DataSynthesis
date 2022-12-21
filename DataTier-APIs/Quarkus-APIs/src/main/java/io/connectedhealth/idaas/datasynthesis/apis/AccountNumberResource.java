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
import io.connectedhealth.idaas.datasynthesis.dtos.AccountNumber;
import io.connectedhealth.idaas.datasynthesis.dtos.TypeAndCount;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.AccountNumbersService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/accountnumbers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AccountNumberResource {
    @Inject
    AccountNumbersService service;
    
    @Audited
    @GET
    public List<AccountNumber> getAccountNumbers(
        @Parameter(description = "number of random records to be retrieved")  @DefaultValue("500") @QueryParam int count,
        @Parameter(required = false, description = "optional") @QueryParam Short dataGenTypeId) {
            return service.retrieveRandomAccountNumbers(count, dataGenTypeId);
    }
    
    @Audited
    @GET
    @Path("/{id}")
    public AccountNumber getAccountNumber(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }

    @Audited
    @POST
    public List<AccountNumber> generateAccountNumbers(TypeAndCount countBody) throws DataSynthesisException {
        return service.generateAccountNumbers(countBody.count, countBody.dataGenTypeId, countBody.dryRun);
    }
}
