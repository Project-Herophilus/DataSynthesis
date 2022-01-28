package com.redhat.idaas.datasynthesis.models;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "platform_rulesetsdefinitions")
public class PlatformRuleSetsDefinitionsEntity extends io.quarkus.hibernate.orm.panache.PanacheEntityBase {
    private String rulesetDefinitionsId;
    private String rulesetDefinitionName;
    private PlatformRuleSetsEntity ruleSet;
    private Short stepOrderId;
    private RefDataOperationTypeEntity operationType;
    private String rulesetDefValue;
    private Timestamp createdDate;
    private Timestamp effectiveDate;
    private Timestamp termDate;
    private PlatformDataAttributesEntity dataAttribute;
    private RefDataStatusEntity status;
    private RefDataApplicationEntity application;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "RulesetDefinitionsID", nullable = false, length = 38)
    public String getRulesetDefinitionsId() {
        return rulesetDefinitionsId;
    }

    public void setRulesetDefinitionsId(String rulesetDefinitionsId) {
        this.rulesetDefinitionsId = rulesetDefinitionsId;
    }

    @Basic
    @Column(name = "RulesetDefinitionName", nullable = true, length = 50)
    public String getRulesetDefinitionName() {
        return rulesetDefinitionName;
    }

    public void setRulesetDefinitionName(String rulesetDefinitionName) {
        this.rulesetDefinitionName = rulesetDefinitionName;
    }

    @Basic
    @Column(name = "StepOrderID", nullable = true)
    public Short getStepOrderId() {
        return stepOrderId;
    }

    public void setStepOrderId(Short stepOrderId) {
        this.stepOrderId = stepOrderId;
    }

    @Basic
    @Column(name = "RulesetDefValue", nullable = true, length = 40)
    public String getRulesetDefValue() {
        return rulesetDefValue;
    }

    public void setRulesetDefValue(String rulesetDefValue) {
        this.rulesetDefValue = rulesetDefValue;
    }

    @Basic
    @Column(name = "CreatedDate", nullable = true)
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "EffectiveDate", nullable = true)
    public Timestamp getEffectiveDate() {
        return effectiveDate;
    }

    public void setEffectiveDate(Timestamp effectiveDate) {
        this.effectiveDate = effectiveDate;
    }

    @Basic
    @Column(name = "TermDate", nullable = true)
    public Timestamp getTermDate() {
        return termDate;
    }

    public void setTermDate(Timestamp termDate) {
        this.termDate = termDate;
    }

    @Override
    public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null)
			return false;
		if (getClass() != o.getClass())
			return false;
		PlatformRuleSetsDefinitionsEntity other = (PlatformRuleSetsDefinitionsEntity) o;
		return java.util.Objects.equals(rulesetDefinitionsId, other.rulesetDefinitionsId) && java.util.Objects.equals(rulesetDefinitionName, other.rulesetDefinitionName) && java.util.Objects.equals(ruleSet, other.ruleSet) && 
			java.util.Objects.equals(stepOrderId, other.stepOrderId) && java.util.Objects.equals(operationType, other.operationType) && 
			java.util.Objects.equals(rulesetDefValue, other.rulesetDefValue) && java.util.Objects.equals(createdDate, other.createdDate) && 
			java.util.Objects.equals(effectiveDate, other.effectiveDate) && java.util.Objects.equals(termDate, other.termDate) && 
			java.util.Objects.equals(dataAttribute, other.dataAttribute) && java.util.Objects.equals(status, other.status) && 
			java.util.Objects.equals(application, other.application);
	}

    @Override
    public int hashCode() {
		return java.util.Objects.hash(rulesetDefinitionsId, rulesetDefinitionName, ruleSet, stepOrderId, operationType,
					rulesetDefValue, createdDate, effectiveDate, termDate,
					dataAttribute, status, application);
	}

    @ManyToOne
    @JoinColumn(name = "OperationTypeID", referencedColumnName = "OperationTypeID")
    public RefDataOperationTypeEntity getOperationType() {
        return operationType;
    }

    public void setOperationType(RefDataOperationTypeEntity operationType) {
        this.operationType = operationType;
    }

    @ManyToOne
    @JoinColumn(name = "DataAttributeID", referencedColumnName = "PlatformDataAttributesID")
    public PlatformDataAttributesEntity getDataAttribute() {
        return dataAttribute;
    }

    public void setDataAttribute(PlatformDataAttributesEntity dataAttribute) {
        this.dataAttribute = dataAttribute;
    }

    @ManyToOne
    @JoinColumn(name = "RuleSetID", referencedColumnName = "RuleID")
    public PlatformRuleSetsEntity getRuleSet() {
        return ruleSet;
    }

    public void setRuleSet(PlatformRuleSetsEntity ruleSet) {
        this.ruleSet = ruleSet;
    }

    @ManyToOne
    @JoinColumn(name = "StatusID", referencedColumnName = "StatusID")
    public RefDataStatusEntity getStatus() {
        return status;
    }

    public void setStatus(RefDataStatusEntity status) {
        this.status = status;
    }

    @ManyToOne
    @JoinColumn(name = "ApplicationID", referencedColumnName = "AppGUID")
    public RefDataApplicationEntity getApplication() {
        return application;
    }

    public void setApplication(RefDataApplicationEntity application) {
        this.application = application;
    }

    public static List<PlatformRuleSetsDefinitionsEntity> findByStatusId(Short statusId) {
        return find("status", new RefDataStatusEntity(statusId)).list();
    }
}
