package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "refdata_usstates")
public class RefDataUsStatesEntity {
    @Id
    @GeneratedValue
    @Column(name = "stateid", nullable = false, length = 2)
    private String stateId;
    @Basic
    @Column(name = "statedescription", nullable = true, length = 65)
    private String stateDescription;
    @Basic
    @Column(name = "lattitude", nullable = true, length = 12)
    private String lattitude;
    @Basic
    @Column(name = "longitude", nullable = true, length = 12)
    private String longitude;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		RefDataUsStatesEntity other = (RefDataUsStatesEntity) o;
		return java.util.Objects.equals(stateId, other.stateId) && java.util.Objects.equals(stateDescription, other.stateDescription) && java.util.Objects.equals(lattitude, other.lattitude) && 
			java.util.Objects.equals(longitude, other.longitude) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(createdUser, other.createdUser) && java.util.Objects.equals(status, other.status);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(stateId, stateDescription, lattitude, longitude, createdDate,
					createdUser, status);
	}





}
