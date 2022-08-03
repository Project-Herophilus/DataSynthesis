package io.connectedhealth.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.AreaCode;
import io.connectedhealth.idaas.datasynthesis.services.AreaCodeService;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/areacodes")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AreaCodeResource {
    @Inject
    AreaCodeService service;

    @Audited
    @GET
    public List<AreaCode> getAreaCodes(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count) {
            return service.retrieveRandomData(count);
    }

    @Audited
    @GET
    @Path("/{id}")
    public AreaCode getAreaCode(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }
}
