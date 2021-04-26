using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataAddressformattype
    {
        public RefdataAddressformattype()
        {
            DatageneratedAddresses = new HashSet<DatageneratedAddresses>();
        }

        public short AddressFormatTypeId { get; set; }
        public string AddressFormatTypeDesc { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<DatageneratedAddresses> DatageneratedAddresses { get; set; }
    }
}
