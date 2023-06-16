package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "impl_legalentities")
public class RefDataLegalEntityEntity {
    @Id
    @GeneratedValue
    @Column(name = "legalentityguid", nullable = false, length = 38)
    private String legalEntityGuid;
    @Basic
    @Column(name = "locationname", nullable = true, length = 50)
    private String locationName;
    @Basic
    @Column(name = "address", nullable = true, length = 75)
    private String address;
    @Basic
    @Column(name = "city", nullable = true, length = 60)
    private String city;
    @ManyToOne
    @JoinColumn(name = "stateid", referencedColumnName = "StateID")
    private RefDataUsStatesEntity state;
    @Basic
    @Column(name = "zipcode", nullable = true, length = 12)
    private String zipCode;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @Basic
    @Column(name = "createddate", nullable = false)
    private Timestamp createdDate;
    @Basic
    @Column(name = "locationurl", nullable = true, length = 99)
    private String locationUrl;
    @Basic
    @Column(name = "locationphone", nullable = true, length = 12)
    private String locationPhone;

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

}
