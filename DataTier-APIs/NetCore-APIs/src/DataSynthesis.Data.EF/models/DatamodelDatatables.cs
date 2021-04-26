using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class DatamodelDatatables
    {
        public string TableName { get; set; }
        public string TableInformation { get; set; }
        public short? StatusId { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}
