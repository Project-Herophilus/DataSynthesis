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
@Table(name = "dataexisting_zipcodeintl")
public class DataExistingZipCodeIntlEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private int zipCodeIntnlId;
    private String zipCode;
    private String zipCodeType;
    private String city;
    private String lattitude;
    private String longitude;
    private String location;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataCountriesEntity country;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ZipCodeIntnlID", nullable = false)
    public int getZipCodeIntnlId() {
        return zipCodeIntnlId;
    }

    public void setZipCodeIntnlId(int zipCodeIntnlId) {
        this.zipCodeIntnlId = zipCodeIntnlId;
    }

    @Basic
    @Column(name = "ZipCode", nullable = false, length = 10)
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    @Basic
    @Column(name = "ZipCodeType", nullable = true, length = 15)
    public String getZipCodeType() {
        return zipCodeType;
    }

    public void setZipCodeType(String zipCodeType) {
        this.zipCodeType = zipCodeType;
    }

    @Basic
    @Column(name = "City", nullable = true, length = 75)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "Lattitude", nullable = true, length = 10)
    public String getLattitude() {
        return lattitude;
    }

    public void setLattitude(String lattitude) {
        this.lattitude = lattitude;
    }

    @Basic
    @Column(name = "Longitude", nullable = true, length = 10)
    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    @Basic
    @Column(name = "Location", nullable = true, length = 99)
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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
		DataExistingZipCodeIntlEntity other = (DataExistingZipCodeIntlEntity) o;
		return java.util.Objects.equals(zipCodeIntnlId, other.zipCodeIntnlId) && java.util.Objects.equals(zipCode, other.zipCode) && java.util.Objects.equals(zipCodeType, other.zipCodeType) && 
			java.util.Objects.equals(city, other.city) && java.util.Objects.equals(lattitude, other.lattitude) && 
			java.util.Objects.equals(longitude, other.longitude) && java.util.Objects.equals(location, other.location) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(country, other.country);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(zipCodeIntnlId, zipCode, zipCodeType, city, lattitude,
					longitude, location, createdDate, createdUser,
					status, registeredApp, country);
	}

    @ManyToOne
    @JoinColumn(name = "Country", referencedColumnName = "CountryID")
    public RefDataCountriesEntity getCountry() {
        return country;
    }

    public void setCountry(RefDataCountriesEntity country) {
        this.country = country;
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

    public static List<DataExistingZipCodeIntlEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
