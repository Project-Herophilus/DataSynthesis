using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class DatageneratedAddresses
    {
        public long AddressId { get; set; }
        public string AddressStreet { get; set; }
        public string AddressStreet2 { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public short? AddressFormatTypeId { get; set; }
        public string CreatedUser { get; set; }
        public string RegisteredApp { get; set; }

        public virtual RefdataAddressformattype AddressFormatType { get; set; }
        public virtual RefdataApplication RegisteredAppNavigation { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
