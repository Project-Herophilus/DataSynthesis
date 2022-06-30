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

@Entity
@Table(name = "platform_config_dataattributes")
public class PlatformConfigDataGenEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private short dataGenConfigId;
    private String dataTypeGenConfigName;
    private Integer runQuantity;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity application;
    private PlatformDataAttributesEntity dataAttribute;
    private RefDataDataGenTypesEntity dataGenType;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DataGenConfigID", nullable = false)
    public short getDataGenConfigId() {
        return dataGenConfigId;
    }

    public void setDataGenConfigId(short dataGenConfigId) {
        this.dataGenConfigId = dataGenConfigId;
    }

    @Basic
    @Column(name = "DataTypeGenConfigName", nullable = true, length = 25)
    public String getDataTypeGenConfigName() {
        return dataTypeGenConfigName;
    }

    public void setDataTypeGenConfigName(String dataTypeGenConfigName) {
        this.dataTypeGenConfigName = dataTypeGenConfigName;
    }

    @Basic
    @Column(name = "RunQuantity", nullable = true)
    public Integer getRunQuantity() {
        return runQuantity;
    }

    public void setRunQuantity(Integer runQuantity) {
        this.runQuantity = runQuantity;
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
		PlatformConfigDataGenEntity other = (PlatformConfigDataGenEntity) o;
		return java.util.Objects.equals(dataGenConfigId, other.dataGenConfigId) && java.util.Objects.equals(dataTypeGenConfigName, other.dataTypeGenConfigName) && 
			java.util.Objects.equals(runQuantity, other.runQuantity) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(application, other.application) && 
			java.util.Objects.equals(dataAttribute, other.dataAttribute) && java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dataGenConfigId, dataTypeGenConfigName, runQuantity,
					createdDate, createdUser, status, application,
					dataAttribute, dataGenType);
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
    @JoinColumn(name = "ApplicationID", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getApplication() {
        return application;
    }

    public void setApplication(RefDataApplicationEntity application) {
        this.application = application;
    }

    @ManyToOne
    @JoinColumn(name = "DataGenTypeID", referencedColumnName = "DataGenTypeID")
    public RefDataDataGenTypesEntity getDataGenType() {
        return dataGenType;
    }

    public void setDataGenType(RefDataDataGenTypesEntity dataGenType) {
        this.dataGenType = dataGenType;
    }

    public static List<PlatformConfigDataGenEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
