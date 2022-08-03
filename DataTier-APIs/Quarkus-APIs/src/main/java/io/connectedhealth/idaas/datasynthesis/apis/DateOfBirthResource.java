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
import io.connectedhealth.idaas.datasynthesis.dtos.BirthDate;
import io.connectedhealth.idaas.datasynthesis.dtos.Count;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.DateOfBirthService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/datesofbirth")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class DateOfBirthResource {
    @Inject
    DateOfBirthService dobService;

    @Audited
    @GET
    public List<BirthDate> getDOBs(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count) {
            return dobService.retrieveRandomData(count);
    }

    @Audited
    @GET
    @Path("/{id}")
    public BirthDate getDOB(@PathParam("id") long id) throws DataSynthesisException {
        return dobService.retrieve(id);
    }
    
    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response generateDOBs(Count countBody) throws DataSynthesisException {
        dobService.generatedDateOfBirthEntities(countBody.count);
        return Response.status(Status.CREATED).build();
    }
}
