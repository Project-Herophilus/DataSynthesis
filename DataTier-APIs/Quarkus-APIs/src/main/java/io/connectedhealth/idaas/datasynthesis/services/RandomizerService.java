package io.connectedhealth.idaas.datasynthesis.services;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;

import javax.enterprise.context.ApplicationScoped;

import io.quarkus.hibernate.orm.panache.PanacheEntityBase;
import io.quarkus.hibernate.orm.panache.PanacheQuery;

@ApplicationScoped
public abstract class RandomizerService<E extends PanacheEntityBase, D> extends BaseService {

    protected abstract long count(Object... queryOpts);

    protected abstract PanacheQuery<E> findAll(Object... queryOpts);

    protected abstract D mapEntityToDTO(E entity); 

    protected Random rand = new Random();

    public Set<E> findRandomRows(int count, Object... queryOpts) {
        long recordCount = count(queryOpts);
        int totalCount = Math.min(count, 5000);
        if (recordCount < totalCount) {
            totalCount = (int) recordCount;
        }

        Set<E> entities = new HashSet<E>(totalCount);
        // If they want more records than we have in the database
        // Just return the entire database
        if (recordCount < totalCount) {
            entities.addAll(findAll(queryOpts).list());
        } else {
            while (entities.size() < totalCount) {
                E record = findAll(queryOpts).page(rand.nextInt((int) recordCount), 1).firstResult();
                entities.add(record);
            }
        }
    
        return entities;
    }

    public List<D> retrieveRandomData(int count, Object... queryOpts) {
        Set<E> entities = findRandomRows(count, queryOpts);
        return entities.stream().map(e -> mapEntityToDTO(e)).collect(Collectors.toList());
    }
}
