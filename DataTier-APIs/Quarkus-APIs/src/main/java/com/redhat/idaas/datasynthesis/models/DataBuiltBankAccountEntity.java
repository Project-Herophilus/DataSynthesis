package com.redhat.idaas.datasynthesis.models;

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
@Table(name = "databuilt_bankaccount", schema = "datasynthesis", catalog = "")
public class DataBuiltBankAccountEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private long dataBuiltBankAccountsId;
    private String bankAccountNumber;
    private String bankAccountName;
    private String bankRoutingId;
    private Timestamp createdDate;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity registeredApp;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "DataBuiltBankAccountsID", nullable = false)
    public long getDataBuiltBankAccountsId() {
        return dataBuiltBankAccountsId;
    }

    public void setDataBuiltBankAccountsId(long dataBuiltBankAccountsId) {
        this.dataBuiltBankAccountsId = dataBuiltBankAccountsId;
    }

    @Basic
    @Column(name = "BankAccountNumber", nullable = true, length = 12)
    public String getBankAccountNumber() {
        return bankAccountNumber;
    }

    public void setBankAccountNumber(String bankAccountNumber) {
        this.bankAccountNumber = bankAccountNumber;
    }

    @Basic
    @Column(name = "BankAccountName", nullable = true, length = 75)
    public String getBankAccountName() {
        return bankAccountName;
    }

    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName;
    }

    @Basic
    @Column(name = "BankRoutingID", nullable = true, length = 9)
    public String getBankRoutingId() {
        return bankRoutingId;
    }

    public void setBankRoutingId(String bankRoutingId) {
        this.bankRoutingId = bankRoutingId;
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
		DataBuiltBankAccountEntity other = (DataBuiltBankAccountEntity) o;
		return java.util.Objects.equals(dataBuiltBankAccountsId, other.dataBuiltBankAccountsId) && java.util.Objects.equals(bankAccountNumber, other.bankAccountNumber) && java.util.Objects.equals(bankAccountName, other.bankAccountName) && 
			java.util.Objects.equals(bankRoutingId, other.bankRoutingId) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dataBuiltBankAccountsId, bankAccountNumber, bankAccountName, bankRoutingId, createdDate,
					status, registeredApp);
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

    public static List<DataBuiltBankAccountEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
