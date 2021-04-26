using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataVendor
    {
        public RefdataVendor()
        {
            RefdataApplication = new HashSet<RefdataApplication>();
            TermsCodesetstoapplication = new HashSet<TermsCodesetstoapplication>();
        }

        public int VendorId { get; set; }
        public string VendorName { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string VendorGuid { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<RefdataApplication> RefdataApplication { get; set; }
        public virtual ICollection<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
    }
}
