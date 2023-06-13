package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "datamodel_datatables")
public class DataModelDataTablesEntity {
    private String tableName;
    private String tableInformation;
    private Short statusId;
    private Timestamp createdDate;

    @Id
    @Column(name = "TableName", nullable = false, length = 64)
    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    @Basic
    @Column(name = "TableInformation", nullable = true, length = 249)
    public String getTableInformation() {
        return tableInformation;
    }

    public void setTableInformation(String tableInformation) {
        this.tableInformation = tableInformation;
    }

    @Basic
    @Column(name = "StatusID", nullable = true)
    public Short getStatusId() {
        return statusId;
    }

    public void setStatusId(Short statusId) {
        this.statusId = statusId;
    }

    @Basic
    @Column(name = "CreatedDate", nullable = true)
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataModelDataTablesEntity other = (DataModelDataTablesEntity) o;
		return java.util.Objects.equals(tableName, other.tableName) && java.util.Objects.equals(tableInformation, other.tableInformation) && java.util.Objects.equals(statusId, other.statusId) && 
			java.util.Objects.equals(createdDate, other.createdDate);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(tableName, tableInformation, statusId, createdDate);
	}
}
