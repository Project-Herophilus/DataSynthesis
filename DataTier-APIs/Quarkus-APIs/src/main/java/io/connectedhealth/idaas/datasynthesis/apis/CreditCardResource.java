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
import io.connectedhealth.idaas.datasynthesis.dtos.CreditCard;
import io.connectedhealth.idaas.datasynthesis.dtos.TypeAndCount;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.CreditCardService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/creditcards")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class CreditCardResource {
    @Inject
    CreditCardService service;
    
    @Audited
    @GET
    public List<CreditCard> getCreditCards(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count,
        @Parameter(required=false) @QueryParam Short dataGenTypeId) {
            return service.retrieveRandomCreditCards(count, dataGenTypeId);
    }

    @Audited
    @GET
    @Path("/{id}")
    public CreditCard getCreditCard(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }
    
    @Audited
    @POST
    public List<CreditCard> generateCreditCards(TypeAndCount countBody) throws DataSynthesisException {
        return service.generateCreditCards(countBody.count, countBody.dataGenTypeId, countBody.dryRun);
    }
}
