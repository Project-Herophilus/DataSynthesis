package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "dataexisting_upccodes")
public class DataExistingUpcCodesEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "upccodeid", nullable = false)
    private long upcCodeId;
    @Basic
    @Column(name = "upccodename", nullable = true, length = 15)
    private String upcCodeName;
    @Basic
    @Column(name = "upcproductname", nullable = true, length = 150)
    private String upcProductName;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @ManyToOne
    @JoinColumn(name = "registeredapp", referencedColumnName = "AppGUID")
    private RefDataApplicationEntity registeredApp;

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


}
