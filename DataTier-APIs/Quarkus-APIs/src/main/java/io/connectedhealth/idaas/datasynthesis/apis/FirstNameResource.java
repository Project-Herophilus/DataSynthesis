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
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.NameFirst;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.NameFirstService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/firstnames")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class FirstNameResource {
    @Inject
    NameFirstService service;

    @Audited
    @GET
    public List<NameFirst> getFirstNames(
        @Parameter(description = "number of random records to be retrieved")  @DefaultValue("500") @QueryParam int count,
        @Parameter(description = "Optional param to filter by gender") @QueryParam String gender,
        @Parameter(description = "Optional param to filter by frist letter of first name") @QueryParam String firstLetter) {

            return service.retrieveNameFirsts(count, gender, firstLetter);
    }

    @Audited
    @GET
    @Path("/{id}")
    public NameFirst getFirstName(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }

    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response addFirstName(NameFirst nameObj) throws DataSynthesisException {
        service.insertNameFirst(nameObj);
        return Response.status(Status.CREATED).build();
    }
}
