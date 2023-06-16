package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_useridentities")
public class DataGeneratedUserIdentitiesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "useridentitiesid", nullable = false)
    private long userIdentitiesId;
    @Basic
    @Column(name = "useridentityvalue", nullable = true, length = 20)
    private String userIdentityValue;
    @Basic
    @Column(name = "userdomain", nullable = true, length = 20)
    private String userDomain;
    @Basic
    @Column(name = "additionalattributes", nullable = true, length = 40)
    private String additionalAttributes;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "registeredapp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;
    @ManyToOne
    @JoinColumn(name = "datagentypeid", referencedColumnName = "DataGenTypeID")
    private RefDataDataGenTypesEntity dataGenType;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataGeneratedUserIdentitiesEntity other = (DataGeneratedUserIdentitiesEntity) o;
		return java.util.Objects.equals(userIdentitiesId, other.userIdentitiesId) && java.util.Objects.equals(userIdentityValue, other.userIdentityValue) && java.util.Objects.equals(userDomain, other.userDomain) && 
			java.util.Objects.equals(additionalAttributes, other.additionalAttributes) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) &&
            java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(userIdentitiesId, userIdentityValue, userDomain, additionalAttributes, createdDate,
					status, registeredApp, dataGenType);
	}

}
