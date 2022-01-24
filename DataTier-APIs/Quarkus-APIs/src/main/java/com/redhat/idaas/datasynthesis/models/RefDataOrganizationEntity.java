package com.redhat.idaas.datasynthesis.models;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "refdata_organization")
public class RefDataOrganizationEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private String organizationGuid;
    private String organizationInternalCode;
    private String organizationInternalId;
    private String organizationName;
    private String address;
    private String city;
    private RefDataUsStatesEntity state;
    private String zipCode;
    private String createdUser;
    private RefDataStatusEntity status;
    private Timestamp createdDate;
    private RefDataLegalEntityEntity legalEntityGuid;

    @Id
    @GeneratedValue
    @Column(name = "OrganizationGUID", nullable = false, length = 38)
    public String getOrganizationGuid() {
        return organizationGuid;
    }

    public void setOrganizationGuid(String organizationGuid) {
        this.organizationGuid = organizationGuid;
    }

    @Basic
    @Column(name = "OrganizationInternalCode", nullable = true, length = 10)
    public String getOrganizationInternalCode() {
        return organizationInternalCode;
    }

    public void setOrganizationInternalCode(String organizationInternalCode) {
        this.organizationInternalCode = organizationInternalCode;
    }

    @Basic
    @Column(name = "OrganizationInternalID", nullable = true, length = 10)
    public String getOrganizationInternalId() {
        return organizationInternalId;
    }

    public void setOrganizationInternalId(String organizationInternalId) {
        this.organizationInternalId = organizationInternalId;
    }

    @Basic
    @Column(name = "OrganizationName", nullable = true, length = 50)
    public String getOrganizationName() {
        return organizationName;
    }

    public void setOrganizationName(String organizationName) {
        this.organizationName = organizationName;
    }

    @Basic
    @Column(name = "Address", nullable = true, length = 75)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "City", nullable = true, length = 60)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "ZipCode", nullable = true, length = 12)
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
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
    @Column(name = "CreatedDate", nullable = false)
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
		RefDataOrganizationEntity other = (RefDataOrganizationEntity) o;
		return java.util.Objects.equals(organizationGuid, other.organizationGuid) && java.util.Objects.equals(organizationInternalCode, other.organizationInternalCode) && java.util.Objects.equals(organizationInternalId, other.organizationInternalId) && 
			java.util.Objects.equals(organizationName, other.organizationName) && java.util.Objects.equals(address, other.address) && 
			java.util.Objects.equals(city, other.city) && java.util.Objects.equals(state, other.state) && 
			java.util.Objects.equals(zipCode, other.zipCode) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(legalEntityGuid, other.legalEntityGuid);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(organizationGuid, organizationInternalCode, organizationInternalId, organizationName, address,
					city, state, zipCode, createdUser,
					status, createdDate, legalEntityGuid);
	}

    @ManyToOne
    @JoinColumn(name = "LegalEntityGUID", referencedColumnName = "LegalEntityGUID")
    public RefDataLegalEntityEntity getLegalEntityGuid() {
        return legalEntityGuid;
    }

    public void setLegalEntityGuid(RefDataLegalEntityEntity legalEntityGuid) {
        this.legalEntityGuid = legalEntityGuid;
    }

    @ManyToOne
    @JoinColumn(name = "StateID", referencedColumnName = "StateID")
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

    public static List<RefDataOrganizationEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
