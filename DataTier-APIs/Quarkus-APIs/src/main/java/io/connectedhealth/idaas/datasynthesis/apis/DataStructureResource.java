package io.connectedhealth.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.DataStructure;
import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.services.DataStructureService;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/datastructures")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class DataStructureResource {

    @Inject
    DataStructureService service;


    @Audited
    @GET
    public List<DataStructure> getDataStructureByName(@Parameter(description = "number of records to be retrieved") @QueryParam int count, 
        @Parameter(description = "name of the data_structure") @QueryParam("name") String name) throws DataSynthesisException {
        return service.retrieveDataStructures(name, count);
    }
}
