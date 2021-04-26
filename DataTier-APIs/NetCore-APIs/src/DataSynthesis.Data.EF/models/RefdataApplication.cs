using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class RefdataApplication
    {
        public RefdataApplication()
        {
            DatabuiltAddress = new HashSet<DatabuiltAddress>();
            DatabuiltBankaccount = new HashSet<DatabuiltBankaccount>();
            DatabuiltCorporations = new HashSet<DatabuiltCorporations>();
            DatabuiltNames = new HashSet<DatabuiltNames>();
            DatabuiltPersondemographics = new HashSet<DatabuiltPersondemographics>();
            DatabuiltPhonenumbers = new HashSet<DatabuiltPhonenumbers>();
            DatabuiltProducts = new HashSet<DatabuiltProducts>();
            DataexistingAbabanking = new HashSet<DataexistingAbabanking>();
            DataexistingAreacode = new HashSet<DataexistingAreacode>();
            DataexistingAreacodeintl = new HashSet<DataexistingAreacodeintl>();
            DataexistingCompanies = new HashSet<DataexistingCompanies>();
            DataexistingNamefirst = new HashSet<DataexistingNamefirst>();
            DataexistingNamelast = new HashSet<DataexistingNamelast>();
            DataexistingUpccodes = new HashSet<DataexistingUpccodes>();
            DataexistingZipcodeintl = new HashSet<DataexistingZipcodeintl>();
            DataexistingZipcodeus = new HashSet<DataexistingZipcodeus>();
            DatageneratedAccountnumbers = new HashSet<DatageneratedAccountnumbers>();
            DatageneratedAddresses = new HashSet<DatageneratedAddresses>();
            DatageneratedBankaccount = new HashSet<DatageneratedBankaccount>();
            DatageneratedCreditcard = new HashSet<DatageneratedCreditcard>();
            DatageneratedDateofbirth = new HashSet<DatageneratedDateofbirth>();
            DatageneratedDriverslicenses = new HashSet<DatageneratedDriverslicenses>();
            DatageneratedEin = new HashSet<DatageneratedEin>();
            DatageneratedPhonenumber = new HashSet<DatageneratedPhonenumber>();
            DatageneratedPhonenumbersintl = new HashSet<DatageneratedPhonenumbersintl>();
            DatageneratedSocialsecuritynumber = new HashSet<DatageneratedSocialsecuritynumber>();
            DatageneratedUseridentities = new HashSet<DatageneratedUseridentities>();
            PlatformAppsettingDefaultDataGenerationAppNavigation = new HashSet<PlatformAppsetting>();
            PlatformAppsettingRegisteredAppNavigation = new HashSet<PlatformAppsetting>();
            PlatformConfigDatagen = new HashSet<PlatformConfigDatagen>();
            PlatformDataattributes = new HashSet<PlatformDataattributes>();
            PlatformDatastructures = new HashSet<PlatformDatastructures>();
            PlatformDatastructurestodataattributes = new HashSet<PlatformDatastructurestodataattributes>();
            PlatformRulesetsdefinitions = new HashSet<PlatformRulesetsdefinitions>();
            RefdataPlatformparamstodataattributes = new HashSet<RefdataPlatformparamstodataattributes>();
            TermsCodesetstoapplication = new HashSet<TermsCodesetstoapplication>();
        }

        public string AppGuid { get; set; }
        public string ApplicationCustomCode { get; set; }
        public string ApplicationDesc { get; set; }
        public string CreatedUser { get; set; }
        public DateTime? CreatedDate { get; set; }
        public short? StatusId { get; set; }
        public int? VendorId { get; set; }

        public virtual RefdataStatus Status { get; set; }
        public virtual RefdataVendor Vendor { get; set; }
        public virtual ICollection<DatabuiltAddress> DatabuiltAddress { get; set; }
        public virtual ICollection<DatabuiltBankaccount> DatabuiltBankaccount { get; set; }
        public virtual ICollection<DatabuiltCorporations> DatabuiltCorporations { get; set; }
        public virtual ICollection<DatabuiltNames> DatabuiltNames { get; set; }
        public virtual ICollection<DatabuiltPersondemographics> DatabuiltPersondemographics { get; set; }
        public virtual ICollection<DatabuiltPhonenumbers> DatabuiltPhonenumbers { get; set; }
        public virtual ICollection<DatabuiltProducts> DatabuiltProducts { get; set; }
        public virtual ICollection<DataexistingAbabanking> DataexistingAbabanking { get; set; }
        public virtual ICollection<DataexistingAreacode> DataexistingAreacode { get; set; }
        public virtual ICollection<DataexistingAreacodeintl> DataexistingAreacodeintl { get; set; }
        public virtual ICollection<DataexistingCompanies> DataexistingCompanies { get; set; }
        public virtual ICollection<DataexistingNamefirst> DataexistingNamefirst { get; set; }
        public virtual ICollection<DataexistingNamelast> DataexistingNamelast { get; set; }
        public virtual ICollection<DataexistingUpccodes> DataexistingUpccodes { get; set; }
        public virtual ICollection<DataexistingZipcodeintl> DataexistingZipcodeintl { get; set; }
        public virtual ICollection<DataexistingZipcodeus> DataexistingZipcodeus { get; set; }
        public virtual ICollection<DatageneratedAccountnumbers> DatageneratedAccountnumbers { get; set; }
        public virtual ICollection<DatageneratedAddresses> DatageneratedAddresses { get; set; }
        public virtual ICollection<DatageneratedBankaccount> DatageneratedBankaccount { get; set; }
        public virtual ICollection<DatageneratedCreditcard> DatageneratedCreditcard { get; set; }
        public virtual ICollection<DatageneratedDateofbirth> DatageneratedDateofbirth { get; set; }
        public virtual ICollection<DatageneratedDriverslicenses> DatageneratedDriverslicenses { get; set; }
        public virtual ICollection<DatageneratedEin> DatageneratedEin { get; set; }
        public virtual ICollection<DatageneratedPhonenumber> DatageneratedPhonenumber { get; set; }
        public virtual ICollection<DatageneratedPhonenumbersintl> DatageneratedPhonenumbersintl { get; set; }
        public virtual ICollection<DatageneratedSocialsecuritynumber> DatageneratedSocialsecuritynumber { get; set; }
        public virtual ICollection<DatageneratedUseridentities> DatageneratedUseridentities { get; set; }
        public virtual ICollection<PlatformAppsetting> PlatformAppsettingDefaultDataGenerationAppNavigation { get; set; }
        public virtual ICollection<PlatformAppsetting> PlatformAppsettingRegisteredAppNavigation { get; set; }
        public virtual ICollection<PlatformConfigDatagen> PlatformConfigDatagen { get; set; }
        public virtual ICollection<PlatformDataattributes> PlatformDataattributes { get; set; }
        public virtual ICollection<PlatformDatastructures> PlatformDatastructures { get; set; }
        public virtual ICollection<PlatformDatastructurestodataattributes> PlatformDatastructurestodataattributes { get; set; }
        public virtual ICollection<PlatformRulesetsdefinitions> PlatformRulesetsdefinitions { get; set; }
        public virtual ICollection<RefdataPlatformparamstodataattributes> RefdataPlatformparamstodataattributes { get; set; }
        public virtual ICollection<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
    }
}
