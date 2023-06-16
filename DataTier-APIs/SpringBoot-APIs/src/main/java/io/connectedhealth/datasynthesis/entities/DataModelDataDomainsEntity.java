package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "datamodel_domain")
public class DataModelDataDomainsEntity {
    @Id
    @Column(name = "domainname", nullable = false, length = 64)
    private String domainName;
    @Basic
    @Column(name = "domaininformation", nullable = true, length = 249)
    private String domainInformation;
    @Basic
    @Column(name = "statusid", nullable = true)
    private Short statusId;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;

}
