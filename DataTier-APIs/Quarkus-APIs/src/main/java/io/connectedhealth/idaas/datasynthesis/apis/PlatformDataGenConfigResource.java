package io.connectedhealth.idaas.datasynthesis.apis;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import io.connectedhealth.idaas.datasynthesis.audit.Audited;
import io.connectedhealth.idaas.datasynthesis.models.PlatformConfigDataGenEntity;

import org.eclipse.microprofile.openapi.annotations.parameters.Parameter;
import org.jboss.resteasy.annotations.jaxrs.QueryParam;

@Path("/platformconfigdatageneration")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class PlatformDataGenConfigResource {

    @Audited
    @GET
    public List<PlatformConfigDataGenEntity> getPlatformDataGenConfigResourcesByStatusId(@Parameter(required=false) @QueryParam Short status) {
        if (status == null)
            return PlatformConfigDataGenEntity.listAll();
        return PlatformConfigDataGenEntity.findByStatusId(status);
    }
}
