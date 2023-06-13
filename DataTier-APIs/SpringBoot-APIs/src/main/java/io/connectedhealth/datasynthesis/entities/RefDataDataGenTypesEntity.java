package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "refdata_datagentypes")
public class RefDataDataGenTypesEntity {
    private short dataGenTypeId;
    private String dataGenTypeDescription;
    private String definition;
    private String createdUser;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private PlatformDataAttributesEntity dataAttribute;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DataGenTypeID", nullable = false)
    public short getDataGenTypeId() {
        return dataGenTypeId;
    }

    public void setDataGenTypeId(short dataGenTypeId) {
        this.dataGenTypeId = dataGenTypeId;
    }

    @Basic
    @Column(name = "Definition", nullable = true, length = 256)
    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    @Basic
    @Column(name = "DataGenTypeDescription", nullable = true, length = 65)
    public String getDataGenTypeDescription() {
        return dataGenTypeDescription;
    }

    public void setDataGenTypeDescription(String description) {
        this.dataGenTypeDescription = description;
    }

    @Basic
    @Column(name = "CreatedUser", nullable = true, length = 20)
    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
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

    @ManyToOne
    @JoinColumn(name = "DataAttributeID", referencedColumnName = "PlatformDataAttributesId")
    public PlatformDataAttributesEntity getDataAttribute() {
        return dataAttribute;
    }

    public void setDataAttribute(PlatformDataAttributesEntity dataAttribute) {
        this.dataAttribute = dataAttribute;
    }

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    /*public static List<RefDataDataGenTypesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }*/
}
