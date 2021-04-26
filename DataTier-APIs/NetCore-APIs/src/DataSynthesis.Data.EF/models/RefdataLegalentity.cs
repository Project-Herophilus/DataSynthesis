using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataLegalentity
    {
        public RefdataLegalentity()
        {
            RefdataOrganization = new HashSet<RefdataOrganization>();
        }

        public string LegalEntityGuid { get; set; }
        public string LocationName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string StateId { get; set; }
        public string ZipCode { get; set; }
        public string CreatedUser { get; set; }
        public short? StatusId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string LocationUrl { get; set; }
        public string LocationPhone { get; set; }

        public virtual RefdataUsstates State { get; set; }
        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<RefdataOrganization> RefdataOrganization { get; set; }
    }
}
