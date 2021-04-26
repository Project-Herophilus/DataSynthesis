package com.redhat.idaas.datasynthesis.models;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.List;

@Entity
@Table(name = "auditing_dataplatform", schema = "datasynthesis", catalog = "")
public class AuditingDataPlatformEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long dataPlatformId;
    private Timestamp dataProcessingDate;
    private String createdByUser;
    private String organizaton;
    private String application;
    private Timestamp createdDate;
    private Integer recCount;
    private String component;
    private String actionName;
    private Integer durationToRun;
    private String activityDetail;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DataPlatformID", nullable = false)
    public long getDataPlatformId() {
        return dataPlatformId;
    }

    public void setDataPlatformId(long dataPlatformId) {
        this.dataPlatformId = dataPlatformId;
    }

    @Basic
    @Column(name = "DataProcessingDate", nullable = true)
    public Timestamp getDataProcessingDate() {
        return dataProcessingDate;
    }

    public void setDataProcessingDate(Timestamp dataProcessingDate) {
        this.dataProcessingDate = dataProcessingDate;
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
    @Column(name = "Component", nullable = true, length = 20)
    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    @Basic
    @Column(name = "ActionName", nullable = true, length = 20)
    public String getActionName() {
        return actionName;
    }

    public void setActionName(String actionName) {
        this.actionName = actionName;
    }

    @Basic
    @Column(name = "DurationToRun", nullable = true)
    public Integer getDurationToRun() {
        return durationToRun;
    }

    public void setDurationToRun(Integer durationToRun) {
        this.durationToRun = durationToRun;
    }

    @Basic
    @Column(name = "ActivityDetail", nullable = true, length = 75)
    public String getActivityDetail() {
        return activityDetail;
    }

    public void setActivityDetail(String activityDetail) {
        this.activityDetail = activityDetail;
    }

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dataPlatformId, dataProcessingDate, createdByUser, organizaton, application,
					createdDate, recCount, component, actionName,
					durationToRun, activityDetail, status);
	}

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		AuditingDataPlatformEntity other = (AuditingDataPlatformEntity) o;
		return java.util.Objects.equals(dataPlatformId, other.dataPlatformId) && java.util.Objects.equals(dataProcessingDate, other.dataProcessingDate) && java.util.Objects.equals(createdByUser, other.createdByUser) && 
			java.util.Objects.equals(organizaton, other.organizaton) && java.util.Objects.equals(application, other.application) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(recCount, other.recCount) && 
			java.util.Objects.equals(component, other.component) && java.util.Objects.equals(actionName, other.actionName) && 
			java.util.Objects.equals(durationToRun, other.durationToRun) && java.util.Objects.equals(activityDetail, other.activityDetail) && 
			java.util.Objects.equals(status, other.status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    public static List<AuditingDataPlatformEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
