package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "dataexisting_zipcodeus")
public class DataExistingZipCodeUsEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "zipcodeid", nullable = false)
    private long zipCodeId;
    @Basic
    @Column(name = "zipcode", nullable = false, length = 5)
    private String zipCode;
    @Basic
    @Column(name = "zipcodetype", nullable = true, length = 15)
    private String zipCodeType;
    @Basic
    @Column(name = "city", nullable = true, length = 75)
    private String city;
    @Basic
    @Column(name = "statecode", nullable = true, length = 2)
    private String state;
    @Basic
    @Column(name = "lattitude", nullable = true, length = 10)
    private String lattitude;
    @Basic
    @Column(name = "longitude", nullable = true, length = 10)
    private String longitude;
    @Basic
    @Column(name = "lctn", nullable = true, length = 99)
    private String location;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "registeredapp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataExistingZipCodeUsEntity other = (DataExistingZipCodeUsEntity) o;
		return java.util.Objects.equals(zipCodeId, other.zipCodeId) && java.util.Objects.equals(zipCode, other.zipCode) && java.util.Objects.equals(zipCodeType, other.zipCodeType) && 
			java.util.Objects.equals(city, other.city) && java.util.Objects.equals(state, other.state) && 
			java.util.Objects.equals(lattitude, other.lattitude) && java.util.Objects.equals(longitude, other.longitude) && 
			java.util.Objects.equals(location, other.location) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(zipCodeId, zipCode, zipCodeType, city, state,
					lattitude, longitude, location, createdDate,
					createdUser, status, registeredApp);
	}



}
