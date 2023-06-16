package io.connectedhealth.datasynthesis.entities;

/*
@Entity
@Data
@NoArgsConstructor
@Table(name = "platform_config_dataattributes")
  public class PlatformConfigDataAttributesEntity {
 @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "datagenconfigid", nullable = false)
    private short dataGenConfigId;
    @Basic
    @Column(name = "datatypegenconfigname", nullable = true, length = 25)
    private String dataTypeGenConfigName;
    *//*@ManyToOne
    @JoinColumn(name = "dataattributeid", referencedColumnName = "PlatformDataAttributesID")
    private PlatformDataAttributesEntity platformDataAttributes;*//*
    @Basic
    @Column(name = "dataattributeid", nullable = true)
    private Integer dataAttributeId;
    @Basic
    @Column(name = "runquantity", nullable = true)
    private Integer runQuantity;
    @ManyToOne
    @JoinColumn(name = "datagentypeid", referencedColumnName = "DataGenTypeID")
    private RefDataDataGenTypesEntity dataGenType;
    @Basic
    @Column(name = "createddate", nullable = true)
    private Timestamp createdDate;
    @ManyToOne
    @JoinColumn(name = "statusid", referencedColumnName = "StatusID")
    private RefDataStatusEntity status;
    @Basic
    @Column(name = "createduser", nullable = true, length = 20)
    private String createdUser;
   @ManyToOne
    @JoinColumn(name = "applicationid", referencedColumnName = "appguid")
    private RefDataApplicationEntity application;
    *//*@Basic
    @Column(name = "applicationid", nullable = true, length = 38)
    private String applicationId;*//*


}
        */