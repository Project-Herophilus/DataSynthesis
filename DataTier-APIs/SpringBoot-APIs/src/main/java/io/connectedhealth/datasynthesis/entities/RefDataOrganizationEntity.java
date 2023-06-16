package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "impl_organization")
public class RefDataOrganizationEntity {
    @Id
    @GeneratedValue
    @Column(name = "organizationguid", nullable = false, length = 38)
    private String organizationGuid;
    @Basic
    @Column(name = "organizationinternalcode", nullable = true, length = 10)
    private String organizationInternalCode;
    @Basic
    @Column(name = "organizationinternalid", nullable = true, length = 10)
    private String organizationInternalId;
    @Basic
    @Column(name = "organizationname", nullable = true, length = 50)
    private String organizationName;
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
    @ManyToOne
    @JoinColumn(name = "legalentityguid", referencedColumnName = "LegalEntityGUID")
    private RefDataLegalEntityEntity legalEntityGuid;

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


}
