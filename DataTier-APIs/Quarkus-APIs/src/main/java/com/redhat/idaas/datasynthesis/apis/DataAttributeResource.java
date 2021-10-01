package com.redhat.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.redhat.idaas.datasynthesis.dtos.DataAttribute;
import com.redhat.idaas.datasynthesis.services.DataAttributeService;

@Path("/data-attributes")
@Produces(MediaType.APPLICATION_JSON)
public class DataAttributeResource {
    @Inject
    DataAttributeService service;

    @GET
    public List<DataAttribute> getDataAttributes() {
        return service.retrieveAllDataAttributes();
    }
}
