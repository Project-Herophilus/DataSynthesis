package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_creditcard")
public class DataGeneratedCreditCardEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "creditcardid", nullable = false)
    private long creditCardId;
    @Basic
    @Column(name = "creditcardnumber", nullable = true, length = 20)
    private String creditCardNumber;
    @Basic
    @Column(name = "creditcardname", nullable = true, length = 10)
    private String creditCardName;
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
		DataGeneratedCreditCardEntity other = (DataGeneratedCreditCardEntity) o;
		return java.util.Objects.equals(creditCardId, other.creditCardId) && java.util.Objects.equals(creditCardNumber, other.creditCardNumber) && java.util.Objects.equals(creditCardName, other.creditCardName) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp) &&
            java.util.Objects.equals(dataGenType, other.dataGenType);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(creditCardId, creditCardNumber, creditCardName, createdDate, createdUser,
					status, registeredApp, dataGenType);
	}
}
