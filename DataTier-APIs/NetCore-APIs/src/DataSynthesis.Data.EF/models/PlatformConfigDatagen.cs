using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class PlatformConfigDatagen
    {
        public short DataGenConfigId { get; set; }
        public string DataTypeGenConfigName { get; set; }
        public short? DataAttributeId { get; set; }
        public string SpecialInstructions { get; set; }
        public int? RunQuantity { get; set; }
        public short? MinuteInterval { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string ApplicationId { get; set; }

        public virtual RefdataApplication Application { get; set; }
        public virtual PlatformDataattributes DataAttribute { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
