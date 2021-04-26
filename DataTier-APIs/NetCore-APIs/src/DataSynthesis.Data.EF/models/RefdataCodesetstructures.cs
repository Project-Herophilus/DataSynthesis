using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataCodesetstructures
    {
        public long CodeSetStructuresId { get; set; }
        public string CodeSetStructureName { get; set; }
        public string IndustryStd { get; set; }
        public short? StatusId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string CreatedUser { get; set; }
        public string CodesetStructureGuid { get; set; }
        public string Field1Value { get; set; }
        public string Field2Value { get; set; }
        public string Field3Value { get; set; }
        public string Field4Value { get; set; }
        public string Field5Value { get; set; }
        public string Field6Value { get; set; }
        public string Field7Value { get; set; }
        public string Field8Value { get; set; }
        public string Field9Value { get; set; }
        public short? SensitivityFlagId { get; set; }
        public long? CodesetsId { get; set; }

        public virtual RefdataCodeset Codesets { get; set; }
        public virtual RefdataIndustrystd IndustryStdNavigation { get; set; }
        public virtual RefdataSensitivityflag SensitivityFlag { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
