package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "refdata_codeset")
public class RefDataCodeSetEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codesetsid", nullable = false)
    private long codeSetsId;
    @Basic
    @Column(name = "codesetname", nullable = true, length = 50)
    private String codeSetName;
    @ManyToOne
    @JoinColumn(name = "industrystd", referencedColumnName = "IndustryStd")
    private RefDataIndustryStdEntity industryStd;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @Basic
    @Column(name = "codesetguid", nullable = true, length = 38)
    private String codesetGuid;
    @Basic
    @Column(name = "fieldmapping", nullable = true, length = 20)
    private String fieldMapping;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "sensitivityflagid", referencedColumnName = "SensitiveFlagID")
    private RefDataSensitivityFlagEntity sensitivityFlag;

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

}
