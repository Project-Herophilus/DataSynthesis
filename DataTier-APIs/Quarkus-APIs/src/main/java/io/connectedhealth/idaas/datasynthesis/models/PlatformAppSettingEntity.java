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
@Table(name = "platform_appsetting")
public class PlatformAppSettingEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private short appSettingsId;
    private String appSettingName;
    private String appSettingValue;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataApplicationEntity defaultDataGenerationApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "AppSettingsID", nullable = false)
    public short getAppSettingsId() {
        return appSettingsId;
    }

    public void setAppSettingsId(short appSettingsId) {
        this.appSettingsId = appSettingsId;
    }

    @Basic
    @Column(name = "AppSettingName", nullable = true, length = 50)
    public String getAppSettingName() {
        return appSettingName;
    }

    public void setAppSettingName(String appSettingName) {
        this.appSettingName = appSettingName;
    }

    @Basic
    @Column(name = "AppSettingValue", nullable = true, length = 199)
    public String getAppSettingValue() {
        return appSettingValue;
    }

    public void setAppSettingValue(String appSettingValue) {
        this.appSettingValue = appSettingValue;
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
		PlatformAppSettingEntity other = (PlatformAppSettingEntity) o;
		return java.util.Objects.equals(appSettingsId, other.appSettingsId) && java.util.Objects.equals(appSettingName, other.appSettingName) && java.util.Objects.equals(appSettingValue, other.appSettingValue) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(defaultDataGenerationApp, other.defaultDataGenerationApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(appSettingsId, appSettingName, appSettingValue, createdDate, status,
					registeredApp, defaultDataGenerationApp);
	}

    @ManyToOne
    @JoinColumn(name = "DefaultDataGenerationApp", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getDefaultDataGenerationApp() {
        return defaultDataGenerationApp;
    }

    public void setDefaultDataGenerationApp(RefDataApplicationEntity defaultDataGenerationApp) {
        this.defaultDataGenerationApp = defaultDataGenerationApp;
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

    public static List<PlatformAppSettingEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
