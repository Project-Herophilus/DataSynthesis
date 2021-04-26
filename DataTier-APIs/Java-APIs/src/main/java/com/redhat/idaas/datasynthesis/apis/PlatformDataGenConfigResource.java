package com.redhat.idaas.datasynthesis.apis;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.redhat.idaas.datasynthesis.models.PlatformConfigDataGenEntity;

import org.jboss.resteasy.annotations.jaxrs.PathParam;

@Path("/platformconfigdatagen")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PlatformDataGenConfigResource {

    @GET
    @Path("all")
    public List<PlatformConfigDataGenEntity> get() {
        return PlatformConfigDataGenEntity.listAll();
    }

    @GET
    @Path("{status}")
    public List<PlatformConfigDataGenEntity> getByStatus(@PathParam Short status) {
        return PlatformConfigDataGenEntity.findByStatusId(status);
    }
}
