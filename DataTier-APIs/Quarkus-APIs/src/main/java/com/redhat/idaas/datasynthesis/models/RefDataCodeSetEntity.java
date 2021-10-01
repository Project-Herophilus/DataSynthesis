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
@Table(name = "refdata_codeset", schema = "datasynthesis", catalog = "")
public class RefDataCodeSetEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long codeSetsId;
    private String codeSetName;
    private RefDataIndustryStdEntity industryStd;
    private Timestamp createdDate;
    private String createdUser;
    private String codesetGuid;
    private String fieldMapping;
    private RefDataStatusEntity status;
    private RefDataSensitivityFlagEntity sensitivityFlag;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CodeSetsID", nullable = false)
    public long getCodeSetsId() {
        return codeSetsId;
    }

    public void setCodeSetsId(long codeSetsId) {
        this.codeSetsId = codeSetsId;
    }

    @Basic
    @Column(name = "CodeSetName", nullable = true, length = 50)
    public String getCodeSetName() {
        return codeSetName;
    }

    public void setCodeSetName(String codeSetName) {
        this.codeSetName = codeSetName;
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
    @Column(name = "CodesetGUID", nullable = true, length = 38)
    public String getCodesetGuid() {
        return codesetGuid;
    }

    public void setCodesetGuid(String codesetGuid) {
        this.codesetGuid = codesetGuid;
    }

    @Basic
    @Column(name = "FieldMapping", nullable = true, length = 20)
    public String getFieldMapping() {
        return fieldMapping;
    }

    public void setFieldMapping(String fieldMapping) {
        this.fieldMapping = fieldMapping;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataCodeSetEntity other = (RefDataCodeSetEntity) o;
		return java.util.Objects.equals(codeSetsId, other.codeSetsId) && java.util.Objects.equals(codeSetName, other.codeSetName) && java.util.Objects.equals(industryStd, other.industryStd) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(codesetGuid, other.codesetGuid) && java.util.Objects.equals(fieldMapping, other.fieldMapping) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(codeSetsId, codeSetName, industryStd, createdDate, createdUser,
					codesetGuid, fieldMapping, status, sensitivityFlag);
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
    @JoinColumn(name = "SensitivityFlagID", referencedColumnName = "SensitiveFlagID")
    public RefDataSensitivityFlagEntity getSensitivityFlag() {
        return sensitivityFlag;
    }

    public void setSensitivityFlag(RefDataSensitivityFlagEntity sensitivityFlag) {
        this.sensitivityFlag = sensitivityFlag;
    }

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    public static List<RefDataCodeSetEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
