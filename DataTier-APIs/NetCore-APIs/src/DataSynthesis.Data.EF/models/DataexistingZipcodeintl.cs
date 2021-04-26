using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class DataexistingZipcodeintl
    {
        public int ZipCodeIntnlId { get; set; }
        public string ZipCode { get; set; }
        public string ZipCodeType { get; set; }
        public string City { get; set; }
        public short? Country { get; set; }
        public string Lattitude { get; set; }
        public string Longitude { get; set; }
        public string Location { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string RegisteredApp { get; set; }

        public virtual RefdataCountries CountryNavigation { get; set; }
        public virtual RefdataApplication RegisteredAppNavigation { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
