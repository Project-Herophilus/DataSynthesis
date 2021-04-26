using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataUsstates
    {
        public RefdataUsstates()
        {
            DataexistingAreacode = new HashSet<DataexistingAreacode>();
            DatageneratedDriverslicenses = new HashSet<DatageneratedDriverslicenses>();
            RefdataLegalentity = new HashSet<RefdataLegalentity>();
            RefdataOrganization = new HashSet<RefdataOrganization>();
        }

        public string StateId { get; set; }
        public string StateDescription { get; set; }
        public string Lattitude { get; set; }
        public string Longitude { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<DataexistingAreacode> DataexistingAreacode { get; set; }
        public virtual ICollection<DatageneratedDriverslicenses> DatageneratedDriverslicenses { get; set; }
        public virtual ICollection<RefdataLegalentity> RefdataLegalentity { get; set; }
        public virtual ICollection<RefdataOrganization> RefdataOrganization { get; set; }
    }
}
