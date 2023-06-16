package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "dataexisting_namefirst")
public class DataExistingNameFirstEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "firstnameid", nullable = false)
    private long firstNameId;
    @Basic
    @Column(name = "firstname", nullable = true, length = 39)
    private String firstName;
    @Basic
    @Column(name = "gender", nullable = true, length = 1)
    private String gender;
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
		DataExistingNameFirstEntity other = (DataExistingNameFirstEntity) o;
		return java.util.Objects.equals(firstNameId, other.firstNameId) && java.util.Objects.equals(firstName, other.firstName) && java.util.Objects.equals(gender, other.gender) && 
			java.util.Objects.equals(createdDate, other.createdDate) && java.util.Objects.equals(createdUser, other.createdUser) && 
			java.util.Objects.equals(status, other.status) && java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(firstNameId, firstName, gender, createdDate, createdUser,
					status, registeredApp);
	}


}
