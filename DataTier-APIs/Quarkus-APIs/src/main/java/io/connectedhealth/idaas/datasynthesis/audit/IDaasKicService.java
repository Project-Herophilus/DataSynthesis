package io.connectedhealth.idaas.datasynthesis.audit;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

@Path("/idaas/KIC-Auditing-EndPoint/")
@RegisterRestClient
public interface IDaasKicService {
    @POST
    Response audit(AuditMessage auditMessage);
}
