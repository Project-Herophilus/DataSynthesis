using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataCountries
    {
        public RefdataCountries()
        {
            DataexistingAreacodeintl = new HashSet<DataexistingAreacodeintl>();
            DataexistingZipcodeintl = new HashSet<DataexistingZipcodeintl>();
            DatageneratedPhonenumbersintl = new HashSet<DatageneratedPhonenumbersintl>();
        }

        public short CountryId { get; set; }
        public string Idd { get; set; }
        public string CountryName { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<DataexistingAreacodeintl> DataexistingAreacodeintl { get; set; }
        public virtual ICollection<DataexistingZipcodeintl> DataexistingZipcodeintl { get; set; }
        public virtual ICollection<DatageneratedPhonenumbersintl> DatageneratedPhonenumbersintl { get; set; }
    }
}
