package io.connectedhealth.idaas.datasynthesis.models;

import java.sql.Date;
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
@Table(name = "databuilt_persondemographics")
public class DataBuiltPersonDemographicsEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long personDemographicsId;
    private String dln;
    private String dlnState;
    private String ssn;
    private String dobValue;
    private Date dobDate;
    private Integer age;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PersonDemographicsID", nullable = false)
    public long getPersonDemographicsId() {
        return personDemographicsId;
    }

    public void setPersonDemographicsId(long personDemographicsId) {
        this.personDemographicsId = personDemographicsId;
    }

    @Basic
    @Column(name = "DLN", nullable = true, length = 25)
    public String getDln() {
        return dln;
    }

    public void setDln(String dln) {
        this.dln = dln;
    }

    @Basic
    @Column(name = "DLNState", nullable = true, length = 2)
    public String getDlnState() {
        return dlnState;
    }

    public void setDlnState(String dlnState) {
        this.dlnState = dlnState;
    }

    @Basic
    @Column(name = "SSN", nullable = true, length = 11)
    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    @Basic
    @Column(name = "DOBValue", nullable = true, length = 12)
    public String getDobValue() {
        return dobValue;
    }

    public void setDobValue(String dobValue) {
        this.dobValue = dobValue;
    }

    @Basic
    @Column(name = "DOBDate", nullable = true)
    public Date getDobDate() {
        return dobDate;
    }

    public void setDobDate(Date dobDate) {
        this.dobDate = dobDate;
    }

    @Basic
    @Column(name = "Age", nullable = true)
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
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
		DataBuiltPersonDemographicsEntity other = (DataBuiltPersonDemographicsEntity) o;
		return java.util.Objects.equals(personDemographicsId, other.personDemographicsId) && java.util.Objects.equals(dln, other.dln) && java.util.Objects.equals(dlnState, other.dlnState) && 
			java.util.Objects.equals(ssn, other.ssn) && java.util.Objects.equals(dobValue, other.dobValue) && 
			java.util.Objects.equals(dobDate, other.dobDate) && java.util.Objects.equals(age, other.age) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(personDemographicsId, dln, dlnState, ssn, dobValue,
					dobDate, age, createdDate, status,
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

    @ManyToOne
    @JoinColumn(name = "RegisteredApp", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getRegisteredApp() {
        return registeredApp;
    }

    public void setRegisteredApp(RefDataApplicationEntity registeredApp) {
        this.registeredApp = registeredApp;
    }

    public static List<DataBuiltPersonDemographicsEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
