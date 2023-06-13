package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "datagenerated_ein")
public class DataGeneratedEinEntity {
    private long einid;
    private String einValue;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    public DataGeneratedEinEntity() {
    }

    public DataGeneratedEinEntity(String ein) {
        einValue = ein;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "EINID", nullable = false)
    public long getEinid() {
        return einid;
    }

    public void setEinid(long einid) {
        this.einid = einid;
    }

    @Basic
    @Column(name = "EINValue", nullable = true, length = 10)
    public String getEinValue() {
        return einValue;
    }

    public void setEinValue(String einValue) {
        this.einValue = einValue;
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
		DataGeneratedEinEntity other = (DataGeneratedEinEntity) o;
		return java.util.Objects.equals(einid, other.einid) && java.util.Objects.equals(einValue, other.einValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(einid, einValue, createdDate, createdUser, status,
					registeredApp);
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

    public static List<DataGeneratedEinEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }

    public static DataGeneratedEinEntity findByEinNumber(String einValue) {
        return find("einValue", einValue).firstResult();
    }
     */
}
