package io.connectedhealth.idaas.datasynthesis.apis;

import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.dtos.DataAttribute;
import io.connectedhealth.idaas.datasynthesis.services.DataAttributeService;

@Path("/data-attributes")
@Produces(MediaType.APPLICATION_JSON)
public class DataAttributeResource {
    @Inject
    DataAttributeService service;

    @Audited
    @GET
    public List<DataAttribute> getDataAttributes() {
        return service.retrieveAllDataAttributes();
    }
}
