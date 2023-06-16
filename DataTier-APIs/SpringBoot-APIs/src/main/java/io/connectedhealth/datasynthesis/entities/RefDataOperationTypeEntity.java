package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "refdata_operationtype")
public class RefDataOperationTypeEntity {
    @Id
    @GeneratedValue
    @Column(name = "operationtypeid", nullable = false, length = 7)
    private String operationTypeId;
    @Basic
    @Column(name = "operationtypename", nullable = true, length = 60)
    private String operationTypeName;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataOperationTypeEntity other = (RefDataOperationTypeEntity) o;
		return java.util.Objects.equals(operationTypeId, other.operationTypeId) && java.util.Objects.equals(operationTypeName, other.operationTypeName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(operationTypeId, operationTypeName, createdDate, status);
	}


}
