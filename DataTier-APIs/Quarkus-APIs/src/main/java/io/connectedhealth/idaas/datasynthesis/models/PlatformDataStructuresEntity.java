package io.connectedhealth.idaas.datasynthesis.models;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

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
@Table(name = "platform_datastructures")
public class PlatformDataStructuresEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private short platformDataStructuresId;
    private String dataStructureName;
    private Timestamp createdDate;
    private String createdUser;
    private String platformDataStructuresGuid;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataSensitivityFlagEntity sensitivityFlag;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PlatformDataStructuresID", nullable = false)
    public short getPlatformDataStructuresId() {
        return platformDataStructuresId;
    }

    public void setPlatformDataStructuresId(short platformDataStructuresId) {
        this.platformDataStructuresId = platformDataStructuresId;
    }

    @Basic
    @Column(name = "DataStructureName", nullable = true, length = 50)
    public String getDataStructureName() {
        return dataStructureName;
    }

    public void setDataStructureName(String dataStructureName) {
        this.dataStructureName = dataStructureName;
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
    @Column(name = "PlatformDataStructuresGUID", nullable = true, length = 38)
    public String getPlatformDataStructuresGuid() {
        return platformDataStructuresGuid;
    }

    public void setPlatformDataStructuresGuid(String platformDataStructuresGuid) {
        this.platformDataStructuresGuid = platformDataStructuresGuid;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		PlatformDataStructuresEntity other = (PlatformDataStructuresEntity) o;
		return java.util.Objects.equals(platformDataStructuresId, other.platformDataStructuresId) && java.util.Objects.equals(dataStructureName, other.dataStructureName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(platformDataStructuresGuid, other.platformDataStructuresGuid) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(platformDataStructuresId, dataStructureName, createdDate, createdUser, platformDataStructuresGuid,
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

    public static List<PlatformDataStructuresEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }

    public static Optional<PlatformDataStructuresEntity> findByName(String dataStructureName) {
        return find("dataStructureName", dataStructureName).firstResultOptional();
    }
}
