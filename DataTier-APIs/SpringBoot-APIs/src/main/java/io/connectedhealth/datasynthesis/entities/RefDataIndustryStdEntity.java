package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_industrystd")
public class RefDataIndustryStdEntity {
    private String industryStd;
    private String industryStdDesc;
    private Timestamp createdDate;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IndustryStd", nullable = false, length = 6)
    public String getIndustryStd() {
        return industryStd;
    }

    public void setIndustryStd(String industryStd) {
        this.industryStd = industryStd;
    }

    @Basic
    @Column(name = "IndustryStdDesc", nullable = true, length = 30)
    public String getIndustryStdDesc() {
        return industryStdDesc;
    }

    public void setIndustryStdDesc(String industryStdDesc) {
        this.industryStdDesc = industryStdDesc;
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
		RefDataIndustryStdEntity other = (RefDataIndustryStdEntity) o;
		return java.util.Objects.equals(industryStd, other.industryStd) && java.util.Objects.equals(industryStdDesc, other.industryStdDesc) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(industryStd, industryStdDesc, createdDate, status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

   /* public static List<RefDataIndustryStdEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
