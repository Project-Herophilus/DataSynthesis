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
import io.connectedhealth.idaas.datasynthesis.dtos.Count;
import io.connectedhealth.idaas.datasynthesis.dtos.EIN;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.EINService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/employeridentificationnumbers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class EINResource {
    @Inject
    EINService einService;

    @Audited
    @GET
    public List<EIN> getEINs(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count) {
            return einService.retrieveRandomData(count);
    }
 
    @Audited
    @GET
    @Path("/{id}")
    public EIN getEIN(@PathParam("id") long id) throws DataSynthesisException {
        return einService.retrieve(id);
    }

    @Audited
    @POST
    public List<EIN> generateEINs(Count countBody) throws DataSynthesisException {
        return einService.generateEinNumber(countBody.count, countBody.dryRun);
    }
}
