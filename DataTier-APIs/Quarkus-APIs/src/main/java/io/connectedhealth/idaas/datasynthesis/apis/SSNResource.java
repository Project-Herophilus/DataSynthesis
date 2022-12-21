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
import io.connectedhealth.idaas.datasynthesis.dtos.SSN;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.SocialSecurityNumberService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/socialsecuritynumbers")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class SSNResource {
    @Inject
    SocialSecurityNumberService ssnService;

    @Audited
    @GET
    public List<SSN> getSSNs(
        @Parameter(description = "number of random records to be retrieved") @DefaultValue("500") @QueryParam int count) {
            return ssnService.retrieveRandomData(count);
    }

    @Audited
    @GET
    @Path("/{id}")
    public SSN getSSN(@PathParam("id") long id) throws DataSynthesisException {
        return ssnService.retrieve(id);
    }
    
    @Audited
    @POST
    public List<SSN> generateSSNs(Count countBody) throws DataSynthesisException {
        return ssnService.generateSSN(countBody.count, countBody.dryRun);
    }
}
