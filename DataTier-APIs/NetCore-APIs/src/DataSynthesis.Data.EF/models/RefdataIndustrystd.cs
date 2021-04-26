using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataIndustrystd
    {
        public RefdataIndustrystd()
        {
            RefdataCodeset = new HashSet<RefdataCodeset>();
            RefdataCodesetstructures = new HashSet<RefdataCodesetstructures>();
            TermsCodesetstoapplication = new HashSet<TermsCodesetstoapplication>();
        }

        public string IndustryStd { get; set; }
        public string IndustryStdDesc { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<RefdataCodeset> RefdataCodeset { get; set; }
        public virtual ICollection<RefdataCodesetstructures> RefdataCodesetstructures { get; set; }
        public virtual ICollection<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
    }
}
