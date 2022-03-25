package io.connectedhealth.idaas.datasynthesis.exception;

import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.ext.ExceptionMapper;
import javax.ws.rs.ext.Provider;

@Provider
public class DataSynthesisExceptionHandler implements ExceptionMapper<DataSynthesisException> {

    @Override
    public Response toResponse(DataSynthesisException exception) {
        return Response.status(Status.BAD_REQUEST).entity(exception.getMessage()).build();
    }    
}
