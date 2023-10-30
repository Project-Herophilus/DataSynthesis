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
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;

/**
 * UpcCodeAllOf
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2022-05-08T19:06:19.024256500-05:00[America/Chicago]")
public class UpcCodeAllOf {
  public static final String SERIALIZED_NAME_UPCCODEID = "upccodeid";
  @SerializedName(SERIALIZED_NAME_UPCCODEID)
  private Integer upccodeid;

  public static final String SERIALIZED_NAME_UPCCODENAME = "upccodename";
  @SerializedName(SERIALIZED_NAME_UPCCODENAME)
  private String upccodename;

  public static final String SERIALIZED_NAME_UPCPRODUCTNAME = "upcproductname";
  @SerializedName(SERIALIZED_NAME_UPCPRODUCTNAME)
  private String upcproductname;

  public UpcCodeAllOf() { 
  }

  public UpcCodeAllOf upccodeid(Integer upccodeid) {
    
    this.upccodeid = upccodeid;
    return this;
  }

   /**
   * placeholder
   * @return upccodeid
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public Integer getUpccodeid() {
    return upccodeid;
  }


  public void setUpccodeid(Integer upccodeid) {
    this.upccodeid = upccodeid;
  }


  public UpcCodeAllOf upccodename(String upccodename) {
    
    this.upccodename = upccodename;
    return this;
  }

   /**
   * placeholder
   * @return upccodename
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public String getUpccodename() {
    return upccodename;
  }


  public void setUpccodename(String upccodename) {
    this.upccodename = upccodename;
  }


  public UpcCodeAllOf upcproductname(String upcproductname) {
    
    this.upcproductname = upcproductname;
    return this;
  }

   /**
   * placeholder
   * @return upcproductname
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public String getUpcproductname() {
    return upcproductname;
  }


  public void setUpcproductname(String upcproductname) {
    this.upcproductname = upcproductname;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    UpcCodeAllOf upcCodeAllOf = (UpcCodeAllOf) o;
    return Objects.equals(this.upccodeid, upcCodeAllOf.upccodeid) &&
        Objects.equals(this.upccodename, upcCodeAllOf.upccodename) &&
        Objects.equals(this.upcproductname, upcCodeAllOf.upcproductname);
  }

  @Override
  public int hashCode() {
    return Objects.hash(upccodeid, upccodename, upcproductname);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class UpcCodeAllOf {\n");
    sb.append("    upccodeid: ").append(toIndentedString(upccodeid)).append("\n");
    sb.append("    upccodename: ").append(toIndentedString(upccodename)).append("\n");
    sb.append("    upcproductname: ").append(toIndentedString(upcproductname)).append("\n");
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
