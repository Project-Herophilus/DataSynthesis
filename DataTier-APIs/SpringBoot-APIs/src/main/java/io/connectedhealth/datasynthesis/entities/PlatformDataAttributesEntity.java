package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "platform_dataattributes")
public class PlatformDataAttributesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "platformdataattributesid", nullable = false)
    private short platformDataAttributesId;
    @Basic
    @Column(name = "dataattributename", nullable = true, length = 50)
    private String dataAttributeName;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @Basic
    @Column(name = "platformdataattributeguid", nullable = true, length = 38)
    private String platformDataAttributeGuid;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "registeredapp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;
    @ManyToOne
    @JoinColumn(name = "sensitivityflagid", referencedColumnName = "SensitiveFlagID")
    private RefDataSensitivityFlagEntity sensitivityFlag;
    @Basic
    @Column(name = "platformtablename", nullable = true, length = 38)
    private String platformTableName;

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null)
            return false;
        if (getClass() != o.getClass())
            return false;
        PlatformDataAttributesEntity other = (PlatformDataAttributesEntity) o;
        return java.util.Objects.equals(platformDataAttributesId, other.platformDataAttributesId) && java.util.Objects.equals(dataAttributeName, other.dataAttributeName) && java.util.Objects.equals(createdDate, other.createdDate) &&
                java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(platformDataAttributeGuid, other.platformDataAttributeGuid) && java.util.Objects.equals(platformTableName, other.platformTableName) &&
                java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) &&
                java.util.Objects.equals(sensitivityFlag, other.sensitivityFlag);
    }

    @Override
    public int hashCode() {
        return java.util.Objects.hash(platformDataAttributesId, dataAttributeName, createdDate, createdUser, platformDataAttributeGuid, platformTableName,
                status, registeredApp, sensitivityFlag);
    }


}