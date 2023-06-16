package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "refdata_sensitivityflag")
public class RefDataSensitivityFlagEntity  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "sensitiveflagid", nullable = false)
    private short sensitiveFlagId;
    @Basic
    @Column(name = "sensitiveflagdesc", nullable = true, length = 30)
    private String sensitiveFlagDesc;
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
		RefDataSensitivityFlagEntity other = (RefDataSensitivityFlagEntity) o;
		return java.util.Objects.equals(sensitiveFlagId, other.sensitiveFlagId) && java.util.Objects.equals(sensitiveFlagDesc, other.sensitiveFlagDesc) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(sensitiveFlagId, sensitiveFlagDesc, createdDate, status);
	}

}
