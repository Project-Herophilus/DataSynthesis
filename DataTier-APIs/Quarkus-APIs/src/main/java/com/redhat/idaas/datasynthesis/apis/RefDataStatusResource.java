package com.redhat.idaas.datasynthesis.apis;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.redhat.idaas.datasynthesis.models.RefDataStatusEntity;

@Path("/refdata-statuses")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class RefDataStatusResource {

    @GET
    public List<RefDataStatusEntity> get() {
        return RefDataStatusEntity.listAll();
    }
}
