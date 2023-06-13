package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "platform_appsettings_dataattributes")
public class PlatformAppSettingsDataAttributesEntity {
    private short appSettingsDataAttributesId;
    private Short platformDataAttributeId;
    private String serviceClassName;
    private String codeBaseLang;
    private Long maxTableTransactionCount;
	private Long currentTableTransactionCount;
	private Timestamp currentTableTransactionCounRunDateTime;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AppSettingsDataAttributeID", nullable = false)
    public short getAppSettingsDataAttributesId() {
        return appSettingsDataAttributesId;
    }

    public void setAppSettingsDataAttributesId(short appSettingsDataAttributesId) {
        this.appSettingsDataAttributesId = appSettingsDataAttributesId;
    }

    @Column(name = "PlatformDataAttributeID", nullable = true)
    public Short getPlatformDataAttributeID() {
        return platformDataAttributeId;
    }

    public void setPlatformDataAttributeID(Short platformDataAttributeId) {
        this.platformDataAttributeId = platformDataAttributeId;
    }

    @Basic
    @Column(name = "ServiceClassName", nullable = true, length = 75)
    public String getServiceClassName() {
        return serviceClassName;
    }

    public void setServiceClassName(String serviceClassName) {
        this.serviceClassName = serviceClassName;
    }

    @Basic
    @Column(name = "CodeBaseLang", nullable = true, length = 20)
    public String getCodeBaseLang() {
        return codeBaseLang;
    }

    public void setCodeBaseLang(String codeBaseLang) {
        this.codeBaseLang = codeBaseLang;
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
    @Column(name = "MaxTableTransactionCount", nullable = true)
    public Long getMaxTableTransactionCount() {
        return maxTableTransactionCount;
    }

    public void setMaxTableTransactionCount(Long maxTableTransactionCount) {
        this.maxTableTransactionCount = maxTableTransactionCount;
    }

    @Basic
    @Column(name = "CurrentTableTransactionCount", nullable = true)
    public Long getCurrentTableTransactionCount() {
        return currentTableTransactionCount;
    }

    public void setCurrentTableTransactionCount(Long currentTableTransactionCount) {
        this.currentTableTransactionCount = currentTableTransactionCount;
    }

    @Basic
    @Column(name = "CurrentTableTransactionCounRunDateTime", nullable = true)
    public Timestamp getCurrentTableTransactionCounRunDateTime() {
        return currentTableTransactionCounRunDateTime;
    }

    public void setCurrentTableTransactionCounRunDateTime(Timestamp currentTableTransactionCounRunDateTime) {
        this.currentTableTransactionCounRunDateTime = currentTableTransactionCounRunDateTime;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
        PlatformAppSettingsDataAttributesEntity other = (PlatformAppSettingsDataAttributesEntity) o;
		return java.util.Objects.equals(appSettingsDataAttributesId, other.appSettingsDataAttributesId) && java.util.Objects.equals(serviceClassName, other.serviceClassName) && java.util.Objects.equals(codeBaseLang, other.codeBaseLang) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) && 
            java.util.Objects.equals(platformDataAttributeId, other.platformDataAttributeId) && java.util.Objects.equals(maxTableTransactionCount, other.maxTableTransactionCount) &&
            java.util.Objects.equals(currentTableTransactionCount, other.currentTableTransactionCount) && java.util.Objects.equals(currentTableTransactionCounRunDateTime, other.currentTableTransactionCounRunDateTime);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(appSettingsDataAttributesId, serviceClassName, codeBaseLang, createdDate, status,
					registeredApp, platformDataAttributeId, maxTableTransactionCount, currentTableTransactionCount, currentTableTransactionCounRunDateTime);
	}

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    /*
    @ManyToOne
    @JoinColumn(name = "RegisteredApp", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getRegisteredApp() {
        return registeredApp;
    }

    public void setRegisteredApp(RefDataApplicationEntity registeredApp) {
        this.registeredApp = registeredApp;
    }

    public static List<PlatformAppSettingsDataAttributesEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }

    public static PlatformAppSettingsDataAttributesEntity findByPlatformDataAttribute(Short attributeId) {
        return find("platformDataAttributeId", attributeId).firstResult();
    }
     */
}
