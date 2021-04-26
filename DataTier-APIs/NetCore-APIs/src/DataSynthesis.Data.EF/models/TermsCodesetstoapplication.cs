using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class TermsCodesetstoapplication
    {
        public TermsCodesetstoapplication()
        {
            TermsCodesetstoapplicationvalues = new HashSet<TermsCodesetstoapplicationvalues>();
        }

        public long CodeSetToApplicationId { get; set; }
        public long CodeSetsId { get; set; }
        public string Domain { get; set; }
        public string IndustryStd { get; set; }
        public string SpecificDetails { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string OrganizationId { get; set; }
        public string ApplicationId { get; set; }
        public int? VendorId { get; set; }
        public string CodeValue { get; set; }
        public string CodeDesc { get; set; }
        public short? SensitiveFlagId { get; set; }

        public virtual RefdataApplication Application { get; set; }
        public virtual RefdataCodeset CodeSets { get; set; }
        public virtual RefdataIndustrystd IndustryStdNavigation { get; set; }
        public virtual RefdataOrganization Organization { get; set; }
        public virtual RefdataSensitivityflag SensitiveFlag { get; set; }
        public virtual RefdataStatus Status { get; set; }
        public virtual RefdataVendor Vendor { get; set; }
        public virtual ICollection<TermsCodesetstoapplicationvalues> TermsCodesetstoapplicationvalues { get; set; }
    }
}
