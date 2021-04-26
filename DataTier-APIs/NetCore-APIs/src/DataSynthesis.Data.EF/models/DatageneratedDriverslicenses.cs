using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class DatageneratedDriverslicenses
    {
        public long DriversLicensesId { get; set; }
        public string Dln { get; set; }
        public string StateCode { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CompleteDriversLicenseNumber { get; set; }
        public string CreatedUser { get; set; }
        public string RegisteredApp { get; set; }

        public virtual RefdataApplication RegisteredAppNavigation { get; set; }
        public virtual RefdataUsstates StateCodeNavigation { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
