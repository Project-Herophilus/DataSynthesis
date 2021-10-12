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
@Table(name = "dataexisting_ababanking", schema = "datasynthesis", catalog = "")
public class DataExistingAbaBankingEntity extends BaseEntity {
    private long abaBankingId;
    private String routingNumber;
    private String telegraphicName;
    private String customerName;
    private String city;
    private String state;
    private String zipCode;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ABABankingID", nullable = false)
    public long getAbaBankingId() {
        return abaBankingId;
    }

    public void setAbaBankingId(long abaBankingId) {
        this.abaBankingId = abaBankingId;
    }

    @Basic
    @Column(name = "RoutingNumber", nullable = true, length = 9)
    public String getRoutingNumber() {
        return routingNumber;
    }

    public void setRoutingNumber(String routingNumber) {
        this.routingNumber = routingNumber;
    }

    @Basic
    @Column(name = "TelegraphicName", nullable = true, length = 20)
    public String getTelegraphicName() {
        return telegraphicName;
    }

    public void setTelegraphicName(String telegraphicName) {
        this.telegraphicName = telegraphicName;
    }

    @Basic
    @Column(name = "CustomerName", nullable = true, length = 36)
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    @Basic
    @Column(name = "City", nullable = true, length = 20)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "State", nullable = true, length = 2)
    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Basic
    @Column(name = "ZipCode", nullable = true, length = 5)
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
		DataExistingAbaBankingEntity other = (DataExistingAbaBankingEntity) o;
		return java.util.Objects.equals(abaBankingId, other.abaBankingId) && java.util.Objects.equals(routingNumber, other.routingNumber) && java.util.Objects.equals(telegraphicName, other.telegraphicName) && 
			java.util.Objects.equals(customerName, other.customerName) && java.util.Objects.equals(city, other.city) && 
			java.util.Objects.equals(state, other.state) && java.util.Objects.equals(zipCode, other.zipCode) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(abaBankingId, routingNumber, telegraphicName, customerName, city,
					state, zipCode, createdDate, createdUser,
					status, registeredApp);
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

    public static List<DataExistingAbaBankingEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
