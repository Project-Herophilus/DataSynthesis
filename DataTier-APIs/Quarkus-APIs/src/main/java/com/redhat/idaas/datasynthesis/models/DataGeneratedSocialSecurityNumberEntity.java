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
@Table(name = "datagenerated_socialsecuritynumber", schema = "datasynthesis", catalog = "")
public class DataGeneratedSocialSecurityNumberEntity extends BaseEntity {
    private long socialSecurityNumberId;
    private String socialSecurityNumberValue;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    public DataGeneratedSocialSecurityNumberEntity() {
    }

    public DataGeneratedSocialSecurityNumberEntity(String ssn) {
        socialSecurityNumberValue = ssn;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SocialSecurityNumberID", nullable = false)
    public long getSocialSecurityNumberId() {
        return socialSecurityNumberId;
    }

    public void setSocialSecurityNumberId(long socialSecurityNumberId) {
        this.socialSecurityNumberId = socialSecurityNumberId;
    }

    @Basic
    @Column(name = "SocialSecurityNumberValue", nullable = true, length = 11)
    public String getSocialSecurityNumberValue() {
        return socialSecurityNumberValue;
    }

    public void setSocialSecurityNumberValue(String socialSecurityNumberValue) {
        this.socialSecurityNumberValue = socialSecurityNumberValue;
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
		DataGeneratedSocialSecurityNumberEntity other = (DataGeneratedSocialSecurityNumberEntity) o;
		return java.util.Objects.equals(socialSecurityNumberId, other.socialSecurityNumberId) && java.util.Objects.equals(socialSecurityNumberValue, other.socialSecurityNumberValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(socialSecurityNumberId, socialSecurityNumberValue, createdDate, createdUser, status,
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

    public static List<DataGeneratedSocialSecurityNumberEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }

    public static DataGeneratedSocialSecurityNumberEntity findBySSN(String ssn) {
        return find("socialSecurityNumberValue", ssn).firstResult();
    }
}
