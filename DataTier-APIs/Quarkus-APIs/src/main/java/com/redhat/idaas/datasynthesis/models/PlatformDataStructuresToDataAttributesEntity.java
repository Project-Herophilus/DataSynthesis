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
@Table(name = "platform_datastructurestodataattributes", schema = "datasynthesis", catalog = "")
public class PlatformDataStructuresToDataAttributesEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private short platformDataStructuresToDataAttributesId;
    private String compositeDataStructureName;
    private Timestamp createdDate;
    private String createdUser;
    private String platformDataStructuresToDataAttributesGuid;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataSensitivityFlagEntity sensitivityFlag;
    private PlatformDataAttributesEntity platformDataAttributes;
    private PlatformDataStructuresEntity platformDataStructures;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PlatformDataStructuresToDataAttributesID", nullable = false)
    public short getPlatformDataStructuresToDataAttributesId() {
        return platformDataStructuresToDataAttributesId;
    }

    public void setPlatformDataStructuresToDataAttributesId(short platformDataStructuresToDataAttributesId) {
        this.platformDataStructuresToDataAttributesId = platformDataStructuresToDataAttributesId;
    }

    @Basic
    @Column(name = "CompositeDataStructureName", nullable = true, length = 50)
    public String getCompositeDataStructureName() {
        return compositeDataStructureName;
    }

    public void setCompositeDataStructureName(String compositeDataStructureName) {
        this.compositeDataStructureName = compositeDataStructureName;
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

    @Basic
    @Column(name = "PlatformDataStructuresToDataAttributesGUID", nullable = true, length = 38)
    public String getPlatformDataStructuresToDataAttributesGuid() {
        return platformDataStructuresToDataAttributesGuid;
    }

    public void setPlatformDataStructuresToDataAttributesGuid(String platformDataStructuresToDataAttributesGuid) {
        this.platformDataStructuresToDataAttributesGuid = platformDataStructuresToDataAttributesGuid;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		PlatformDataStructuresToDataAttributesEntity other = (PlatformDataStructuresToDataAttributesEntity) o;
		return java.util.Objects.equals(platformDataStructuresToDataAttributesId, other.platformDataStructuresToDataAttributesId) && java.util.Objects.equals(compositeDataStructureName, other.compositeDataStructureName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(platformDataStructuresToDataAttributesGuid, other.platformDataStructuresToDataAttributesGuid) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag) && java.util.Objects.equals(platformDataAttributes, other.platformDataAttributes) && 
			java.util.Objects.equals(platformDataStructures, other.platformDataStructures);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(platformDataStructuresToDataAttributesId, compositeDataStructureName, createdDate, createdUser, platformDataStructuresToDataAttributesGuid,
					status, registeredApp, sensitivityFlag, platformDataAttributes,
					platformDataStructures);
	}

    @ManyToOne
    @JoinColumn(name = "PlatformDataStructuresID", referencedColumnName = "PlatformDataStructuresID")
    public PlatformDataStructuresEntity getPlatformDataStructures() {
        return platformDataStructures;
    }

    public void setPlatformDataStructures(PlatformDataStructuresEntity platformDataStructures) {
        this.platformDataStructures = platformDataStructures;
    }

    @ManyToOne
    @JoinColumn(name = "PlatformDataAttributesID", referencedColumnName = "PlatformDataAttributesID")
    public PlatformDataAttributesEntity getPlatformDataAttributes() {
        return platformDataAttributes;
    }

    public void setPlatformDataAttributes(PlatformDataAttributesEntity platformDataAttributes) {
        this.platformDataAttributes = platformDataAttributes;
    }

    @ManyToOne
    @JoinColumn(name = "SensitivityFlagID", referencedColumnName = "SensitiveFlagID")
    public RefDataSensitivityFlagEntity getSensitivityFlag() {
        return sensitivityFlag;
    }

    public void setSensitivityFlag(RefDataSensitivityFlagEntity sensitivityFlag) {
        this.sensitivityFlag = sensitivityFlag;
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

    public static List<PlatformDataStructuresToDataAttributesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
