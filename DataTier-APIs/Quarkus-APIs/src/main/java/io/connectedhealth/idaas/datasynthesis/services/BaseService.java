package io.connectedhealth.idaas.datasynthesis.services;

import javax.enterprise.context.ApplicationScoped;

import io.connectedhealth.idaas.datasynthesis.exception.DataSynthesisException;
import io.connectedhealth.idaas.datasynthesis.models.BaseEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataApplicationEntity;
import io.connectedhealth.idaas.datasynthesis.models.RefDataStatusEntity;

@ApplicationScoped
public abstract class BaseService {

    public static final String LIKE = "%";

    protected RefDataApplicationEntity getRegisteredApp() throws DataSynthesisException {
        // TODO: get application by login user's tenant
        RefDataApplicationEntity defaulApplication = RefDataApplicationEntity.findByApplicationCustomCode("DSynth");
        if (defaulApplication == null) {
            throw new DataSynthesisException("Cannot find default RefDataApplicationEntity. Please run the seeding SQL script.");
        }
        return defaulApplication;
    }

    protected RefDataStatusEntity getDefaultStatus() throws DataSynthesisException {
        RefDataStatusEntity activeStatus = RefDataStatusEntity.findByStatusDescription("Active");
        if (activeStatus == null) {
            throw new DataSynthesisException("Cannot find default RefDataStatusEntity. Please run the seeding SQL script.");
        }
        return activeStatus;
    }

    // return false if entity cannot persist because of uniqueness constraint violation
    // raise exception for other errors
    public static boolean safePersist(BaseEntity entity) {
        if (entity == null) {
            return true;
        } else {
            return entity.safePersist();
        }
    }

    public String wrapForLike(String value) {
        return wrapForLike(value, true, true);
    }

    public String wrapForLike(String value, boolean first, boolean last) {
        if (null == value || value.length() == 0) {
            return null;
        }

        StringBuilder like = new StringBuilder();
        like.append(first ? LIKE : "").append(value).append(last ? LIKE : "");
        return like.toString();
    }
}

