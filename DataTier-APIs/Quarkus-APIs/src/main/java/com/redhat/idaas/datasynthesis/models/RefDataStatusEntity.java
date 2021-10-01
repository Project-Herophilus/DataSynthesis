package com.redhat.idaas.datasynthesis.models;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "refdata_status", schema = "datasynthesis", catalog = "")
public class RefDataStatusEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private short statusId;
    private String statusDescription;
    private Timestamp createdDate;
    private String createdUser;

    public RefDataStatusEntity(short statusId, String statusDescription, Timestamp createdDate, String createdUser) {
        this.statusId = statusId;
        this.statusDescription = statusDescription;
        this.createdDate = createdDate;
        this.createdUser = createdUser;
    }

    public RefDataStatusEntity(short statusId) {
        this.statusId = statusId;
    }

    public RefDataStatusEntity() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "StatusID", nullable = false)
    public short getStatusId() {
        return statusId;
    }

    public void setStatusId(short statusId) {
        this.statusId = statusId;
    }

    @Basic
    @Column(name = "StatusDescription", nullable = false, length = 45)
    public String getStatusDescription() {
        return statusDescription;
    }

    public void setStatusDescription(String statusDescription) {
        this.statusDescription = statusDescription;
    }

    @Basic
    @Column(name = "CreatedDate", nullable = true)
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "CreatedUser", nullable = true, length = 20)
    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataStatusEntity other = (RefDataStatusEntity) o;
		return java.util.Objects.equals(statusId, other.statusId) && java.util.Objects.equals(statusDescription, other.statusDescription) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(statusId, statusDescription, createdDate, createdUser);
	}

    public static RefDataStatusEntity findByStatusDescription(String desc) {
        return find("StatusDescription", desc).firstResult();
    }
}
