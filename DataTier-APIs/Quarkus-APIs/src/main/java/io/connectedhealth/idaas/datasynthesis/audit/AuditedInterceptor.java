package io.connectedhealth.idaas.datasynthesis.audit;

import java.util.ArrayList;
import java.util.UUID;
import javax.annotation.Priority;
import javax.inject.Inject;
import javax.interceptor.AroundInvoke;
import javax.interceptor.Interceptor;
import javax.interceptor.InvocationContext;
import org.apache.commons.lang.StringUtils;
import org.eclipse.microprofile.config.inject.ConfigProperty;
import org.eclipse.microprofile.rest.client.inject.RestClient;

@Audited
@Interceptor
@Priority(2000)
public class AuditedInterceptor {
    @ConfigProperty(name = "datasynthesis.audit")
    private boolean audit;

    @Inject
    @RestClient
    IDaasKicService auditService;

    @AroundInvoke
    public Object auditMethod(InvocationContext ctx) throws Exception {
        if (!audit)
            return ctx.proceed();

        String methodName = ctx.getMethod().getName();
        String[] names = StringUtils.splitByCharacterTypeCamelCase(methodName);

        AuditMessage message = new AuditMessage();
        message.setProcessingtype("API");
        message.setIndustrystd("N/A");
        message.setComponent("API_datasynthesis_" + StringUtils.join(names, "", 1, names.length));
        message.setMessagetrigger("N/A");
        message.setProcessname("INBD");
        message.setAuditdetails(StringUtils.join(names, " "));
        message.setCamelID(UUID.randomUUID().toString());
        message.setExchangeID(message.getCamelID());
        message.setInternalMsgID(message.getCamelID());
        message.setBodyData("INBD params: " + StringUtils.join(ctx.getParameters(), ", "));

        auditService.audit(message);

        Object result = ctx.proceed();

        message.setProcessname("OUTBD");
        message.setCamelID(UUID.randomUUID().toString());
        message.setInternalMsgID(message.getCamelID());
        if (result instanceof ArrayList)
            message.setBodyData("OUTBD return " + ((ArrayList)result).size() + " records");
        else
            message.setBodyData("OUTBD return code 201");

        auditService.audit(message);
        return result;
    }
}
