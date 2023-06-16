package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_accountnumbers")
public class DataGeneratedAccountNumbersEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "accountnumbersid", nullable = false)
    private long accountNumbersId;
    @Basic
    @Column(name = "accountnumbervalue", nullable = true, length = 20)
    private String accountNumberValue;
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
		DataGeneratedAccountNumbersEntity other = (DataGeneratedAccountNumbersEntity) o;
		return java.util.Objects.equals(accountNumbersId, other.accountNumbersId) && java.util.Objects.equals(accountNumberValue, other.accountNumberValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp) && java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(accountNumbersId, accountNumberValue, createdDate, createdUser, status,
					registeredApp, dataGenType);
	}


}
