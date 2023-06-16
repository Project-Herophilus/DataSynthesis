package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "datamodel_datatables")
public class DataModelDataTablesEntity {
    @Id
    @Column(name = "tablename", nullable = false, length = 64)
    private String tableName;
    @Basic
    @Column(name = "tableinformation", nullable = true, length = 249)
    private String tableInformation;
    @Basic
    @Column(name = "statusid", nullable = true)
    private Short statusId;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;

}
