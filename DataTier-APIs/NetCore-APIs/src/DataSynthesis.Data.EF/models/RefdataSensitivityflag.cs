using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataSensitivityflag
    {
        public RefdataSensitivityflag()
        {
            PlatformDataattributes = new HashSet<PlatformDataattributes>();
            PlatformDatastructures = new HashSet<PlatformDatastructures>();
            PlatformDatastructurestodataattributes = new HashSet<PlatformDatastructurestodataattributes>();
            RefdataCodeset = new HashSet<RefdataCodeset>();
            RefdataCodesetstructures = new HashSet<RefdataCodesetstructures>();
            TermsCodesetstoapplication = new HashSet<TermsCodesetstoapplication>();
        }

        public short SensitiveFlagId { get; set; }
        public string SensitiveFlagDesc { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<PlatformDataattributes> PlatformDataattributes { get; set; }
        public virtual ICollection<PlatformDatastructures> PlatformDatastructures { get; set; }
        public virtual ICollection<PlatformDatastructurestodataattributes> PlatformDatastructurestodataattributes { get; set; }
        public virtual ICollection<RefdataCodeset> RefdataCodeset { get; set; }
        public virtual ICollection<RefdataCodesetstructures> RefdataCodesetstructures { get; set; }
        public virtual ICollection<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
    }
}
