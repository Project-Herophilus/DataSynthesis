using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class PlatformDatastructures
    {
        public PlatformDatastructures()
        {
            PlatformDatastructurestodataattributes = new HashSet<PlatformDatastructurestodataattributes>();
        }

        public short PlatformDataStructuresId { get; set; }
        public string DataStructureName { get; set; }
        public short? SensitivityFlagId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string PlatformDataStructuresGuid { get; set; }
        public string RegisteredApp { get; set; }

        public virtual RefdataApplication RegisteredAppNavigation { get; set; }
        public virtual RefdataSensitivityflag SensitivityFlag { get; set; }
        public virtual RefdataStatus Status { get; set; }
        public virtual ICollection<PlatformDatastructurestodataattributes> PlatformDatastructurestodataattributes { get; set; }
    }
}
