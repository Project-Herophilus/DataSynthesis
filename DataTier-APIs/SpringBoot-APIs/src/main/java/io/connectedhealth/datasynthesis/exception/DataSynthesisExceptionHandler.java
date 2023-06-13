package io.connectedhealth.datasynthesis.exception;

import org.springframework.http.ResponseEntity;

public class DataSynthesisExceptionHandler {

    public ResponseEntity toResponse(DataSynthesisException exception) {
        return ResponseEntity.status(Integer.parseInt(exception.getMessage())).build();
    }    
}
