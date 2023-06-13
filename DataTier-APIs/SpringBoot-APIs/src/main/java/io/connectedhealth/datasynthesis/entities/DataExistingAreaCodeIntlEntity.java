package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "dataexisting_areacodeintl")
public class DataExistingAreaCodeIntlEntity {
    private String iddCode;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataCountriesEntity country;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IDDCode", nullable = false, length = 5)
    public String getIddCode() {
        return iddCode;
    }

    public void setIddCode(String iddCode) {
        this.iddCode = iddCode;
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
		DataExistingAreaCodeIntlEntity other = (DataExistingAreaCodeIntlEntity) o;
		return java.util.Objects.equals(iddCode, other.iddCode) && java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(country, other.country);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(iddCode, createdDate, status, registeredApp, country);
	}

    @ManyToOne
    @JoinColumn(name = "CountryID", referencedColumnName = "CountryID")
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

    /*
    @ManyToOne
    @JoinColumn(name = "RegisteredApp", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getRegisteredApp() {
        return registeredApp;
    }

    public void setRegisteredApp(RefDataApplicationEntity registeredApp) {
        this.registeredApp = registeredApp;
    }
    */

}
