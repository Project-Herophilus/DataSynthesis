package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "dataexisting_namelast")
public class DataExistingNameLastEntity {
    private long lastNameId;
    private String lastName;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    public DataExistingNameLastEntity(){
    }

    public DataExistingNameLastEntity(String lastName) {
        this.lastName = lastName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "LastNameID", nullable = false)
    public long getLastNameId() {
        return lastNameId;
    }

    public void setLastNameId(long lastNameId) {
        this.lastNameId = lastNameId;
    }

    @Basic
    @Column(name = "LastName", nullable = true, length = 69)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
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
		DataExistingNameLastEntity other = (DataExistingNameLastEntity) o;
		return java.util.Objects.equals(lastNameId, other.lastNameId) && java.util.Objects.equals(lastName, other.lastName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(lastNameId, lastName, createdDate, createdUser, status,
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
    */
}
