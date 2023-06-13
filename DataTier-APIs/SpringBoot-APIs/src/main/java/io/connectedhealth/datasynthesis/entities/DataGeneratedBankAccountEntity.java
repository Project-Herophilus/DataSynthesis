package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name = "datagenerated_bankaccount")
public class DataGeneratedBankAccountEntity {
    private long bankAccountsId;
    private String bankAccountValue;
    private Timestamp createdDate;
    private String createdUser;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;
    private RefDataDataGenTypesEntity dataGenType;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "BankAccountsID", nullable = false)
    public long getBankAccountsId() {
        return bankAccountsId;
    }

    public void setBankAccountsId(long bankAccountsId) {
        this.bankAccountsId = bankAccountsId;
    }

    @Basic
    @Column(name = "BankAccountValue", nullable = true, length = 17)
    public String getBankAccountValue() {
        return bankAccountValue;
    }

    public void setBankAccountValue(String bankAccountValue) {
        this.bankAccountValue = bankAccountValue;
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
		DataGeneratedBankAccountEntity other = (DataGeneratedBankAccountEntity) o;
		return java.util.Objects.equals(bankAccountsId, other.bankAccountsId) && java.util.Objects.equals(bankAccountValue, other.bankAccountValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(bankAccountsId, bankAccountValue, createdDate, createdUser, status,
					registeredApp, dataGenType);
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
    @JoinColumn(name = "DataGenTypeID", referencedColumnName = "DataGenTypeID")
    public RefDataDataGenTypesEntity getDataGenType() {
        return dataGenType;
    }

    // Added
    public void setDataGenType(RefDataDataGenTypesEntity dataGenType) {
        this.dataGenType = dataGenType;
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



    public void setDataGenType(RefDataDataGenTypesEntity dataGenType) {
        this.dataGenType = dataGenType;
    }

    public static List<DataGeneratedBankAccountEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
     */
}
