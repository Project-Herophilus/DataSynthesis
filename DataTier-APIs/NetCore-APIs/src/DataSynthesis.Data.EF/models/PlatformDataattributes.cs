using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class PlatformDataattributes
    {
        public PlatformDataattributes()
        {
            PlatformConfigDatagen = new HashSet<PlatformConfigDatagen>();
            PlatformDatastructurestodataattributes = new HashSet<PlatformDatastructurestodataattributes>();
            PlatformRulesetsdefinitions = new HashSet<PlatformRulesetsdefinitions>();
            RefdataPlatformparamstodataattributes = new HashSet<RefdataPlatformparamstodataattributes>();
        }

        public short PlatformDataAttributesId { get; set; }
        public string DataAttributeName { get; set; }
        public short? SensitivityFlagId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string PlatformDataAttributeGuid { get; set; }
        public string RegisteredApp { get; set; }

        public virtual RefdataApplication RegisteredAppNavigation { get; set; }
        public virtual RefdataSensitivityflag SensitivityFlag { get; set; }
        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<PlatformConfigDatagen> PlatformConfigDatagen { get; set; }
        public virtual ICollection<PlatformDatastructurestodataattributes> PlatformDatastructurestodataattributes { get; set; }
        public virtual ICollection<PlatformRulesetsdefinitions> PlatformRulesetsdefinitions { get; set; }
        public virtual ICollection<RefdataPlatformparamstodataattributes> RefdataPlatformparamstodataattributes { get; set; }
    }
}
