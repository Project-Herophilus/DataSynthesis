package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_platformparams")
public class RefDataPlatformParamsEntity {
    private short platformParamsId;
    private String platformParamValues;
    private String platformParamDesc;
    private Timestamp createdDate;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PlatformParamsID", nullable = false)
    public short getPlatformParamsId() {
        return platformParamsId;
    }

    public void setPlatformParamsId(short platformParamsId) {
        this.platformParamsId = platformParamsId;
    }

    @Basic
    @Column(name = "PlatformParamValues", nullable = true, length = 35)
    public String getPlatformParamValues() {
        return platformParamValues;
    }

    public void setPlatformParamValues(String platformParamValues) {
        this.platformParamValues = platformParamValues;
    }

    @Basic
    @Column(name = "PlatformParamDesc", nullable = true, length = 70)
    public String getPlatformParamDesc() {
        return platformParamDesc;
    }

    public void setPlatformParamDesc(String platformParamDesc) {
        this.platformParamDesc = platformParamDesc;
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
		RefDataPlatformParamsEntity other = (RefDataPlatformParamsEntity) o;
		return java.util.Objects.equals(platformParamsId, other.platformParamsId) && java.util.Objects.equals(platformParamValues, other.platformParamValues) && java.util.Objects.equals(platformParamDesc, other.platformParamDesc) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(platformParamsId, platformParamValues, platformParamDesc, createdDate, status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

/*    public static List<RefDataPlatformParamsEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
