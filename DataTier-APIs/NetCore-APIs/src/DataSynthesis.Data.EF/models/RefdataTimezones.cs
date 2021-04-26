using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataTimezones
    {
        public RefdataTimezones()
        {
            DataexistingAreacode = new HashSet<DataexistingAreacode>();
        }

        public string TimeZoneValue { get; set; }
        public string TimeZoneDesc { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<DataexistingAreacode> DataexistingAreacode { get; set; }
    }
}
