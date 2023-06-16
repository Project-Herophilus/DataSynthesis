package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_driverslicenses")
public class DataGeneratedDriversLicensesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "driverslicensesid", nullable = false)
    private long driversLicensesId;
    @Basic
    @Column(name = "dln", nullable = true, length = 25)private String dln;
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
    @ManyToOne
    @JoinColumn(name = "datagentypeid", referencedColumnName = "DataGenTypeID")
    private RefDataDataGenTypesEntity dataGenType;
    @ManyToOne
    @JoinColumn(name = "StateCode", referencedColumnName = "StateID")
    private RefDataUsStatesEntity state;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataGeneratedDriversLicensesEntity other = (DataGeneratedDriversLicensesEntity) o;
		return java.util.Objects.equals(driversLicensesId, other.driversLicensesId) && java.util.Objects.equals(dln, other.dln) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(state, other.state) && java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(driversLicensesId, dln, createdDate, createdUser,
					status, registeredApp, state, dataGenType);
	}


}
