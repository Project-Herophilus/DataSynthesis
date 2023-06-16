package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_bankaccount")
public class DataGeneratedBankAccountEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bankaccountsid", nullable = false)
    private long bankAccountsId;
    @Basic
    @Column(name = "bankaccountvalue", nullable = true, length = 17)
    private String bankAccountValue;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "registeredapp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;
    @ManyToOne
    @JoinColumn(name = "datagentypeid", referencedColumnName = "DataGenTypeID")
    private RefDataDataGenTypesEntity dataGenType;

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


}
