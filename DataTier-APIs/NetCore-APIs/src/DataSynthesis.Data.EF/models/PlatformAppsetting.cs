using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class PlatformAppsetting
    {
        public short AppSettingsId { get; set; }
        public string AppSettingName { get; set; }
        public string AppSettingValue { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public string RegisteredApp { get; set; }
        public string DefaultDataGenerationApp { get; set; }

        public virtual RefdataApplication DefaultDataGenerationAppNavigation { get; set; }
        public virtual RefdataApplication RegisteredAppNavigation { get; set; }
        public virtual RefdataStatus Status { get; set; }
    }
}
