package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Data
@NoArgsConstructor
@Table(name = "datagenerated_dateofbirth")
public class DataGeneratedDateOfBirthEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dateofbirthsid", nullable = false)
    private long dateofBirthsId;
    @Basic
    @Column(name = "dateofbirth", nullable = true, length = 12)
    private String dateOfBirth;
    @Basic
    @Column(name = "dateofbirthdate", nullable = true)
    private Date dateOfBirthDate;
    @Basic
    @Column(name = "age", nullable = true)
    private Integer age;
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
		DataGeneratedDateOfBirthEntity other = (DataGeneratedDateOfBirthEntity) o;
		return java.util.Objects.equals(dateofBirthsId, other.dateofBirthsId) && java.util.Objects.equals(dateOfBirth, other.dateOfBirth) && java.util.Objects.equals(dateOfBirthDate, other.dateOfBirthDate) && 
			java.util.Objects.equals(age, other.age) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(registeredApp, other.registeredApp);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(dateofBirthsId, dateOfBirth, dateOfBirthDate, age, createdDate,
					createdUser, status, registeredApp);
	}

}
