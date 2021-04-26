package com.redhat.idaas.datasynthesis.services;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import javax.enterprise.context.ApplicationScoped;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public abstract class RandomizerService<T extends PanacheEntityBase> extends BaseService {

    protected abstract long count(Object... queryOpts);

    protected abstract PanacheQuery<T> findAll(Object... queryOpts);

    protected Random rand = new Random();

    public Set<T> findRandomRows(int count, Object... queryOpts) {
        long recordCount = count(queryOpts);
        int totalCount = Math.min(count, 5000);
        if (recordCount < totalCount) {
            totalCount = (int) recordCount;
        }

        Set<T> entities = new HashSet<T>(totalCount);
        // If they want more records than we have in the database
        // Just return the entire database
        if (recordCount < totalCount) {
            entities.addAll(findAll(queryOpts).list());
        } else {
            while (entities.size() < totalCount) {
                T record = findAll(queryOpts).page(rand.nextInt((int) recordCount), 1).firstResult();
                entities.add(record);
            }
        }
    
        return entities;
    }
}
