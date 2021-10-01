package com.redhat.idaas.datasynthesis.models;

import javax.persistence.PersistenceException;

import org.hibernate.Session;
import org.hibernate.exception.ConstraintViolationException;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;

public abstract class BaseEntity extends PanacheEntityBase {
    // return false if entity cannot persist because of uniqueness constraint violation
    // raise exception for other errors   
    public boolean safePersist() {
        try {
            persist();
        } catch (PersistenceException ex) {
            if (ex.getCause() instanceof ConstraintViolationException) {
                Session session = getEntityManager().unwrap(Session.class);
                session.clear();
                return false;
            } else {
                throw ex;
            }
        }

        return true;
    }    
}
