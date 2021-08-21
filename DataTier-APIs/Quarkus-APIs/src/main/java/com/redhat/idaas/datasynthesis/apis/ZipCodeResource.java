package com.redhat.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.redhat.idaas.datasynthesis.dtos.ZipCode;
import com.redhat.idaas.datasynthesis.services.USZipCodeService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/zip-codes")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class ZipCodeResource {
    @Inject
    USZipCodeService service;

    @GET
    public List<ZipCode> getAreaCodes(
        @Parameter(description = "number of random records to be retrieved") @QueryParam int count) {
        return service.retrieveRandomData(count);
    }
}
