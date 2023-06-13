package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_operationtype")
public class RefDataOperationTypeEntity {
    private String operationTypeId;
    private String operationTypeName;
    private Timestamp createdDate;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue
    @Column(name = "OperationTypeID", nullable = false, length = 7)
    public String getOperationTypeId() {
        return operationTypeId;
    }

    public void setOperationTypeId(String operationTypeId) {
        this.operationTypeId = operationTypeId;
    }

    @Basic
    @Column(name = "OperationTypeName", nullable = true, length = 60)
    public String getOperationTypeName() {
        return operationTypeName;
    }

    public void setOperationTypeName(String operationTypeName) {
        this.operationTypeName = operationTypeName;
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
		RefDataOperationTypeEntity other = (RefDataOperationTypeEntity) o;
		return java.util.Objects.equals(operationTypeId, other.operationTypeId) && java.util.Objects.equals(operationTypeName, other.operationTypeName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(operationTypeId, operationTypeName, createdDate, status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

  /*  public static List<RefDataOperationTypeEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
