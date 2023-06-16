package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "dataexisting_companies")
public class DataExistingCompaniesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "companiesid", nullable = false)
    private long companiesId;
    @Basic
    @Column(name = "companyname", nullable = true, length = 79)
    private String companyName;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "registeredapp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataExistingCompaniesEntity other = (DataExistingCompaniesEntity) o;
		return java.util.Objects.equals(companiesId, other.companiesId) && java.util.Objects.equals(companyName, other.companyName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(companiesId, companyName, createdDate, createdUser, status,
					registeredApp);
	}


}
