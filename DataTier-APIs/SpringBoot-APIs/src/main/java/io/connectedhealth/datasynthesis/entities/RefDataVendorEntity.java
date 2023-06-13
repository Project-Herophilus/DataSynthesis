package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_vendor")
public class RefDataVendorEntity {
    private int vendorId;
    private String vendorName;
    private Timestamp createdDate;
    private String createdUser;
    private String vendorGuid;
    private RefDataStatusEntity status;

    @Id
    @Column(name = "VendorID", nullable = false)
    public int getVendorId() {
        return vendorId;
    }

    public void setVendorId(int vendorId) {
        this.vendorId = vendorId;
    }

    @Basic
    @Column(name = "VendorName", nullable = true, length = 50)
    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
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
    @Column(name = "VendorGUID", nullable = true, length = 38)
    public String getVendorGuid() {
        return vendorGuid;
    }

    public void setVendorGuid(String vendorGuid) {
        this.vendorGuid = vendorGuid;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataVendorEntity other = (RefDataVendorEntity) o;
		return java.util.Objects.equals(vendorId, other.vendorId) && java.util.Objects.equals(vendorName, other.vendorName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(vendorGuid, other.vendorGuid) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(vendorId, vendorName, createdDate, createdUser, vendorGuid,
					status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

 /*   public static List<RefDataVendorEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
