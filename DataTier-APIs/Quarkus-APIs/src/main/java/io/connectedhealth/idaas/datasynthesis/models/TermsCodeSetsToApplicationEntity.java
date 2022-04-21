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
@Table(name = "terms_codesetstoapplication")
public class TermsCodeSetsToApplicationEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long codeSetToApplicationId;
    private RefDataCodeSetEntity codeSets;
    private String domain;
    private RefDataIndustryStdEntity industryStd;
    private String specificDetails;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private String createdUser;
    private RefDataOrganizationEntity organization;
    private RefDataApplicationEntity application;
    private RefDataVendorEntity vendor;
    private String codeValue;
    private String codeDesc;
    private RefDataSensitivityFlagEntity sensitiveFlag;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CodeSetToApplicationID", nullable = false)
    public long getCodeSetToApplicationId() {
        return codeSetToApplicationId;
    }

    public void setCodeSetToApplicationId(long codeSetToApplicationId) {
        this.codeSetToApplicationId = codeSetToApplicationId;
    }

    @Basic
    @Column(name = "Domain", nullable = true, length = 50)
    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    @Basic
    @Column(name = "SpecificDetails", nullable = true, length = 99)
    public String getSpecificDetails() {
        return specificDetails;
    }

    public void setSpecificDetails(String specificDetails) {
        this.specificDetails = specificDetails;
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

    @Basic
    @Column(name = "CodeValue", nullable = true, length = 20)
    public String getCodeValue() {
        return codeValue;
    }

    public void setCodeValue(String codeValue) {
        this.codeValue = codeValue;
    }

    @Basic
    @Column(name = "CodeDesc", nullable = true, length = 129)
    public String getCodeDesc() {
        return codeDesc;
    }

    public void setCodeDesc(String codeDesc) {
        this.codeDesc = codeDesc;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		TermsCodeSetsToApplicationEntity other = (TermsCodeSetsToApplicationEntity) o;
		return java.util.Objects.equals(codeSetToApplicationId, other.codeSetToApplicationId) && java.util.Objects.equals(codeSets, other.codeSets) && java.util.Objects.equals(domain, other.domain) && 
			java.util.Objects.equals(industryStd, other.industryStd) && java.util.Objects.equals(specificDetails, other.specificDetails) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(organization, other.organization) && 
			java.util.Objects.equals(application, other.application) && java.util.Objects.equals(vendor, other.vendor) && 
			java.util.Objects.equals(codeValue, other.codeValue) && java.util.Objects.equals(codeDesc, other.codeDesc) && 
			java.util.Objects.equals(sensitiveFlag, other.sensitiveFlag);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(codeSetToApplicationId, codeSets, domain, industryStd, specificDetails,
					createdDate, status, createdUser, organization,
					application, vendor, codeValue, codeDesc,
					sensitiveFlag);
	}

    @ManyToOne
    @JoinColumn(name = "SensitivityFlagID", referencedColumnName = "SensitiveFlagID")
    public RefDataSensitivityFlagEntity getSensitiveFlag() {
        return sensitiveFlag;
    }

    public void setSensitiveFlag(RefDataSensitivityFlagEntity sensitiveFlag) {
        this.sensitiveFlag = sensitiveFlag;
    }

    @ManyToOne
    @JoinColumn(name = "IndustryStd", referencedColumnName = "IndustryStd")
    public RefDataIndustryStdEntity getIndustryStd() {
        return industryStd;
    }

    public void setIndustryStd(RefDataIndustryStdEntity industryStd) {
        this.industryStd = industryStd;
    }

    @ManyToOne
    @JoinColumn(name = "CodeSetsID", referencedColumnName = "CodeSetsID")
    public RefDataCodeSetEntity getCodeSets() {
        return codeSets;
    }

    public void setCodeSets(RefDataCodeSetEntity codeSets) {
        this.codeSets = codeSets;
    }

    @ManyToOne
    @JoinColumn(name = "OrganizationID", referencedColumnName = "OrganizationGUID")
    public RefDataOrganizationEntity getOrganization() {
        return organization;
    }

    public void setOrganization(RefDataOrganizationEntity organization) {
        this.organization = organization;
    }

    @ManyToOne
    @JoinColumn(name = "VendorID", referencedColumnName = "VendorID")
    public RefDataVendorEntity getVendor() {
        return vendor;
    }

    public void setVendor(RefDataVendorEntity vendor) {
        this.vendor = vendor;
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
    @JoinColumn(name = "ApplicationID", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getApplication() {
        return application;
    }

    public void setApplication(RefDataApplicationEntity application) {
        this.application = application;
    }

    public static List<TermsCodeSetsToApplicationEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
