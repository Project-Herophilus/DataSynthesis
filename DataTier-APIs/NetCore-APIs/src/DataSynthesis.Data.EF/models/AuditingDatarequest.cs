using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class AuditingDatarequest
    {
        public long DataRequestId { get; set; }
        public DateTime? DataRequestDate { get; set; }
        public string CreatedByUser { get; set; }
        public string Organizaton { get; set; }
        public string Application { get; set; }
        public short? StatusId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? RecCount { get; set; }
        public string RecordDataRequest { get; set; }

        public virtual RefdataStatus Status { get; set; }
    }
}
