/**
 *  Copyright 2005-2018 Red Hat, Inc.
 *
 *  Red Hat licenses this file to you under the Apache License, version
 *  2.0 (the "License"); you may not use this file except in compliance
 *  with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 *  implied.  See the License for the specific language governing
 *  permissions and limitations under the License.
 */
package io.connectedhealth.idaas.datasynthesis.audit;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public class AuditMessage {
    private String processingtype;
    private String industrystd;
    private String component;
    private String messagetrigger;
    private String processname;
    private String auditdetails;
    private String camelID;
    private String exchangeID;
    private String internalMsgID;
    private String bodyData;

    public String getProcessingtype() {
        return processingtype;
    }

    public void setProcessingtype(String processingtype) {
        this.processingtype = processingtype;
    }

    public String getIndustrystd() {
        return industrystd;
    }

    public void setIndustrystd(String industrystd) {
        this.industrystd = industrystd;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getMessagetrigger() {
        return messagetrigger;
    }

    public void setMessagetrigger(String messagetrigger) {
        this.messagetrigger = messagetrigger;
    }

    public String getProcessname() {
        return processname;
    }

    public void setProcessname(String processname) {
        this.processname = processname;
    }

    public String getAuditdetails() {
        return auditdetails;
    }

    public void setAuditdetails(String auditdetails) {
        this.auditdetails = auditdetails;
    }

    public String getCamelID() {
        return camelID;
    }

    public void setCamelID(String camelID) {
        this.camelID = camelID;
    }

    public String getExchangeID() {
        return exchangeID;
    }

    public void setExchangeID(String exchangeID) {
        this.exchangeID = exchangeID;
    }

    public String getInternalMsgID() {
        return internalMsgID;
    }

    public void setInternalMsgID(String internalMsgID) {
        this.internalMsgID = internalMsgID;
    }

    public String getBodyData() {
        return bodyData;
    }

    public void setBodyData(String bodyData) {
        this.bodyData = bodyData;
    }

    public String toString()
    {
        return ReflectionToStringBuilder.toString(this);
    }
}
