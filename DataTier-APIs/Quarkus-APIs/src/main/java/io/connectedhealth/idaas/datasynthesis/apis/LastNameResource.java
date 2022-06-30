package io.connectedhealth.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.NameLast;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.NameLastService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/lastnames")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class LastNameResource {
    @Inject
    NameLastService service;

    @Audited
    @GET
    public List<NameLast> getLastNames(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count,
        @Parameter(description = "Optional param to filter by frist letter of last name") @QueryParam String firstLetter) {
            return service.retrieveNameLasts(count, firstLetter);
    }
    
    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response addLastName(NameLast nameObj) throws DataSynthesisException {
        service.insertNameLast(nameObj);
        return Response.status(Status.CREATED).build();
    }
}
