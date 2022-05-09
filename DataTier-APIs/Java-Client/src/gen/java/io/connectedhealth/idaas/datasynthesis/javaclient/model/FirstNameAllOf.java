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
 * FirstNameAllOf
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2022-05-08T19:06:19.024256500-05:00[America/Chicago]")
public class FirstNameAllOf {
  public static final String SERIALIZED_NAME_FIRSTNAMEID = "firstnameid";
  @SerializedName(SERIALIZED_NAME_FIRSTNAMEID)
  private Integer firstnameid;

  public static final String SERIALIZED_NAME_FIRSTNAME = "firstname";
  @SerializedName(SERIALIZED_NAME_FIRSTNAME)
  private String firstname;

  public static final String SERIALIZED_NAME_GENDER = "gender";
  @SerializedName(SERIALIZED_NAME_GENDER)
  private String gender;

  public FirstNameAllOf() { 
  }

  public FirstNameAllOf firstnameid(Integer firstnameid) {
    
    this.firstnameid = firstnameid;
    return this;
  }

   /**
   * placeholder
   * @return firstnameid
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public Integer getFirstnameid() {
    return firstnameid;
  }


  public void setFirstnameid(Integer firstnameid) {
    this.firstnameid = firstnameid;
  }


  public FirstNameAllOf firstname(String firstname) {
    
    this.firstname = firstname;
    return this;
  }

   /**
   * placeholder
   * @return firstname
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public String getFirstname() {
    return firstname;
  }


  public void setFirstname(String firstname) {
    this.firstname = firstname;
  }


  public FirstNameAllOf gender(String gender) {
    
    this.gender = gender;
    return this;
  }

   /**
   * placeholder
   * @return gender
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "placeholder")

  public String getGender() {
    return gender;
  }


  public void setGender(String gender) {
    this.gender = gender;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    FirstNameAllOf firstNameAllOf = (FirstNameAllOf) o;
    return Objects.equals(this.firstnameid, firstNameAllOf.firstnameid) &&
        Objects.equals(this.firstname, firstNameAllOf.firstname) &&
        Objects.equals(this.gender, firstNameAllOf.gender);
  }

  @Override
  public int hashCode() {
    return Objects.hash(firstnameid, firstname, gender);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class FirstNameAllOf {\n");
    sb.append("    firstnameid: ").append(toIndentedString(firstnameid)).append("\n");
    sb.append("    firstname: ").append(toIndentedString(firstname)).append("\n");
    sb.append("    gender: ").append(toIndentedString(gender)).append("\n");
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

