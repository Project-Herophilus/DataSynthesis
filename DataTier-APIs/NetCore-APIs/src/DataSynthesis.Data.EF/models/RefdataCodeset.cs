using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataCodeset
    {
        public RefdataCodeset()
        {
            RefdataCodesetstructures = new HashSet<RefdataCodesetstructures>();
            TermsCodesetstoapplication = new HashSet<TermsCodesetstoapplication>();
            TermsCodesetstoapplicationvalues = new HashSet<TermsCodesetstoapplicationvalues>();
        }

        public long CodeSetsId { get; set; }
        public string CodeSetName { get; set; }
        public string IndustryStd { get; set; }
        public short? StatusId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedUser { get; set; }
        public string CodesetGuid { get; set; }
        public string FieldMapping { get; set; }
        public short? SensitivityFlagId { get; set; }

        public virtual RefdataIndustrystd IndustryStdNavigation { get; set; }
        public virtual RefdataSensitivityflag SensitivityFlag { get; set; }
        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<RefdataCodesetstructures> RefdataCodesetstructures { get; set; }
        public virtual ICollection<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
        public virtual ICollection<TermsCodesetstoapplicationvalues> TermsCodesetstoapplicationvalues { get; set; }
    }
}
