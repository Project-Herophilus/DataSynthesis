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
@Table(name = "refdata_platformparamstodataattributes")
public class RefDataPlatformParamsToDataAttributesEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long platformParamsToDataAttributeId;
    private RefDataPlatformParamsEntity platformParams;
    private PlatformDataAttributesEntity dataAttribute;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PlatformParamsToDataAttributeID", nullable = false)
    public long getPlatformParamsToDataAttributeId() {
        return platformParamsToDataAttributeId;
    }

    public void setPlatformParamsToDataAttributeId(long platformParamsToDataAttributeId) {
        this.platformParamsToDataAttributeId = platformParamsToDataAttributeId;
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
		RefDataPlatformParamsToDataAttributesEntity other = (RefDataPlatformParamsToDataAttributesEntity) o;
		return java.util.Objects.equals(platformParamsToDataAttributeId, other.platformParamsToDataAttributeId) && java.util.Objects.equals(platformParams, other.platformParams) && java.util.Objects.equals(dataAttribute, other.dataAttribute) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(platformParamsToDataAttributeId, platformParams, dataAttribute, createdDate, status,
					registeredApp);
	}

    @ManyToOne
    @JoinColumn(name = "PlatformParamsID", referencedColumnName = "PlatformParamsID")
    public RefDataPlatformParamsEntity getPlatformParams() {
        return platformParams;
    }

    public void setPlatformParams(RefDataPlatformParamsEntity platformParamsId) {
        this.platformParams = platformParamsId;
    }

    @ManyToOne
    @JoinColumn(name = "DataAttributeID", referencedColumnName = "PlatformDataAttributesID")
    public PlatformDataAttributesEntity getDataAttribute() {
        return dataAttribute;
    }

    public void setDataAttribute(PlatformDataAttributesEntity dataAttribute) {
        this.dataAttribute = dataAttribute;
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

    public static List<RefDataPlatformParamsToDataAttributesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
