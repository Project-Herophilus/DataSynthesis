package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_addresses")
public class DataGeneratedAddressesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "addressid", nullable = false)
    private long addressId;
    @Basic
    @Column(name = "addressstreet", nullable = true, length = 99)
    private String addressStreet;
    @Basic
    @Column(name = "addressstreet2", nullable = true, length = 59)
    private String addressStreet2;
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
		DataGeneratedAddressesEntity other = (DataGeneratedAddressesEntity) o;
		return java.util.Objects.equals(addressId, other.addressId) && java.util.Objects.equals(addressStreet, other.addressStreet) && java.util.Objects.equals(addressStreet2, other.addressStreet2) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(addressId, addressStreet, addressStreet2, createdDate, createdUser,
					status, registeredApp, dataGenType);
	}

}
