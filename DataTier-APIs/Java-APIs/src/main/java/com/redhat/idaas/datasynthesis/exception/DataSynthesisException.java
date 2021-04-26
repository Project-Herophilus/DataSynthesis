package com.redhat.idaas.datasynthesis.exception;

import java.io.Serializable;

public class DataSynthesisException extends Exception implements Serializable {
    private static final long serialVersionUID = 1L;

    public DataSynthesisException() {
        super();
    }

    public DataSynthesisException(String msg) {
        super(msg);
    }

    public DataSynthesisException(String msg, Exception e) {
        super(msg, e);
    }
}