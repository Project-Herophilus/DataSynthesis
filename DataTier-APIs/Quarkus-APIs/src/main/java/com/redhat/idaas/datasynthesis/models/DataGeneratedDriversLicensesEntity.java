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
@Table(name = "datagenerated_driverslicenses")
public class DataGeneratedDriversLicensesEntity extends BaseEntity {
    private long driversLicensesId;
    private String dln;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataUsStatesEntity state;
    private RefDataDataGenTypesEntity dataGenType;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DriversLicensesID", nullable = false)
    public long getDriversLicensesId() {
        return driversLicensesId;
    }

    public void setDriversLicensesId(long driversLicensesId) {
        this.driversLicensesId = driversLicensesId;
    }

    @Basic
    @Column(name = "DLN", nullable = true, length = 25)
    public String getDln() {
        return dln;
    }

    public void setDln(String dln) {
        this.dln = dln;
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
		DataGeneratedDriversLicensesEntity other = (DataGeneratedDriversLicensesEntity) o;
		return java.util.Objects.equals(driversLicensesId, other.driversLicensesId) && java.util.Objects.equals(dln, other.dln) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(state, other.state) && java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(driversLicensesId, dln, createdDate, createdUser,
					status, registeredApp, state, dataGenType);
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

    @ManyToOne
    @JoinColumn(name = "DataGenTypeID", referencedColumnName = "DataGenTypeID")
    public RefDataDataGenTypesEntity getDataGenType() {
        return dataGenType;
    }

    public void setDataGenType(RefDataDataGenTypesEntity dataGenType) {
        this.dataGenType = dataGenType;
    }

    public static List<DataGeneratedDriversLicensesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
