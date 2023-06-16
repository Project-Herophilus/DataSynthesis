package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "refdata_industrystd")
public class RefDataIndustryStdEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "industrystd", nullable = false, length = 6)
    private String industryStd;
    @Basic
    @Column(name = "industrystddesc", nullable = true, length = 30)
    private String industryStdDesc;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataIndustryStdEntity other = (RefDataIndustryStdEntity) o;
		return java.util.Objects.equals(industryStd, other.industryStd) && java.util.Objects.equals(industryStdDesc, other.industryStdDesc) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(industryStd, industryStdDesc, createdDate, status);
	}

}
