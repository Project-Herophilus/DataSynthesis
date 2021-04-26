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
@Table(name = "refdata_codesetstructures", schema = "datasynthesis", catalog = "")
public class RefDataCodeSetStructuresEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long codeSetStructuresId;
    private String codeSetStructureName;
    private RefDataIndustryStdEntity industryStd;
    private RefDataStatusEntity status;
    private Timestamp createdDate;
    private String createdUser;
    private String codesetStructureGuid;
    private String field1Value;
    private String field2Value;
    private String field3Value;
    private String field4Value;
    private String field5Value;
    private String field6Value;
    private String field7Value;
    private String field8Value;
    private String field9Value;
    private RefDataSensitivityFlagEntity sensitivityFlag;
    private RefDataCodeSetEntity codeSet;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "CodeSetStructuresID", nullable = false)
    public long getCodeSetStructuresId() {
        return codeSetStructuresId;
    }

    public void setCodeSetStructuresId(long codeSetStructuresId) {
        this.codeSetStructuresId = codeSetStructuresId;
    }

    @Basic
    @Column(name = "CodeSetStructureName", nullable = true, length = 50)
    public String getCodeSetStructureName() {
        return codeSetStructureName;
    }

    public void setCodeSetStructureName(String codeSetStructureName) {
        this.codeSetStructureName = codeSetStructureName;
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
    @Column(name = "CodesetStructureGUID", nullable = true, length = 38)
    public String getCodesetStructureGuid() {
        return codesetStructureGuid;
    }

    public void setCodesetStructureGuid(String codesetStructureGuid) {
        this.codesetStructureGuid = codesetStructureGuid;
    }

    @Basic
    @Column(name = "Field1Value", nullable = true, length = 75)
    public String getField1Value() {
        return field1Value;
    }

    public void setField1Value(String field1Value) {
        this.field1Value = field1Value;
    }

    @Basic
    @Column(name = "Field2Value", nullable = true, length = 75)
    public String getField2Value() {
        return field2Value;
    }

    public void setField2Value(String field2Value) {
        this.field2Value = field2Value;
    }

    @Basic
    @Column(name = "Field3Value", nullable = true, length = 75)
    public String getField3Value() {
        return field3Value;
    }

    public void setField3Value(String field3Value) {
        this.field3Value = field3Value;
    }

    @Basic
    @Column(name = "Field4Value", nullable = true, length = 75)
    public String getField4Value() {
        return field4Value;
    }

    public void setField4Value(String field4Value) {
        this.field4Value = field4Value;
    }

    @Basic
    @Column(name = "Field5Value", nullable = true, length = 75)
    public String getField5Value() {
        return field5Value;
    }

    public void setField5Value(String field5Value) {
        this.field5Value = field5Value;
    }

    @Basic
    @Column(name = "Field6Value", nullable = true, length = 75)
    public String getField6Value() {
        return field6Value;
    }

    public void setField6Value(String field6Value) {
        this.field6Value = field6Value;
    }

    @Basic
    @Column(name = "Field7Value", nullable = true, length = 75)
    public String getField7Value() {
        return field7Value;
    }

    public void setField7Value(String field7Value) {
        this.field7Value = field7Value;
    }

    @Basic
    @Column(name = "Field8Value", nullable = true, length = 75)
    public String getField8Value() {
        return field8Value;
    }

    public void setField8Value(String field8Value) {
        this.field8Value = field8Value;
    }

    @Basic
    @Column(name = "Field9Value", nullable = true, length = 75)
    public String getField9Value() {
        return field9Value;
    }

    public void setField9Value(String field9Value) {
        this.field9Value = field9Value;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataCodeSetStructuresEntity other = (RefDataCodeSetStructuresEntity) o;
		return java.util.Objects.equals(codeSetStructuresId, other.codeSetStructuresId) && java.util.Objects.equals(codeSetStructureName, other.codeSetStructureName) && java.util.Objects.equals(industryStd, other.industryStd) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(codesetStructureGuid, other.codesetStructureGuid) && 
			java.util.Objects.equals(field1Value, other.field1Value) && java.util.Objects.equals(field2Value, other.field2Value) && 
			java.util.Objects.equals(field3Value, other.field3Value) && java.util.Objects.equals(field4Value, other.field4Value) && 
			java.util.Objects.equals(field5Value, other.field5Value) && java.util.Objects.equals(field6Value, other.field6Value) && 
			java.util.Objects.equals(field7Value, other.field7Value) && java.util.Objects.equals(field8Value, other.field8Value) && 
			java.util.Objects.equals(field9Value, other.field9Value) && java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag) && 
			java.util.Objects.equals(codeSet, other.codeSet);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(codeSetStructuresId, codeSetStructureName, industryStd, status, createdDate,
					createdUser, codesetStructureGuid, field1Value, field2Value,
					field3Value, field4Value, field5Value, field6Value,
					field7Value, field8Value, field9Value, sensitivityFlag,
					codeSet);
	}

    @ManyToOne
    @JoinColumn(name = "CodesetsID", referencedColumnName = "CodeSetsID")
    public RefDataCodeSetEntity getCodeSet() {
        return codeSet;
    }

    public void setCodeSet(RefDataCodeSetEntity codeSet) {
        this.codeSet = codeSet;
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

    public static List<RefDataCodeSetStructuresEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
