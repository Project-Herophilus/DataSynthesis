package com.redhat.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.redhat.idaas.datasynthesis.audit.Audited;
import com.redhat.idaas.datasynthesis.dtos.CreditCard;
import com.redhat.idaas.datasynthesis.dtos.TypeAndCount;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;
import com.redhat.idaas.datasynthesis.services.CreditCardService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/credit-cards")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CreditCardResource {
    @Inject
    CreditCardService service;
    
    @Audited
    @GET
    public List<CreditCard> getCreditCards(
        @Parameter(description = "number of random records to be retrieved") @QueryParam int count, 
        @Parameter(required=false) @QueryParam Short dataGenTypeId) {
            return service.retrieveRandomCreditCards(count, dataGenTypeId);
    }
    
    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response generateCreditCards(TypeAndCount countBody) throws DataSynthesisException {
        service.generateCreditCards(countBody.count, countBody.dataGenTypeId);
        return Response.status(Status.CREATED).build();
    }
}
