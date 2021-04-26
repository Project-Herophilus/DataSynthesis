using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class TermsCodesetstoapplicationvalues
    {
        public long CodeSetToApplicationValuesId { get; set; }
        public long? CodeSetToApplicationId { get; set; }
        public long CodeSetsId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string CreatedUser { get; set; }
        public string TermValue { get; set; }
        public string TermValueLow { get; set; }
        public string TermValueHigh { get; set; }

        public virtual TermsCodesetstoapplication CodeSetToApplication { get; set; }
        public virtual RefdataCodeset CodeSets { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
