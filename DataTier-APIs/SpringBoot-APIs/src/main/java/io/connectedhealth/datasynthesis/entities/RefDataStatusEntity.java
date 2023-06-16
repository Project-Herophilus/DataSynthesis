package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@NoArgsConstructor
@Data
@Entity
@Table(name = "refdata_status")
public class RefDataStatusEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "statusid", nullable = false)
    private short statusId;
    @Basic
    @Column(name = "statusdescription", nullable = false, length = 45)
    private String statusDescription;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;

 /*   public RefDataStatusEntity(short statusId, String statusDescription, Timestamp createdDate, String createdUser) {
        this.statusId = statusId;
        this.statusDescription = statusDescription;
        this.createdDate = createdDate;
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
		RefDataStatusEntity other = (RefDataStatusEntity) o;
		return java.util.Objects.equals(statusId, other.statusId) && java.util.Objects.equals(statusDescription, other.statusDescription) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(statusId, statusDescription, createdDate, createdUser);
	}
*/
}
