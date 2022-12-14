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
import io.connectedhealth.idaas.datasynthesis.dtos.DLN;
import io.connectedhealth.idaas.datasynthesis.dtos.TypeAndCount;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.DriversLicensesService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/driverslicensenumbers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class DriversLicenseNumberResource {
    @Inject
    DriversLicensesService service;
    
    @Audited
    @GET
    public List<DLN> getDriversLicenseNumbers(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count,
        @Parameter(required=false) @QueryParam Short dataGenTypeId) {
            return service.retrieveRandomDriverLicenses(count, dataGenTypeId);
    }

    @Audited
    @GET
    @Path("/{id}")
    public DLN getDriversLicenseNumber(@PathParam("id") long id) throws DataSynthesisException {
        return service.retrieve(id);
    }

    @Audited
    @POST
    public List<DLN> generateDriversLicenseNumbers(TypeAndCount countBody) throws DataSynthesisException {
        return service.generatedDriverLicenses(countBody.count, countBody.dataGenTypeId, countBody.dryRun);
    }
}
