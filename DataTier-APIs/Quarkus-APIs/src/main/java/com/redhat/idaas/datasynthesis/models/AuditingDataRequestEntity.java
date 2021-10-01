package com.redhat.idaas.datasynthesis.models;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "auditing_datarequest", schema = "datasynthesis", catalog = "")
public class AuditingDataRequestEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long dataRequestId;
    private Timestamp dataRequestDate;
    private String createdByUser;
    private String organizaton;
    private String application;
    private Timestamp createdDate;
    private Integer recCount;
    private String recordDataRequest;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DataRequestID", nullable = false)
    public long getDataRequestId() {
        return dataRequestId;
    }

    public void setDataRequestId(long dataRequestId) {
        this.dataRequestId = dataRequestId;
    }

    @Basic
    @Column(name = "DataRequestDate", nullable = true)
    public Timestamp getDataRequestDate() {
        return dataRequestDate;
    }

    public void setDataRequestDate(Timestamp dataRequestDate) {
        this.dataRequestDate = dataRequestDate;
    }

    @Basic
    @Column(name = "CreatedByUser", nullable = true, length = 20)
    public String getCreatedByUser() {
        return createdByUser;
    }

    public void setCreatedByUser(String createdByUser) {
        this.createdByUser = createdByUser;
    }

    @Basic
    @Column(name = "Organizaton", nullable = true, length = 38)
    public String getOrganizaton() {
        return organizaton;
    }

    public void setOrganizaton(String organizaton) {
        this.organizaton = organizaton;
    }

    @Basic
    @Column(name = "Application", nullable = true, length = 38)
    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }

    @Basic
    @Column(name = "CreatedDate", nullable = true)
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "RecCount", nullable = true)
    public Integer getRecCount() {
        return recCount;
    }

    public void setRecCount(Integer recCount) {
        this.recCount = recCount;
    }

    @Basic
    @Column(name = "RecordDataRequest", nullable = true, length = 400)
    public String getRecordDataRequest() {
        return recordDataRequest;
    }

    public void setRecordDataRequest(String recordDataRequest) {
        this.recordDataRequest = recordDataRequest;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		AuditingDataRequestEntity other = (AuditingDataRequestEntity) o;
		return java.util.Objects.equals(dataRequestId, other.dataRequestId) && java.util.Objects.equals(dataRequestDate, other.dataRequestDate) && java.util.Objects.equals(createdByUser, other.createdByUser) && 
			java.util.Objects.equals(organizaton, other.organizaton) && java.util.Objects.equals(application, other.application) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(recCount, other.recCount) && 
			java.util.Objects.equals(recordDataRequest, other.recordDataRequest) && java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dataRequestId, dataRequestDate, createdByUser, organizaton, application,
					createdDate, recCount, recordDataRequest, status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    public static List<AuditingDataRequestEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
