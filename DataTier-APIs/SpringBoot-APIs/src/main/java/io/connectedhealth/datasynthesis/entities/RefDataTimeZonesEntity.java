package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "refdata_timezones")
public class RefDataTimeZonesEntity {
    @Id
    @GeneratedValue
    @Column(name = "timezonevalue", nullable = false, length = 3)
    private String timeZoneValue;
    @Basic
    @Column(name = "timezonedesc", nullable = true, length = 25)
    private String timeZoneDesc;
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
		RefDataTimeZonesEntity other = (RefDataTimeZonesEntity) o;
		return java.util.Objects.equals(timeZoneValue, other.timeZoneValue) && java.util.Objects.equals(timeZoneDesc, other.timeZoneDesc) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(timeZoneValue, timeZoneDesc, createdDate, status);
	}



}
