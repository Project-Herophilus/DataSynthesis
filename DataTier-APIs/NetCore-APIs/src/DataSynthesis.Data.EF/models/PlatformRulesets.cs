using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class PlatformRulesets
    {
        public PlatformRulesets()
        {
            PlatformRulesetsdefinitions = new HashSet<PlatformRulesetsdefinitions>();
        }

        public long RuleId { get; set; }
        public string RuleName { get; set; }
        public string CreatedUser { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public DateTime? ExpirationDate { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<PlatformRulesetsdefinitions> PlatformRulesetsdefinitions { get; set; }
    }
}
