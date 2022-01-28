package com.redhat.idaas.datasynthesis.models;

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
@Table(name = "datagenerated_phonenumbersintl")
public class DataGeneratedPhoneNumbersIntlEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long phoneNumberIntlId;
    private String phoneNumberValue;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataCountriesEntity country;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PhoneNumberIntlID", nullable = false)
    public long getPhoneNumberIntlId() {
        return phoneNumberIntlId;
    }

    public void setPhoneNumberIntlId(long phoneNumberIntlId) {
        this.phoneNumberIntlId = phoneNumberIntlId;
    }

    @Basic
    @Column(name = "PhoneNumberValue", nullable = true, length = 12)
    public String getPhoneNumberValue() {
        return phoneNumberValue;
    }

    public void setPhoneNumberValue(String phoneNumberValue) {
        this.phoneNumberValue = phoneNumberValue;
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
		DataGeneratedPhoneNumbersIntlEntity other = (DataGeneratedPhoneNumbersIntlEntity) o;
		return java.util.Objects.equals(phoneNumberIntlId, other.phoneNumberIntlId) && java.util.Objects.equals(phoneNumberValue, other.phoneNumberValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(country, other.country);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(phoneNumberIntlId, phoneNumberValue, createdDate, createdUser, status,
					registeredApp, country);
	}

    @ManyToOne
    @JoinColumn(name = "CountryId", referencedColumnName = "CountryID")
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

    public static List<DataGeneratedPhoneNumbersIntlEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
