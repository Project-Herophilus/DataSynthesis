package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_socialsecuritynumber")
public class DataGeneratedSocialSecurityNumberEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "socialsecuritynumberid", nullable = false)
    private long socialSecurityNumberId;
    @Basic
    @Column(name = "socialsecuritynumbervalue", nullable = true, length = 11)
    private String socialSecurityNumberValue;
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




    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		DataGeneratedSocialSecurityNumberEntity other = (DataGeneratedSocialSecurityNumberEntity) o;
		return java.util.Objects.equals(socialSecurityNumberId, other.socialSecurityNumberId) && java.util.Objects.equals(socialSecurityNumberValue, other.socialSecurityNumberValue) && java.util.Objects.equals(createdDate, other.createdDate) &&
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(socialSecurityNumberId, socialSecurityNumberValue, createdDate, createdUser, status,
					registeredApp);
	}

}
