package io.connectedhealth.idaas.datasynthesis.models;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "dataexisting_upccodes")
public class DataExistingUpcCodesEntity extends BaseEntity {
    private long upcCodeId;
    private String upcCodeName;
    private String upcProductName;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "UPCCodeID", nullable = false)
    public long getUpcCodeId() {
        return upcCodeId;
    }

    public void setUpcCodeId(long upcCodeId) {
        this.upcCodeId = upcCodeId;
    }

    @Basic
    @Column(name = "UPCCodeName", nullable = true, length = 15)
    public String getUpcCodeName() {
        return upcCodeName;
    }

    public void setUpcCodeName(String upcCodeName) {
        this.upcCodeName = upcCodeName;
    }

    @Basic
    @Column(name = "UPCProductName", nullable = true, length = 150)
    public String getUpcProductName() {
        return upcProductName;
    }

    public void setUpcProductName(String upcProductName) {
        this.upcProductName = upcProductName;
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
		DataExistingUpcCodesEntity other = (DataExistingUpcCodesEntity) o;
		return java.util.Objects.equals(upcCodeId, other.upcCodeId) && java.util.Objects.equals(upcCodeName, other.upcCodeName) && java.util.Objects.equals(upcProductName, other.upcProductName) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(upcCodeId, upcCodeName, upcProductName, createdDate, status,
					registeredApp);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    @ManyToOne
    @JoinColumn(name = "RegisteredApp", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getRegisteredApp() {
        return registeredApp;
    }

    public void setRegisteredApp(RefDataApplicationEntity registeredApp) {
        this.registeredApp = registeredApp;
    }

    public static List<DataExistingUpcCodesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
