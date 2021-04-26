using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class PlatformRulesetsdefinitions
    {
        public string RulesetDefinitionsId { get; set; }
        public string RulesetDefinitionName { get; set; }
        public long? RuleSetId { get; set; }
        public short? StepOrderId { get; set; }
        public string OperationTypeId { get; set; }
        public string RulesetDefValue { get; set; }
        public short? StatusId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? EffectiveDate { get; set; }
        public string ApplicationId { get; set; }
        public DateTime? TermDate { get; set; }
        public short? DataAttributeId { get; set; }

        public virtual RefdataApplication Application { get; set; }
        public virtual PlatformDataattributes DataAttribute { get; set; }
        public virtual RefdataOperationtype OperationType { get; set; }
        public virtual PlatformRulesets RuleSet { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
