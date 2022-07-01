package io.connectedhealth.idaas.datasynthesis.models;

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

import io.quarkus.panache.common.Parameters;

@Entity
@Table(name = "platform_dataattributes")
public class PlatformDataAttributesEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private short platformDataAttributesId;
    private String dataAttributeName;
    private Timestamp createdDate;
    private String createdUser;
    private String platformDataAttributeGuid;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataSensitivityFlagEntity sensitivityFlag;
    private String platformTableName;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PlatformDataAttributesID", nullable = false)
    public short getPlatformDataAttributesId() {
        return platformDataAttributesId;
    }

    public void setPlatformDataAttributesId(short platformDataAttributesId) {
        this.platformDataAttributesId = platformDataAttributesId;
    }

    @Basic
    @Column(name = "DataAttributeName", nullable = true, length = 50)
    public String getDataAttributeName() {
        return dataAttributeName;
    }

    public void setDataAttributeName(String dataAttributeName) {
        this.dataAttributeName = dataAttributeName;
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
    @Column(name = "PlatformDataAttributeGUID", nullable = true, length = 38)
    public String getPlatformDataAttributeGuid() {
        return platformDataAttributeGuid;
    }

    public void setPlatformDataAttributeGuid(String platformDataAttributeGuid) {
        this.platformDataAttributeGuid = platformDataAttributeGuid;
    }

    @Basic
    @Column(name = "PlatformTableName", nullable = true, length = 38)
    public String getPlatformTableName() {
        return platformTableName;
    }

    public void setPlatformTableName(String platformTableName) {
        this.platformTableName = platformTableName;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		PlatformDataAttributesEntity other = (PlatformDataAttributesEntity) o;
		return java.util.Objects.equals(platformDataAttributesId, other.platformDataAttributesId) && java.util.Objects.equals(dataAttributeName, other.dataAttributeName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(platformDataAttributeGuid, other.platformDataAttributeGuid) && java.util.Objects.equals(platformTableName, other.platformTableName) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(platformDataAttributesId, dataAttributeName, createdDate, createdUser, platformDataAttributeGuid, platformTableName,
					status, registeredApp, sensitivityFlag);
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

    public static List<PlatformDataAttributesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }

    public static List<PlatformDataAttributesEntity> findByPlatformDataStructure(String platformDataStructureName) {
        return find("select a from PlatformDataAttributesEntity a, PlatformDataStructuresEntity s, PlatformDataStructuresToDataAttributesEntity t where s.dataStructureName = :name and t.platformDataStructures = s and t.platformDataAttributes = a", 
        Parameters.with("name", platformDataStructureName).map()).list();
    }

    public static PlatformDataAttributesEntity findByDataAttributeName(String name) {
        return find("DataAttributeName", name).firstResult();
    }
}
