package com.redhat.idaas.datasynthesis.apis;

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

import com.redhat.idaas.datasynthesis.audit.Audited;
import com.redhat.idaas.datasynthesis.dtos.AbaBanking;
import com.redhat.idaas.datasynthesis.services.AbaBankingService;
import com.redhat.idaas.datasynthesis.exception.DataSynthesisException;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.eclipse.microprofile.openapi.annotations.responses.APIResponse;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/aba-bankings")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AbaBankingResource {
    @Inject
    AbaBankingService service;

    @Audited
    @GET
    public List<AbaBanking> getAbaBankings(
        @Parameter(description = "number of random records to be retrieved") @QueryParam int count) {
            return service.retrieveRandomData(count);
    }

    @Audited
    @POST
    @APIResponse(responseCode = "201")
    public Response addAbaBanking(AbaBanking banking) throws DataSynthesisException {
        service.insertAbaBanking(banking);
        return Response.status(Status.CREATED).build();
    }
}
