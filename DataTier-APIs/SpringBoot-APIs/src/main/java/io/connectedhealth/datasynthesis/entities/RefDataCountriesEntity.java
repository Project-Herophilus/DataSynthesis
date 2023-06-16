package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "refdata_countries")
public class RefDataCountriesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "countryid", nullable = false)
    private short countryId;
    @Basic
    @Column(name = "idd", nullable = true, length = 5)
    private String idd;
    @Basic
    @Column(name = "countryname", nullable = true, length = 59)
    private String countryName;
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
		RefDataCountriesEntity other = (RefDataCountriesEntity) o;
		return java.util.Objects.equals(countryId, other.countryId) && java.util.Objects.equals(idd, other.idd) && java.util.Objects.equals(countryName, other.countryName) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(countryId, idd, countryName, createdDate, status);
	}


}
