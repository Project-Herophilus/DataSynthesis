package io.connectedhealth.datasynthesis.dto;

import lombok.Data;

import java.sql.Timestamp;
@Data
public class RefDataStatusDTO {
    private short statusId;
    private String statusDescription;
    private Timestamp createdDate;
    private String createdUser;

}
