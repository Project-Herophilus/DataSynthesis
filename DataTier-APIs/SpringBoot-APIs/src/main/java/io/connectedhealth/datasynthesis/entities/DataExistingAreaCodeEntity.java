package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "dataexisting_areacode")
public class DataExistingAreaCodeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "areacodeid", nullable = false)
    private long areaCodeId;
    @Basic
    @Column(name = "areacodevalue", nullable = false, length = 3)
    private String areaCodeValue;
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
    @JoinColumn(name = "timezone", referencedColumnName = "TimeZoneValue")
    private RefDataTimeZonesEntity timeZone;
    @ManyToOne
    @JoinColumn(name = "statecode", referencedColumnName = "StateID")
    private RefDataUsStatesEntity state;
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
		DataExistingAreaCodeEntity other = (DataExistingAreaCodeEntity) o;
		return java.util.Objects.equals(areaCodeId, other.areaCodeId) && java.util.Objects.equals(areaCodeValue, other.areaCodeValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(timeZone, other.timeZone) && 
			java.util.Objects.equals(state, other.state);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(areaCodeId, areaCodeValue, createdDate, createdUser, status,
					registeredApp, timeZone, state);
	}


}
