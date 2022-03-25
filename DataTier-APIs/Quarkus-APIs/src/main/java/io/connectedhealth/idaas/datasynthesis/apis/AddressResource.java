package io.connectedhealth.idaas.datasynthesis.apis;

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

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.Address;
import io.connectedhealth.idaas.datasynthesis.dtos.Count;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.AddressService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/addresses")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AddressResource {
    @Inject
    AddressService service;

    @Audited
    @GET
    public List<Address> getAddresses(
        @Parameter(description = "number of random records to be retrieved") @QueryParam int count) {
            return service.retrieveRandomData(count);
    }
    
    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response generateAddresses(Count countBody) throws DataSynthesisException {
        service.generateAddresses(countBody.count);
        return Response.status(Status.CREATED).build();
    }
}