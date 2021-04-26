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
@Table(name = "refdata_legalentity", schema = "datasynthesis", catalog = "")
public class RefDataLegalEntityEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private String legalEntityGuid;
    private String locationName;
    private String address;
    private String city;
    private RefDataUsStatesEntity state;
    private String zipCode;
    private String createdUser;
    private RefDataStatusEntity status;
    private Timestamp createdDate;
    private String locationUrl;
    private String locationPhone;

    @Id
    @GeneratedValue
    @Column(name = "LegalEntityGUID", nullable = false, length = 38)
    public String getLegalEntityGuid() {
        return legalEntityGuid;
    }

    public void setLegalEntityGuid(String legalEntityGuid) {
        this.legalEntityGuid = legalEntityGuid;
    }

    @Basic
    @Column(name = "LocationName", nullable = true, length = 50)
    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        this.locationName = locationName;
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

    @Basic
    @Column(name = "LocationURL", nullable = true, length = 99)
    public String getLocationUrl() {
        return locationUrl;
    }

    public void setLocationUrl(String locationUrl) {
        this.locationUrl = locationUrl;
    }

    @Basic
    @Column(name = "LocationPhone", nullable = true, length = 12)
    public String getLocationPhone() {
        return locationPhone;
    }

    public void setLocationPhone(String locationPhone) {
        this.locationPhone = locationPhone;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataLegalEntityEntity other = (RefDataLegalEntityEntity) o;
		return java.util.Objects.equals(legalEntityGuid, other.legalEntityGuid) && java.util.Objects.equals(locationName, other.locationName) && java.util.Objects.equals(address, other.address) && 
			java.util.Objects.equals(city, other.city) && java.util.Objects.equals(state, other.state) && 
			java.util.Objects.equals(zipCode, other.zipCode) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(locationUrl, other.locationUrl) && java.util.Objects.equals(locationPhone, other.locationPhone);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(legalEntityGuid, locationName, address, city, state,
					zipCode, createdUser, status, createdDate,
					locationUrl, locationPhone);
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

    public static List<RefDataLegalEntityEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
