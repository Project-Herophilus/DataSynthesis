using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataOrganization
    {
        public RefdataOrganization()
        {
            TermsCodesetstoapplication = new HashSet<TermsCodesetstoapplication>();
        }

        public string OrganizationGuid { get; set; }
        public string OrganizationInternalCode { get; set; }
        public string OrganizationInternalId { get; set; }
        public string OrganizationName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string StateId { get; set; }
        public string ZipCode { get; set; }
        public string CreatedUser { get; set; }
        public short? StatusId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LegalEntityGuid { get; set; }

        public virtual RefdataLegalentity LegalEntityGu { get; set; }
        public virtual RefdataUsstates State { get; set; }
        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
    }
}
