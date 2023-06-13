package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_timezones")
public class RefDataTimeZonesEntity {
    private String timeZoneValue;
    private String timeZoneDesc;
    private Timestamp createdDate;
    private RefDataStatusEntity status;

    @Id
    @GeneratedValue
    @Column(name = "TimeZoneValue", nullable = false, length = 3)
    public String getTimeZoneValue() {
        return timeZoneValue;
    }

    public void setTimeZoneValue(String timeZoneValue) {
        this.timeZoneValue = timeZoneValue;
    }

    @Basic
    @Column(name = "TimeZoneDesc", nullable = true, length = 25)
    public String getTimeZoneDesc() {
        return timeZoneDesc;
    }

    public void setTimeZoneDesc(String timeZoneDesc) {
        this.timeZoneDesc = timeZoneDesc;
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
		RefDataTimeZonesEntity other = (RefDataTimeZonesEntity) o;
		return java.util.Objects.equals(timeZoneValue, other.timeZoneValue) && java.util.Objects.equals(timeZoneDesc, other.timeZoneDesc) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(timeZoneValue, timeZoneDesc, createdDate, status);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

   /* public static List<RefDataTimeZonesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
