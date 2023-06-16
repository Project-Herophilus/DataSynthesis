package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "refdata_datagentypes")
public class RefDataDataGenTypesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "datagentypeid", nullable = false)
    private short dataGenTypeId;
    @Basic
    @Column(name = "datagentypedescription", nullable = true, length = 65)
    private String dataGenTypeDescription;
    @Basic
    @Column(name = "definition", nullable = true, length = 256)
    private String definition;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "dataattributeid", referencedColumnName = "PlatformDataAttributesID")
    private PlatformDataAttributesEntity dataAttribute;


/*
    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataDataGenTypesEntity other = (RefDataDataGenTypesEntity) o;
		return java.util.Objects.equals(dataGenTypeId, other.dataGenTypeId) && java.util.Objects.equals(dataGenTypeDescription, other.dataGenTypeDescription) && java.util.Objects.equals(definition, other.definition) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(dataAttribute, other.dataAttribute);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dataGenTypeId, dataGenTypeDescription, definition, createdUser, createdDate,
					status, dataAttribute);
	}
*/


}
