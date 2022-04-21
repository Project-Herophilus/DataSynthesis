package io.connectedhealth.idaas.datasynthesis.models;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "impl_application")
public class RefDataApplicationEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private String appGuid;
    private String applicationCustomCode;
    private String applicationDesc;
    private String createdUser;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataVendorEntity vendor;

    @Id
    @Column(name = "AppGUID", nullable = false, length = 38)
    public String getAppGuid() {
        return appGuid;
    }

    public void setAppGuid(String appGuid) {
        this.appGuid = appGuid;
    }

    @Basic
    @Column(name = "ApplicationCustomCode", nullable = true, length = 15)
    public String getApplicationCustomCode() {
        return applicationCustomCode;
    }

    public void setApplicationCustomCode(String applicationCustomCode) {
        this.applicationCustomCode = applicationCustomCode;
    }

    @Basic
    @Column(name = "ApplicationDesc", nullable = true, length = 50)
    public String getApplicationDesc() {
        return applicationDesc;
    }

    public void setApplicationDesc(String applicationDesc) {
        this.applicationDesc = applicationDesc;
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
		RefDataApplicationEntity other = (RefDataApplicationEntity) o;
		return java.util.Objects.equals(appGuid, other.appGuid) && java.util.Objects.equals(applicationCustomCode, other.applicationCustomCode) && java.util.Objects.equals(applicationDesc, other.applicationDesc) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(vendor, other.vendor);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(appGuid, applicationCustomCode, applicationDesc, createdUser, createdDate,
					status, vendor);
	}

    @ManyToOne
    @JoinColumn(name = "VendorID", referencedColumnName = "VendorID")
    public RefDataVendorEntity getVendor() {
        return vendor;
    }

    public void setVendor(RefDataVendorEntity vendor) {
        this.vendor = vendor;
    }

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    public static List<RefDataApplicationEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }

    public static RefDataApplicationEntity findByApplicationCustomCode(String code) {
        return find("ApplicationCustomCode", code).firstResult();
    }
}
