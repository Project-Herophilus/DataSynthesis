using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataPlatformparams
    {
        public RefdataPlatformparams()
        {
            RefdataPlatformparamstodataattributes = new HashSet<RefdataPlatformparamstodataattributes>();
        }

        public short PlatformParamsId { get; set; }
        public string PlatformParamValues { get; set; }
        public string PlatformParamDesc { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<RefdataPlatformparamstodataattributes> RefdataPlatformparamstodataattributes { get; set; }
    }
}
