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
import io.connectedhealth.idaas.datasynthesis.dtos.DataGenType;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.DataGenTypeService;

import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;

@Path("/data-gen-types")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class DataGenTypeResource {
    @Inject
    DataGenTypeService service;

    @Audited
    @GET
    public List<DataGenType> getDataGenTypes() {
        return service.retrieveAllDataGenTypes();
    }

    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response addDataGenType(DataGenType dataType) throws DataSynthesisException {
        service.createDataGenType(dataType);
        return Response.status(Status.CREATED).build();
    }
}
