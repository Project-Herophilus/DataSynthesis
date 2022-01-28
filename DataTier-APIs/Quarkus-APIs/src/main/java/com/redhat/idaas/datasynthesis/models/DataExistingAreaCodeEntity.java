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
@Table(name = "dataexisting_areacode")
public class DataExistingAreaCodeEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long areaCodeId;
    private String areaCodeValue;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataTimeZonesEntity timeZone;
    private RefDataUsStatesEntity state;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AreaCodeID", nullable = false)
    public long getAreaCodeId() {
        return areaCodeId;
    }

    public void setAreaCodeId(long areaCodeId) {
        this.areaCodeId = areaCodeId;
    }

    @Basic
    @Column(name = "AreaCodeValue", nullable = false, length = 3)
    public String getAreaCodeValue() {
        return areaCodeValue;
    }

    public void setAreaCodeValue(String areaCodeValue) {
        this.areaCodeValue = areaCodeValue;
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
    @Column(name = "CreatedUser", nullable = true, length = 20)
    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataExistingAreaCodeEntity other = (DataExistingAreaCodeEntity) o;
		return java.util.Objects.equals(areaCodeId, other.areaCodeId) && java.util.Objects.equals(areaCodeValue, other.areaCodeValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(timeZone, other.timeZone) && 
			java.util.Objects.equals(state, other.state);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(areaCodeId, areaCodeValue, createdDate, createdUser, status,
					registeredApp, timeZone, state);
	}

    @ManyToOne
    @JoinColumn(name = "TimeZone", referencedColumnName = "TimeZoneValue")
    public RefDataTimeZonesEntity getTimeZone() {
        return timeZone;
    }

    public void setTimeZone(RefDataTimeZonesEntity timeZone) {
        this.timeZone = timeZone;
    }

    @ManyToOne
    @JoinColumn(name = "StateCode", referencedColumnName = "StateID")
    public RefDataUsStatesEntity getState() {
        return state;
    }

    public void setState(RefDataUsStatesEntity state) {
        this.state = state;
    }

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    @ManyToOne
    @JoinColumn(name = "RegisteredApp", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getRegisteredApp() {
        return registeredApp;
    }

    public void setRegisteredApp(RefDataApplicationEntity registeredApp) {
        this.registeredApp = registeredApp;
    }

    public static List<DataExistingAreaCodeEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
