package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "dataexisting_ababanking")
public class DataExistingAbaBankingEntity  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ababankingid", nullable = false)
    private long abaBankingId;
    @Basic
    @Column(name = "routingnumber", nullable = true, length = 9)
    private String routingNumber;
    @Basic
    @Column(name = "telegraphicname", nullable = true, length = 20)
    private String telegraphicName;
    @Basic
    @Column(name = "customername", nullable = true, length = 36)
    private String customerName;
    @Basic
    @Column(name = "city", nullable = true, length = 20)
    private String city;
    @Basic
    @Column(name = "statecode", nullable = true, length = 2)
    private String stateCode;
    @Basic
    @Column(name = "zipcode", nullable = true, length = 5)
    private String zipCode;
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

}
