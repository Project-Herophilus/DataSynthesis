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
@Table(name = "terms_codesetstoapplicationvalues")
public class TermsCodeSetsToApplicationValuesEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long codeSetToApplicationValuesId;
    private TermsCodeSetsToApplicationEntity codeSetToApplication;
    private RefDataCodeSetEntity codeSets;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private String createdUser;
    private String termValue;
    private String termValueLow;
    private String termValueHigh;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CodeSetToApplicationValuesID", nullable = false)
    public long getCodeSetToApplicationValuesId() {
        return codeSetToApplicationValuesId;
    }

    public void setCodeSetToApplicationValuesId(long codeSetToApplicationValuesId) {
        this.codeSetToApplicationValuesId = codeSetToApplicationValuesId;
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
    @Column(name = "TermValue", nullable = true, length = 20)
    public String getTermValue() {
        return termValue;
    }

    public void setTermValue(String termValue) {
        this.termValue = termValue;
    }

    @Basic
    @Column(name = "TermValueLow", nullable = true, length = 10)
    public String getTermValueLow() {
        return termValueLow;
    }

    public void setTermValueLow(String termValueLow) {
        this.termValueLow = termValueLow;
    }

    @Basic
    @Column(name = "TermValueHigh", nullable = true, length = 10)
    public String getTermValueHigh() {
        return termValueHigh;
    }

    public void setTermValueHigh(String termValueHigh) {
        this.termValueHigh = termValueHigh;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		TermsCodeSetsToApplicationValuesEntity other = (TermsCodeSetsToApplicationValuesEntity) o;
		return java.util.Objects.equals(codeSetToApplicationValuesId, other.codeSetToApplicationValuesId) && java.util.Objects.equals(codeSetToApplication, other.codeSetToApplication) && java.util.Objects.equals(codeSets, other.codeSets) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(termValue, other.termValue) && 
			java.util.Objects.equals(termValueLow, other.termValueLow) && java.util.Objects.equals(termValueHigh, other.termValueHigh);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(codeSetToApplicationValuesId, codeSetToApplication, codeSets, createdDate, status,
					createdUser, termValue, termValueLow, termValueHigh);
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
    @JoinColumn(name = "CodeSetToApplicationID", referencedColumnName = "CodeSetToApplicationID")
    public TermsCodeSetsToApplicationEntity getCodeSetToApplication() {
        return codeSetToApplication;
    }

    public void setCodeSetToApplication(TermsCodeSetsToApplicationEntity codeSetToApplication) {
        this.codeSetToApplication = codeSetToApplication;
    }

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    public static List<TermsCodeSetsToApplicationValuesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
