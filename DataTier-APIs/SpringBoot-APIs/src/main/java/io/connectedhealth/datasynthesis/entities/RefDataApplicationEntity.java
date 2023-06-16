package io.connectedhealth.datasynthesis.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

@Entity
@NoArgsConstructor
@Data
@Table(name = "impl_application")
public class RefDataApplicationEntity {
    @Id
    @Column(name = "appguid", nullable = false, length = 38)
    private String appGuid;
    @Basic
    @Column(name = "applicationcustomcode", nullable = true, length = 15)
    private String applicationCustomCode;
    @Basic
    @Column(name = "applicationdesc", nullable = true, length = 50)
    private String applicationDesc;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    /*
    @ManyToOne
    @JoinColumn(name = "vendorid", referencedColumnName = "VendorID")
    private RefDataVendorEntity vendor;
    */

}



