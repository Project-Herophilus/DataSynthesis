/*
 * Query API
 * A list of get API calls that allows for pulling data
 *
 * The version of the OpenAPI document: 1.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


package io.connectedhealth.idaas.datasynthesis.javaclient.model;

import java.util.Objects;
import java.util.Arrays;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.connectedhealth.idaas.datasynthesis.javaclient.model.BaseAuditRecordWithUser;
import io.connectedhealth.idaas.datasynthesis.javaclient.model.CompanyAllOf;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;
import java.time.OffsetDateTime;

/**
 * Company
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2022-05-08T19:06:19.024256500-05:00[America/Chicago]")
public class Company {
  public static final String SERIALIZED_NAME_COMPANIESID = "companiesid";
  @SerializedName(SERIALIZED_NAME_COMPANIESID)
  private Integer companiesid;

  public static final String SERIALIZED_NAME_COMPANIESNAME = "companiesname";
  @SerializedName(SERIALIZED_NAME_COMPANIESNAME)
  private String companiesname;

  public static final String SERIALIZED_NAME_CREATEDUSER = "createduser";
  @SerializedName(SERIALIZED_NAME_CREATEDUSER)
  private String createduser;

  public static final String SERIALIZED_NAME_CREATEDDATE = "createddate";
  @SerializedName(SERIALIZED_NAME_CREATEDDATE)
  private OffsetDateTime createddate;

  public static final String SERIALIZED_NAME_STATUSID = "statusid";
  @SerializedName(SERIALIZED_NAME_STATUSID)
  private Integer statusid;

  public static final String SERIALIZED_NAME_REGISTEREDAPP = "registeredapp";
  @SerializedName(SERIALIZED_NAME_REGISTEREDAPP)
  private String registeredapp;

  public Company() { 
  }

  public Company companiesid(Integer companiesid) {
    
    this.companiesid = companiesid;
    return this;
  }

   /**
   * placeholder
   * @return companiesid
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public Integer getCompaniesid() {
    return companiesid;
  }


  public void setCompaniesid(Integer companiesid) {
    this.companiesid = companiesid;
  }


  public Company companiesname(String companiesname) {
    
    this.companiesname = companiesname;
    return this;
  }

   /**
   * placeholder
   * @return companiesname
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public String getCompaniesname() {
    return companiesname;
  }


  public void setCompaniesname(String companiesname) {
    this.companiesname = companiesname;
  }


  public Company createduser(String createduser) {
    
    this.createduser = createduser;
    return this;
  }

   /**
   * Get createduser
   * @return createduser
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public String getCreateduser() {
    return createduser;
  }


  public void setCreateduser(String createduser) {
    this.createduser = createduser;
  }


  public Company createddate(OffsetDateTime createddate) {
    
    this.createddate = createddate;
    return this;
  }

   /**
   * Get createddate
   * @return createddate
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public OffsetDateTime getCreateddate() {
    return createddate;
  }


  public void setCreateddate(OffsetDateTime createddate) {
    this.createddate = createddate;
  }


  public Company statusid(Integer statusid) {
    
    this.statusid = statusid;
    return this;
  }

   /**
   * Get statusid
   * @return statusid
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public Integer getStatusid() {
    return statusid;
  }


  public void setStatusid(Integer statusid) {
    this.statusid = statusid;
  }


  public Company registeredapp(String registeredapp) {
    
    this.registeredapp = registeredapp;
    return this;
  }

   /**
   * Get registeredapp
   * @return registeredapp
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "")

  public String getRegisteredapp() {
    return registeredapp;
  }


  public void setRegisteredapp(String registeredapp) {
    this.registeredapp = registeredapp;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    Company company = (Company) o;
    return Objects.equals(this.companiesid, company.companiesid) &&
        Objects.equals(this.companiesname, company.companiesname) &&
        Objects.equals(this.createduser, company.createduser) &&
        Objects.equals(this.createddate, company.createddate) &&
        Objects.equals(this.statusid, company.statusid) &&
        Objects.equals(this.registeredapp, company.registeredapp);
  }

  @Override
  public int hashCode() {
    return Objects.hash(companiesid, companiesname, createduser, createddate, statusid, registeredapp);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class Company {\n");
    sb.append("    companiesid: ").append(toIndentedString(companiesid)).append("\n");
    sb.append("    companiesname: ").append(toIndentedString(companiesname)).append("\n");
    sb.append("    createduser: ").append(toIndentedString(createduser)).append("\n");
    sb.append("    createddate: ").append(toIndentedString(createddate)).append("\n");
    sb.append("    statusid: ").append(toIndentedString(statusid)).append("\n");
    sb.append("    registeredapp: ").append(toIndentedString(registeredapp)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}

