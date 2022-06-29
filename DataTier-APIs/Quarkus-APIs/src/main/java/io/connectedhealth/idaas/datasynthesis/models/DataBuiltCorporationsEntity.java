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
@Table(name = "databuilt_corporations")
public class DataBuiltCorporationsEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long dataBuiltCorporationId;
    private String corporationName;
    private String address1;
    private String city;
    private String stateId;
    private String zipCode;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DataBuiltCorporationID", nullable = false)
    public long getDataBuiltCorporationId() {
        return dataBuiltCorporationId;
    }

    public void setDataBuiltCorporationId(long dataBuiltCorporationId) {
        this.dataBuiltCorporationId = dataBuiltCorporationId;
    }

    @Basic
    @Column(name = "CorporationName", nullable = true, length = 99)
    public String getCorporationName() {
        return corporationName;
    }

    public void setCorporationName(String corporationName) {
        this.corporationName = corporationName;
    }

    @Basic
    @Column(name = "Address1", nullable = true, length = 99)
    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    @Basic
    @Column(name = "City", nullable = true, length = 70)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "StateID", nullable = true, length = 2)
    public String getStateId() {
        return stateId;
    }

    public void setStateId(String stateId) {
        this.stateId = stateId;
    }

    @Basic
    @Column(name = "ZipCode", nullable = true, length = 10)
    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
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
		DataBuiltCorporationsEntity other = (DataBuiltCorporationsEntity) o;
		return java.util.Objects.equals(dataBuiltCorporationId, other.dataBuiltCorporationId) && java.util.Objects.equals(corporationName, other.corporationName) && java.util.Objects.equals(address1, other.address1) && 
			java.util.Objects.equals(city, other.city) && java.util.Objects.equals(stateId, other.stateId) && 
			java.util.Objects.equals(zipCode, other.zipCode) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dataBuiltCorporationId, corporationName, address1, city, stateId,
					zipCode, createdDate, status, registeredApp);
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

    public static List<DataBuiltCorporationsEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
