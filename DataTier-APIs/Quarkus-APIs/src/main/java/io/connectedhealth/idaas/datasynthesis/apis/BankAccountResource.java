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
import io.connectedhealth.idaas.datasynthesis.dtos.BankAccount;
import io.connectedhealth.idaas.datasynthesis.dtos.TypeAndCount;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.BankAccountService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/bankaccounts")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class BankAccountResource {
    @Inject
    BankAccountService service;
    
    @Audited
    @GET
    public List<BankAccount> getBankAccounts(
        @Parameter(description = "number of random records to be retrieved")  @DefaultValue("500") @QueryParam int count,
        @Parameter(required=false) @QueryParam Short dataGenTypeId) {        
            return service.retrieveRandomBankAccounts(count, dataGenTypeId);
    }

    @Audited
    @GET
    @Path("/{id}")
    public BankAccount getBankAccount(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }
    
    @Audited
    @POST
    public List<BankAccount> generateBankAccounts(TypeAndCount countBody) throws DataSynthesisException {
        return service.generateBankAccounts(countBody.count, countBody.dataGenTypeId, countBody.dryRun);
    }
}
