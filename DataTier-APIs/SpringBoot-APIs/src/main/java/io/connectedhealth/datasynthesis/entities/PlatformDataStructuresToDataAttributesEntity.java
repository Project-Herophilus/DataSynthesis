package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "platform_config_datastructures_dtl")
public class PlatformDataStructuresToDataAttributesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "platformdatastructurestodataattributesid", nullable = false)
    private short platformDataStructuresToDataAttributesId;
    @Basic
    @Column(name = "compositeDatastructurename", nullable = true, length = 50)
    private String compositeDataStructureName;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @Basic
    @Column(name = "PlatformDataStructuresToDataAttributesGUID", nullable = true, length = 38)
    private String platformDataStructuresToDataAttributesGuid;
    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "RegisteredApp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;
    @ManyToOne
    @JoinColumn(name = "SensitivityFlagID", referencedColumnName = "SensitiveFlagID")
    private RefDataSensitivityFlagEntity sensitivityFlag;
    @ManyToOne
    @JoinColumn(name = "PlatformDataAttributesID", referencedColumnName = "PlatformDataAttributesID")
    private PlatformDataAttributesEntity platformDataAttributes;
    @ManyToOne
    @JoinColumn(name = "PlatformDataStructuresID", referencedColumnName = "PlatformDataStructuresID")
    private PlatformConfigDataStructuresEntity platformDataStructures;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		PlatformDataStructuresToDataAttributesEntity other = (PlatformDataStructuresToDataAttributesEntity) o;
		return java.util.Objects.equals(platformDataStructuresToDataAttributesId, other.platformDataStructuresToDataAttributesId) && java.util.Objects.equals(compositeDataStructureName, other.compositeDataStructureName) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(platformDataStructuresToDataAttributesGuid, other.platformDataStructuresToDataAttributesGuid) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
			java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag) && java.util.Objects.equals(platformDataAttributes, other.platformDataAttributes) && 
			java.util.Objects.equals(platformDataStructures, other.platformDataStructures);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(platformDataStructuresToDataAttributesId, compositeDataStructureName, createdDate, createdUser, platformDataStructuresToDataAttributesGuid,
					status, registeredApp, sensitivityFlag, platformDataAttributes,
					platformDataStructures);
	}



}
