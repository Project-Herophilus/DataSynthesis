package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_addressformattype")
public class RefDataAddressFormatTypeEntity {
    private short addressFormatTypeId;
    private String addressFormatTypeDesc;
    private Timestamp createdDate;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AddressFormatTypeID", nullable = false)
    public short getAddressFormatTypeId() {
        return addressFormatTypeId;
    }

    public void setAddressFormatTypeId(short addressFormatTypeId) {
        this.addressFormatTypeId = addressFormatTypeId;
    }

    @Basic
    @Column(name = "AddressFormatTypeDesc", nullable = true, length = 35)
    public String getAddressFormatTypeDesc() {
        return addressFormatTypeDesc;
    }

    public void setAddressFormatTypeDesc(String addressFormatTypeDesc) {
        this.addressFormatTypeDesc = addressFormatTypeDesc;
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
		RefDataAddressFormatTypeEntity other = (RefDataAddressFormatTypeEntity) o;
		return java.util.Objects.equals(addressFormatTypeId, other.addressFormatTypeId) && java.util.Objects.equals(addressFormatTypeDesc, other.addressFormatTypeDesc) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(addressFormatTypeId, addressFormatTypeDesc, createdDate, status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    /*public static List<RefDataAddressFormatTypeEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
