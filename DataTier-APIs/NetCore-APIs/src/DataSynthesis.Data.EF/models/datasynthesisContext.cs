using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace DataSynthesis.Data.EF.models
{
    public partial class datasynthesisContext : DbContext
    {
        public datasynthesisContext()
        {
        }

        public datasynthesisContext(DbContextOptions<datasynthesisContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AuditingDataplatform> AuditingDataplatform { get; set; }
        public virtual DbSet<AuditingDatarequest> AuditingDatarequest { get; set; }
        public virtual DbSet<DatabuiltAddress> DatabuiltAddress { get; set; }
        public virtual DbSet<DatabuiltBankaccount> DatabuiltBankaccount { get; set; }
        public virtual DbSet<DatabuiltCorporations> DatabuiltCorporations { get; set; }
        public virtual DbSet<DatabuiltNames> DatabuiltNames { get; set; }
        public virtual DbSet<DatabuiltPersondemographics> DatabuiltPersondemographics { get; set; }
        public virtual DbSet<DatabuiltPhonenumbers> DatabuiltPhonenumbers { get; set; }
        public virtual DbSet<DatabuiltProducts> DatabuiltProducts { get; set; }
        public virtual DbSet<DataexistingAbabanking> DataexistingAbabanking { get; set; }
        public virtual DbSet<DataexistingAreacode> DataexistingAreacode { get; set; }
        public virtual DbSet<DataexistingAreacodeintl> DataexistingAreacodeintl { get; set; }
        public virtual DbSet<DataexistingCompanies> DataexistingCompanies { get; set; }
        public virtual DbSet<DataexistingNamefirst> DataexistingNamefirst { get; set; }
        public virtual DbSet<DataexistingNamelast> DataexistingNamelast { get; set; }
        public virtual DbSet<DataexistingUpccodes> DataexistingUpccodes { get; set; }
        public virtual DbSet<DataexistingZipcodeintl> DataexistingZipcodeintl { get; set; }
        public virtual DbSet<DataexistingZipcodeus> DataexistingZipcodeus { get; set; }
        public virtual DbSet<DatageneratedAccountnumbers> DatageneratedAccountnumbers { get; set; }
        public virtual DbSet<DatageneratedAddresses> DatageneratedAddresses { get; set; }
        public virtual DbSet<DatageneratedBankaccount> DatageneratedBankaccount { get; set; }
        public virtual DbSet<DatageneratedCreditcard> DatageneratedCreditcard { get; set; }
        public virtual DbSet<DatageneratedDateofbirth> DatageneratedDateofbirth { get; set; }
        public virtual DbSet<DatageneratedDriverslicenses> DatageneratedDriverslicenses { get; set; }
        public virtual DbSet<DatageneratedEin> DatageneratedEin { get; set; }
        public virtual DbSet<DatageneratedPhonenumber> DatageneratedPhonenumber { get; set; }
        public virtual DbSet<DatageneratedPhonenumbersintl> DatageneratedPhonenumbersintl { get; set; }
        public virtual DbSet<DatageneratedSocialsecuritynumber> DatageneratedSocialsecuritynumber { get; set; }
        public virtual DbSet<DatageneratedUseridentities> DatageneratedUseridentities { get; set; }
        public virtual DbSet<DatamodelDatatables> DatamodelDatatables { get; set; }
        public virtual DbSet<PlatformAppsetting> PlatformAppsetting { get; set; }
        public virtual DbSet<PlatformConfigDatagen> PlatformConfigDatagen { get; set; }
        public virtual DbSet<PlatformDataattributes> PlatformDataattributes { get; set; }
        public virtual DbSet<PlatformDatastructures> PlatformDatastructures { get; set; }
        public virtual DbSet<PlatformDatastructurestodataattributes> PlatformDatastructurestodataattributes { get; set; }
        public virtual DbSet<PlatformRulesets> PlatformRulesets { get; set; }
        public virtual DbSet<PlatformRulesetsdefinitions> PlatformRulesetsdefinitions { get; set; }
        public virtual DbSet<RefdataAddressformattype> RefdataAddressformattype { get; set; }
        public virtual DbSet<RefdataApplication> RefdataApplication { get; set; }
        public virtual DbSet<RefdataCodeset> RefdataCodeset { get; set; }
        public virtual DbSet<RefdataCodesetstructures> RefdataCodesetstructures { get; set; }
        public virtual DbSet<RefdataCountries> RefdataCountries { get; set; }
        public virtual DbSet<RefdataIndustrystd> RefdataIndustrystd { get; set; }
        public virtual DbSet<RefdataLegalentity> RefdataLegalentity { get; set; }
        public virtual DbSet<RefdataOperationtype> RefdataOperationtype { get; set; }
        public virtual DbSet<RefdataOrganization> RefdataOrganization { get; set; }
        public virtual DbSet<RefdataPlatformparams> RefdataPlatformparams { get; set; }
        public virtual DbSet<RefdataPlatformparamstodataattributes> RefdataPlatformparamstodataattributes { get; set; }
        public virtual DbSet<RefdataSensitivityflag> RefdataSensitivityflag { get; set; }
        public virtual DbSet<RefdataStatus> RefdataStatus { get; set; }
        public virtual DbSet<RefdataTimezones> RefdataTimezones { get; set; }
        public virtual DbSet<RefdataUsstates> RefdataUsstates { get; set; }
        public virtual DbSet<RefdataVendor> RefdataVendor { get; set; }
        public virtual DbSet<TermsCodesetstoapplication> TermsCodesetstoapplication { get; set; }
        public virtual DbSet<TermsCodesetstoapplicationvalues> TermsCodesetstoapplicationvalues { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseMySql("server=127.0.0.1;database=datasynthesis;user=root;password=Developer123;treattinyasboolean=true", x => x.ServerVersion("8.0.22-mysql"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AuditingDataplatform>(entity =>
            {
                entity.HasKey(e => e.DataPlatformId)
                    .HasName("PRIMARY");

                entity.ToTable("auditing_dataplatform");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_dataplatform_status");

                entity.HasIndex(e => new { e.DataPlatformId, e.DataProcessingDate, e.CreatedByUser, e.Organizaton, e.Application, e.StatusId, e.CreatedDate, e.RecCount, e.Component, e.ActionName, e.DurationToRun, e.ActivityDetail })
                    .HasName("IDX_platform_dataplatform");

                entity.Property(e => e.DataPlatformId).HasColumnName("DataPlatformID");

                entity.Property(e => e.ActionName)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ActivityDetail)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Application)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Component)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedByUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.DataProcessingDate).HasColumnType("datetime(3)");

                entity.Property(e => e.Organizaton)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.AuditingDataplatform)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_dataplatform_status");
            });

            modelBuilder.Entity<AuditingDatarequest>(entity =>
            {
                entity.HasKey(e => e.DataRequestId)
                    .HasName("PRIMARY");

                entity.ToTable("auditing_datarequest");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_datarequest_status");

                entity.HasIndex(e => new { e.DataRequestId, e.DataRequestDate, e.CreatedByUser, e.Organizaton, e.Application, e.StatusId, e.CreatedDate, e.RecCount, e.RecordDataRequest })
                    .HasName("IDX_platform_datarequest");

                entity.Property(e => e.DataRequestId).HasColumnName("DataRequestID");

                entity.Property(e => e.Application)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedByUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.DataRequestDate).HasColumnType("datetime(3)");

                entity.Property(e => e.Organizaton)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RecordDataRequest)
                    .HasColumnType("varchar(400)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.AuditingDatarequest)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_datarequest_status");
            });

            modelBuilder.Entity<DatabuiltAddress>(entity =>
            {
                entity.HasKey(e => e.CompleteAddressId)
                    .HasName("PRIMARY");

                entity.ToTable("databuilt_address");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_address_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_databuilt_address_status");

                entity.HasIndex(e => new { e.Address1, e.City, e.StateId, e.ZipCode, e.RegisteredApp })
                    .HasName("IDX_UC_databuilt_address")
                    .IsUnique();

                entity.HasIndex(e => new { e.CompleteAddressId, e.Address1, e.City, e.StateId, e.ZipCode, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_databuilt_completeaddress");

                entity.Property(e => e.CompleteAddressId).HasColumnName("CompleteAddressID");

                entity.Property(e => e.Address1)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(70)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateId)
                    .HasColumnName("StateID")
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.ZipCode)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltAddress)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_address_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltAddress)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_databuilt_address_status");
            });

            modelBuilder.Entity<DatabuiltBankaccount>(entity =>
            {
                entity.HasKey(e => e.DataBuiltBankAccountsId)
                    .HasName("PRIMARY");

                entity.ToTable("databuilt_bankaccount");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_bankaccount_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("fk_databuilt_bankAccounts_status");

                entity.HasIndex(e => new { e.BankAccountNumber, e.BankRoutingId, e.RegisteredApp })
                    .HasName("IDX_UC_databuilt_bankaccount")
                    .IsUnique();

                entity.HasIndex(e => new { e.DataBuiltBankAccountsId, e.BankAccountName, e.BankAccountNumber, e.BankRoutingId, e.StatusId, e.CreatedDate, e.RegisteredApp })
                    .HasName("IX_databuilt_bankAccounts");

                entity.Property(e => e.DataBuiltBankAccountsId).HasColumnName("DataBuiltBankAccountsID");

                entity.Property(e => e.BankAccountName)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.BankAccountNumber)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.BankRoutingId)
                    .HasColumnName("BankRoutingID")
                    .HasColumnType("varchar(9)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltBankaccount)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_bankaccount_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltBankaccount)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("fk_databuilt_bankAccounts_status");
            });

            modelBuilder.Entity<DatabuiltCorporations>(entity =>
            {
                entity.HasKey(e => e.DataBuiltCorporationId)
                    .HasName("PRIMARY");

                entity.ToTable("databuilt_corporations");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_corporations_resiteredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_databuilt_corporations_status");

                entity.HasIndex(e => new { e.CorporationName, e.Address1, e.City, e.StateId, e.ZipCode, e.RegisteredApp })
                    .HasName("IDX_UC_databuilt_corporations")
                    .IsUnique();

                entity.HasIndex(e => new { e.DataBuiltCorporationId, e.CorporationName, e.Address1, e.City, e.StateId, e.ZipCode, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_databuilt_corporations");

                entity.Property(e => e.DataBuiltCorporationId).HasColumnName("DataBuiltCorporationID");

                entity.Property(e => e.Address1)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(70)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CorporationName)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateId)
                    .HasColumnName("StateID")
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.ZipCode)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltCorporations)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_corporations_resiteredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltCorporations)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_databuilt_corporations_status");
            });

            modelBuilder.Entity<DatabuiltNames>(entity =>
            {
                entity.ToTable("databuilt_names");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_names_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_databuilt_completenames_status");

                entity.HasIndex(e => new { e.DataBuiltNamesId, e.CompleteName, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IX_databuilt_names_databuiltnamesid");

                entity.Property(e => e.DataBuiltNamesId).HasColumnName("DataBuiltNamesID");

                entity.Property(e => e.CompleteName)
                    .HasColumnType("varchar(100)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltNames)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_names_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltNames)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_databuilt_completenames_status");
            });

            modelBuilder.Entity<DatabuiltPersondemographics>(entity =>
            {
                entity.HasKey(e => e.PersonDemographicsId)
                    .HasName("PRIMARY");

                entity.ToTable("databuilt_persondemographics");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_persondemographics_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_databuilt_persondemographics_status");

                entity.HasIndex(e => new { e.Dln, e.Dlnstate, e.Ssn, e.Dobdate, e.Dobvalue, e.Age, e.RegisteredApp })
                    .HasName("IDX_UC_databuilt_persondemographics")
                    .IsUnique();

                entity.HasIndex(e => new { e.PersonDemographicsId, e.Dln, e.Dlnstate, e.Ssn, e.Dobvalue, e.Dobdate, e.Age, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_dataabuilt_persondemographics");

                entity.Property(e => e.PersonDemographicsId).HasColumnName("PersonDemographicsID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.Dln)
                    .HasColumnName("DLN")
                    .HasColumnType("varchar(25)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Dlnstate)
                    .HasColumnName("DLNState")
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Dobdate)
                    .HasColumnName("DOBDate")
                    .HasColumnType("date");

                entity.Property(e => e.Dobvalue)
                    .HasColumnName("DOBValue")
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Ssn)
                    .HasColumnName("SSN")
                    .HasColumnType("varchar(11)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltPersondemographics)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_persondemographics_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltPersondemographics)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_databuilt_persondemographics_status");
            });

            modelBuilder.Entity<DatabuiltPhonenumbers>(entity =>
            {
                entity.ToTable("databuilt_phonenumbers");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_phonenumbers_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_databuilt_phonenumbers_status");

                entity.HasIndex(e => new { e.AreaCode, e.PhoneNumber, e.RegisteredApp })
                    .HasName("IDX_UC_databuilt_phonenumbers")
                    .IsUnique();

                entity.HasIndex(e => new { e.DataBuiltPhoneNumbersId, e.AreaCode, e.PhoneNumber, e.CompletePhoneNumber, e.StatusId, e.CreatedDate, e.RegisteredApp })
                    .HasName("IDX_databuilt_phonenumbers");

                entity.Property(e => e.DataBuiltPhoneNumbersId).HasColumnName("DataBuiltPhoneNumbersID");

                entity.Property(e => e.AreaCode)
                    .HasColumnType("varchar(3)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CompletePhoneNumber)
                    .HasColumnType("varchar(14)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.PhoneNumber)
                    .HasColumnType("varchar(8)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltPhonenumbers)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_phonenumbers_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltPhonenumbers)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_databuilt_phonenumbers_status");
            });

            modelBuilder.Entity<DatabuiltProducts>(entity =>
            {
                entity.ToTable("databuilt_products");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_databuilt_products_regsiteredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_databuilt_products_status");

                entity.HasIndex(e => new { e.ProductId, e.ProductName, e.RegisteredApp })
                    .HasName("IDX_UC_databuilt_products")
                    .IsUnique();

                entity.HasIndex(e => new { e.DatabuiltProductsId, e.ProductId, e.ProductName, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_databuilt_products");

                entity.Property(e => e.DatabuiltProductsId).HasColumnName("DatabuiltProductsID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.ProductId)
                    .HasColumnName("ProductID")
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ProductName)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatabuiltProducts)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_databuilt_products_regsiteredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatabuiltProducts)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_databuilt_products_status");
            });

            modelBuilder.Entity<DataexistingAbabanking>(entity =>
            {
                entity.HasKey(e => e.AbabankingId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_ababanking");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_ababanking_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_ababanking_Status");

                entity.HasIndex(e => new { e.AbabankingId, e.RoutingNumber, e.TelegraphicName, e.CustomerName, e.City, e.State, e.ZipCode, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataExisting_ABABanking");

                entity.Property(e => e.AbabankingId).HasColumnName("ABABankingID");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CustomerName)
                    .HasColumnType("varchar(36)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RoutingNumber)
                    .HasColumnType("varchar(9)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.State)
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.TelegraphicName)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ZipCode)
                    .HasColumnType("varchar(5)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingAbabanking)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_ababanking_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingAbabanking)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_ababanking_Status");
            });

            modelBuilder.Entity<DataexistingAreacode>(entity =>
            {
                entity.HasKey(e => e.AreaCodeId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_areacode");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_areacode_registeredapp");

                entity.HasIndex(e => e.StateCode)
                    .HasName("FK_dataexisting_areacode_USStates");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_areacode_Status");

                entity.HasIndex(e => e.TimeZone)
                    .HasName("FK_dataexisting_areacode_timezones");

                entity.HasIndex(e => new { e.AreaCodeValue, e.TimeZone, e.StateCode })
                    .HasName("IDX_UC_dataexisting_areacode")
                    .IsUnique();

                entity.HasIndex(e => new { e.AreaCodeValue, e.TimeZone, e.StateCode, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataExisting_AreaCode");

                entity.Property(e => e.AreaCodeId).HasColumnName("AreaCodeID");

                entity.Property(e => e.AreaCodeValue)
                    .IsRequired()
                    .HasColumnType("varchar(3)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateCode)
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.TimeZone)
                    .HasColumnType("varchar(3)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingAreacode)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_areacode_registeredapp");

                entity.HasOne(d => d.StateCodeNavigation)
                    .WithMany(p => p.DataexistingAreacode)
                    .HasForeignKey(d => d.StateCode)
                    .HasConstraintName("FK_dataexisting_areacode_USStates");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingAreacode)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_areacode_Status");

                entity.HasOne(d => d.TimeZoneNavigation)
                    .WithMany(p => p.DataexistingAreacode)
                    .HasForeignKey(d => d.TimeZone)
                    .HasConstraintName("FK_dataexisting_areacode_timezones");
            });

            modelBuilder.Entity<DataexistingAreacodeintl>(entity =>
            {
                entity.HasKey(e => e.Iddcode)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_areacodeintl");

                entity.HasIndex(e => e.CountryId)
                    .HasName("FK_dataexisting_areacodeintl_Countries");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_areacodeintl_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_areacodeintl_Status");

                entity.HasIndex(e => new { e.Iddcode, e.CountryId, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_DataExisting_AreaCodeIntl");

                entity.Property(e => e.Iddcode)
                    .HasColumnName("IDDCode")
                    .HasColumnType("varchar(5)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.DataexistingAreacodeintl)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_dataexisting_areacodeintl_Countries");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingAreacodeintl)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_areacodeintl_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingAreacodeintl)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_areacodeintl_Status");
            });

            modelBuilder.Entity<DataexistingCompanies>(entity =>
            {
                entity.HasKey(e => e.CompaniesId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_companies");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_companies_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_companies_Status");

                entity.HasIndex(e => new { e.CompaniesId, e.CompanyName, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataExisting_Companies");

                entity.Property(e => e.CompaniesId).HasColumnName("CompaniesID");

                entity.Property(e => e.CompanyName)
                    .HasColumnType("varchar(79)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingCompanies)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_companies_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingCompanies)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_companies_Status");
            });

            modelBuilder.Entity<DataexistingNamefirst>(entity =>
            {
                entity.HasKey(e => e.FirstNameId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_namefirst");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_namefirst_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_namefirst_Status");

                entity.HasIndex(e => new { e.FirstName, e.Gender, e.RegisteredApp })
                    .HasName("IDX_UC_dataexisting_namefirst")
                    .IsUnique();

                entity.HasIndex(e => new { e.FirstNameId, e.FirstName, e.Gender, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataExistng_NameFirst");

                entity.Property(e => e.FirstNameId).HasColumnName("FirstNameID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.FirstName)
                    .HasColumnType("varchar(39)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Gender)
                    .HasColumnType("varchar(1)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingNamefirst)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_namefirst_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingNamefirst)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_namefirst_Status");
            });

            modelBuilder.Entity<DataexistingNamelast>(entity =>
            {
                entity.HasKey(e => e.LastNameId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_namelast");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_namelast_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_namelast_Status");

                entity.HasIndex(e => new { e.LastName, e.RegisteredApp })
                    .HasName("IDX_UC_DataExisting_NameLast")
                    .IsUnique();

                entity.HasIndex(e => new { e.LastNameId, e.LastName, e.StatusId, e.CreatedDate, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataExisting_NameLast");

                entity.Property(e => e.LastNameId).HasColumnName("LastNameID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.LastName)
                    .HasColumnType("varchar(69)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingNamelast)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_namelast_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingNamelast)
                    .HasForeignKey(d => d.StatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_dataexisting_namelast_Status");
            });

            modelBuilder.Entity<DataexistingUpccodes>(entity =>
            {
                entity.HasKey(e => e.UpccodeId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_upccodes");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_upccodes_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_upccodes_Status");

                entity.HasIndex(e => new { e.UpccodeId, e.UpccodeName, e.UpcproductName, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_DataExisting_UPCCodes");

                entity.Property(e => e.UpccodeId).HasColumnName("UPCCodeID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.UpccodeName)
                    .HasColumnName("UPCCodeName")
                    .HasColumnType("varchar(15)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.UpcproductName)
                    .HasColumnName("UPCProductName")
                    .HasColumnType("varchar(150)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingUpccodes)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_upccodes_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingUpccodes)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_upccodes_Status");
            });

            modelBuilder.Entity<DataexistingZipcodeintl>(entity =>
            {
                entity.HasKey(e => e.ZipCodeIntnlId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_zipcodeintl");

                entity.HasIndex(e => e.Country)
                    .HasName("FK_dataexisting_zipcodeIntl_Countries");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_zipcodeintl_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_zipcodeIntl_Status");

                entity.HasIndex(e => new { e.ZipCodeIntnlId, e.ZipCode, e.ZipCodeType, e.Country, e.City, e.Lattitude, e.Longitude, e.Location, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataExisting_ZipcodeIntl");

                entity.Property(e => e.ZipCodeIntnlId).HasColumnName("ZipCodeIntnlID");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Lattitude)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Location)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Longitude)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.ZipCode)
                    .IsRequired()
                    .HasColumnType("char(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ZipCodeType)
                    .HasColumnType("varchar(15)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.CountryNavigation)
                    .WithMany(p => p.DataexistingZipcodeintl)
                    .HasForeignKey(d => d.Country)
                    .HasConstraintName("FK_dataexisting_zipcodeIntl_Countries");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingZipcodeintl)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_zipcodeintl_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingZipcodeintl)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_zipcodeIntl_Status");
            });

            modelBuilder.Entity<DataexistingZipcodeus>(entity =>
            {
                entity.HasKey(e => e.ZipCodeId)
                    .HasName("PRIMARY");

                entity.ToTable("dataexisting_zipcodeus");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_dataexisting_zipcodeus_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_dataexisting_zipcodeUS_Status");

                entity.HasIndex(e => new { e.ZipCodeId, e.ZipCode, e.ZipCodeType, e.City, e.State, e.Lattitude, e.Longitude, e.Location, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_dataexisting_zipcodeus");

                entity.Property(e => e.ZipCodeId).HasColumnName("ZipCodeID");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Lattitude)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Location)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Longitude)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.State)
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.ZipCode)
                    .IsRequired()
                    .HasColumnType("char(5)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ZipCodeType)
                    .HasColumnType("varchar(15)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DataexistingZipcodeus)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_dataexisting_zipcodeus_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DataexistingZipcodeus)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_dataexisting_zipcodeUS_Status");
            });

            modelBuilder.Entity<DatageneratedAccountnumbers>(entity =>
            {
                entity.HasKey(e => e.AccountNumbersId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_accountnumbers");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_accountnumbers_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_accountnumbers_status");

                entity.HasIndex(e => new { e.AccountNumberValue, e.RegisteredApp })
                    .HasName("IDX_UC_datagenerated_accountnumbers")
                    .IsUnique();

                entity.HasIndex(e => new { e.AccountNumbersId, e.AccountNumberValue, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_AccountNumbers");

                entity.Property(e => e.AccountNumbersId).HasColumnName("AccountNumbersID");

                entity.Property(e => e.AccountNumberValue)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedAccountnumbers)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_accountnumbers_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedAccountnumbers)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_accountnumbers_Status");
            });

            modelBuilder.Entity<DatageneratedAddresses>(entity =>
            {
                entity.HasKey(e => e.AddressId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_addresses");

                entity.HasIndex(e => e.AddressFormatTypeId)
                    .HasName("FK_datagenerated_addresses_AddressFormatType");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_addresses_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_addresses_status");

                entity.HasIndex(e => new { e.AddressStreet, e.AddressStreet2, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_Addresses")
                    .IsUnique();

                entity.HasIndex(e => new { e.AddressId, e.AddressStreet, e.AddressStreet2, e.AddressFormatTypeId, e.StatusId, e.CreatedDate, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_Addresses");

                entity.Property(e => e.AddressId).HasColumnName("AddressID");

                entity.Property(e => e.AddressFormatTypeId).HasDefaultValueSql("'1'");

                entity.Property(e => e.AddressStreet)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.AddressStreet2)
                    .HasColumnType("varchar(59)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.AddressFormatType)
                    .WithMany(p => p.DatageneratedAddresses)
                    .HasForeignKey(d => d.AddressFormatTypeId)
                    .HasConstraintName("FK_datagenerated_addresses_AddressFormatType");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedAddresses)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_addresses_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedAddresses)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_addresses_status");
            });

            modelBuilder.Entity<DatageneratedBankaccount>(entity =>
            {
                entity.HasKey(e => e.BankAccountsId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_bankaccount");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_bankaccount_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_bankaccount_Status");

                entity.HasIndex(e => new { e.BankAccountValue, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_BankAccounts")
                    .IsUnique();

                entity.HasIndex(e => new { e.BankAccountsId, e.BankAccountValue, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_BankAccounts");

                entity.Property(e => e.BankAccountsId).HasColumnName("BankAccountsID");

                entity.Property(e => e.BankAccountValue)
                    .HasColumnType("varchar(17)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedBankaccount)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_bankaccount_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedBankaccount)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_bankaccount_Status");
            });

            modelBuilder.Entity<DatageneratedCreditcard>(entity =>
            {
                entity.HasKey(e => e.CreditCardId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_creditcard");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_creditcard_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_creditcard_Status");

                entity.HasIndex(e => new { e.CreditCardName, e.CreditCardNumber, e.RegisteredApp })
                    .HasName("IDX_UC_datagenerated_creditcard")
                    .IsUnique();

                entity.HasIndex(e => new { e.CreditCardId, e.CreditCardNumber, e.CreditCardName, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_CreditCard");

                entity.Property(e => e.CreditCardId).HasColumnName("CreditCardID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreditCardName)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreditCardNumber)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedCreditcard)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_creditcard_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedCreditcard)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_creditcard_Status");
            });

            modelBuilder.Entity<DatageneratedDateofbirth>(entity =>
            {
                entity.HasKey(e => e.DateofBirthsId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_dateofbirth");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_dateofbirth_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_dateofbirth_Status");

                entity.HasIndex(e => new { e.DateOfBirth, e.DateOfBirthDate, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_DateOfBirths")
                    .IsUnique();

                entity.HasIndex(e => new { e.DateofBirthsId, e.DateOfBirth, e.DateOfBirthDate, e.Age, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_DateOfBirths");

                entity.Property(e => e.DateofBirthsId).HasColumnName("DateofBirthsID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.DateOfBirth)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.DateOfBirthDate).HasColumnType("date");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedDateofbirth)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_dateofbirth_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedDateofbirth)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_dateofbirth_Status");
            });

            modelBuilder.Entity<DatageneratedDriverslicenses>(entity =>
            {
                entity.HasKey(e => e.DriversLicensesId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_driverslicenses");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_driverslicenses_registeredapp");

                entity.HasIndex(e => e.StateCode)
                    .HasName("FK_datagenerated_driverslicenses_USStates");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_driverslicenses_Status");

                entity.HasIndex(e => new { e.Dln, e.StateCode, e.CompleteDriversLicenseNumber, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_DriversLicenses")
                    .IsUnique();

                entity.HasIndex(e => new { e.DriversLicensesId, e.CreatedDate, e.Dln, e.StateCode, e.StatusId, e.CompleteDriversLicenseNumber, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_DriversLicenses");

                entity.Property(e => e.DriversLicensesId).HasColumnName("DriversLicensesID");

                entity.Property(e => e.CompleteDriversLicenseNumber)
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Dln)
                    .HasColumnName("DLN")
                    .HasColumnType("varchar(25)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateCode)
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedDriverslicenses)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_driverslicenses_registeredapp");

                entity.HasOne(d => d.StateCodeNavigation)
                    .WithMany(p => p.DatageneratedDriverslicenses)
                    .HasForeignKey(d => d.StateCode)
                    .HasConstraintName("FK_datagenerated_driverslicenses_USStates");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedDriverslicenses)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_driverslicenses_Status");
            });

            modelBuilder.Entity<DatageneratedEin>(entity =>
            {
                entity.HasKey(e => e.Einid)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_ein");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_ein_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_ein_Status");

                entity.HasIndex(e => new { e.Einvalue, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_EIN")
                    .IsUnique();

                entity.HasIndex(e => new { e.Einid, e.Einvalue, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_EIN");

                entity.Property(e => e.Einid).HasColumnName("EINID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Einvalue)
                    .HasColumnName("EINValue")
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedEin)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_ein_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedEin)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_ein_Status");
            });

            modelBuilder.Entity<DatageneratedPhonenumber>(entity =>
            {
                entity.HasKey(e => e.PhoneNumberId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_phonenumber");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_phonenumber_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_phonenumbers_Status");

                entity.HasIndex(e => new { e.PhoneNumberValue, e.RegisteredApp })
                    .HasName("IDX_UC_DataGeneratedPhoneNumbers")
                    .IsUnique();

                entity.HasIndex(e => new { e.PhoneNumberId, e.PhoneNumberValue, e.RegisteredApp, e.CreatedUser, e.CreatedDate, e.StatusId })
                    .HasName("IDX_PhoneNumbers");

                entity.Property(e => e.PhoneNumberId).HasColumnName("PhoneNumberID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.PhoneNumberValue)
                    .HasColumnType("varchar(8)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedPhonenumber)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_phonenumber_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedPhonenumber)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_phonenumbers_Status");
            });

            modelBuilder.Entity<DatageneratedPhonenumbersintl>(entity =>
            {
                entity.HasKey(e => e.PhoneNumberIntlId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_phonenumbersintl");

                entity.HasIndex(e => e.CountryId)
                    .HasName("FK_datagenerated_phonenumbersintl_Country");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_phonenumbersintl_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_phonenumbersintl_Status");

                entity.HasIndex(e => new { e.PhoneNumberValue, e.CountryId, e.RegisteredApp })
                    .HasName("IDX_UC_datagenerated_phonenumbersintl")
                    .IsUnique();

                entity.HasIndex(e => new { e.PhoneNumberIntlId, e.PhoneNumberValue, e.CountryId, e.CreatedDate, e.CreatedUser, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_PhoneNumbersIntl");

                entity.Property(e => e.PhoneNumberIntlId).HasColumnName("PhoneNumberIntlID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.PhoneNumberValue)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.DatageneratedPhonenumbersintl)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_datagenerated_phonenumbersintl_Country");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedPhonenumbersintl)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_phonenumbersintl_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedPhonenumbersintl)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_phonenumbersintl_Status");
            });

            modelBuilder.Entity<DatageneratedSocialsecuritynumber>(entity =>
            {
                entity.HasKey(e => e.SocialSecurityNumberId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_socialsecuritynumber");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_socialsecuritynumber_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_socialsecuritynumber_Status");

                entity.HasIndex(e => new { e.SocialSecurityNumberValue, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_SocialSecurityNumbers")
                    .IsUnique();

                entity.HasIndex(e => new { e.SocialSecurityNumberId, e.SocialSecurityNumberValue, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_SocialSecurityNumber");

                entity.Property(e => e.SocialSecurityNumberId).HasColumnName("SocialSecurityNumberID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SocialSecurityNumberValue)
                    .HasColumnType("varchar(11)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedSocialsecuritynumber)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_socialsecuritynumber_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedSocialsecuritynumber)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_socialsecuritynumber_Status");
            });

            modelBuilder.Entity<DatageneratedUseridentities>(entity =>
            {
                entity.HasKey(e => e.UserIdentitiesId)
                    .HasName("PRIMARY");

                entity.ToTable("datagenerated_useridentities");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_datagenerated_useridentities_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_datagenerated_useridentities_Status");

                entity.HasIndex(e => new { e.UserIdentityValue, e.UserDomain, e.RegisteredApp })
                    .HasName("IDX_UC_DataGenerated_UserIdentities")
                    .IsUnique();

                entity.HasIndex(e => new { e.UserIdentitiesId, e.UserIdentityValue, e.UserDomain, e.CreatedDate, e.StatusId, e.AdditionalAttributes, e.RegisteredApp })
                    .HasName("IDX_DataGenerated_Identities");

                entity.Property(e => e.UserIdentitiesId).HasColumnName("UserIdentitiesID");

                entity.Property(e => e.AdditionalAttributes)
                    .HasColumnType("varchar(40)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.UserDomain)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.UserIdentityValue)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.DatageneratedUseridentities)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_datagenerated_useridentities_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.DatageneratedUseridentities)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_datagenerated_useridentities_Status");
            });

            modelBuilder.Entity<DatamodelDatatables>(entity =>
            {
                entity.HasKey(e => e.TableName)
                    .HasName("PRIMARY");

                entity.ToTable("datamodel_datatables");

                entity.HasIndex(e => new { e.TableName, e.TableInformation, e.StatusId, e.CreatedDate })
                    .HasName("IDX_datamodel_datatables");

                entity.Property(e => e.TableName)
                    .HasColumnType("varchar(64)")
                    .HasCharSet("utf8")
                    .HasCollation("utf8_general_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.TableInformation)
                    .HasColumnType("varchar(249)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");
            });

            modelBuilder.Entity<PlatformAppsetting>(entity =>
            {
                entity.HasKey(e => e.AppSettingsId)
                    .HasName("PRIMARY");

                entity.ToTable("platform_appsetting");

                entity.HasIndex(e => e.DefaultDataGenerationApp)
                    .HasName("FK_platform_appsetting_datagenapp");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_platform_appsettings_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_appsettings_status");

                entity.HasIndex(e => new { e.AppSettingsId, e.AppSettingName, e.AppSettingValue, e.CreatedDate, e.StatusId, e.RegisteredApp, e.DefaultDataGenerationApp })
                    .HasName("IDX_PlatformData_AppSettings");

                entity.Property(e => e.AppSettingsId).HasColumnName("AppSettingsID");

                entity.Property(e => e.AppSettingName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.AppSettingValue)
                    .HasColumnType("varchar(199)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.DefaultDataGenerationApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.DefaultDataGenerationAppNavigation)
                    .WithMany(p => p.PlatformAppsettingDefaultDataGenerationAppNavigation)
                    .HasForeignKey(d => d.DefaultDataGenerationApp)
                    .HasConstraintName("FK_platform_appsetting_datagenapp");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.PlatformAppsettingRegisteredAppNavigation)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_platform_appsettings_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformAppsetting)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_appsettings_status");
            });

            modelBuilder.Entity<PlatformConfigDatagen>(entity =>
            {
                entity.HasKey(e => e.DataGenConfigId)
                    .HasName("PRIMARY");

                entity.ToTable("platform_config_datagen");

                entity.HasIndex(e => e.ApplicationId)
                    .HasName("platform_config_datagen_registeredapp");

                entity.HasIndex(e => e.DataAttributeId)
                    .HasName("FK_platform_datagenconfig_dataattributes");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_datagenconfig_status");

                entity.HasIndex(e => new { e.DataGenConfigId, e.DataAttributeId, e.DataTypeGenConfigName, e.RunQuantity, e.MinuteInterval, e.SpecialInstructions, e.CreatedDate, e.CreatedUser, e.StatusId, e.ApplicationId })
                    .HasName("IDX_PlatformConfigDataGen");

                entity.Property(e => e.DataGenConfigId).HasColumnName("DataGenConfigID");

                entity.Property(e => e.ApplicationId)
                    .HasColumnName("ApplicationID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.DataAttributeId).HasColumnName("DataAttributeID");

                entity.Property(e => e.DataTypeGenConfigName)
                    .HasColumnType("varchar(25)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SpecialInstructions)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Application)
                    .WithMany(p => p.PlatformConfigDatagen)
                    .HasForeignKey(d => d.ApplicationId)
                    .HasConstraintName("platform_config_datagen_registeredapp");

                entity.HasOne(d => d.DataAttribute)
                    .WithMany(p => p.PlatformConfigDatagen)
                    .HasForeignKey(d => d.DataAttributeId)
                    .HasConstraintName("FK_platform_datagenconfig_dataattributes");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformConfigDatagen)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_datagenconfig_status");
            });

            modelBuilder.Entity<PlatformDataattributes>(entity =>
            {
                entity.ToTable("platform_dataattributes");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_platform_dataattributes_registeredapp");

                entity.HasIndex(e => e.SensitivityFlagId)
                    .HasName("FK_platformdataattributes_sensitivtyflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platformdataattributes_status");

                entity.HasIndex(e => new { e.PlatformDataAttributesId, e.DataAttributeName, e.SensitivityFlagId, e.CreatedDate, e.StatusId, e.CreatedUser, e.PlatformDataAttributeGuid, e.RegisteredApp })
                    .HasName("IDX_Platform_DataAttributes");

                entity.Property(e => e.PlatformDataAttributesId).HasColumnName("PlatformDataAttributesID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.DataAttributeName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.PlatformDataAttributeGuid)
                    .HasColumnName("PlatformDataAttributeGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SensitivityFlagId).HasColumnName("SensitivityFlagID");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.PlatformDataattributes)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_platform_dataattributes_registeredapp");

                entity.HasOne(d => d.SensitivityFlag)
                    .WithMany(p => p.PlatformDataattributes)
                    .HasForeignKey(d => d.SensitivityFlagId)
                    .HasConstraintName("FK_platformdataattributes_sensitivtyflag");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformDataattributes)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platformdataattributes_status");
            });

            modelBuilder.Entity<PlatformDatastructures>(entity =>
            {
                entity.ToTable("platform_datastructures");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_platform_datastructures__registeredapp");

                entity.HasIndex(e => e.SensitivityFlagId)
                    .HasName("FK_platform_datastructures_sensitivityflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_datastructures_status");

                entity.HasIndex(e => new { e.PlatformDataStructuresId, e.DataStructureName, e.SensitivityFlagId, e.CreatedDate, e.StatusId, e.CreatedUser, e.PlatformDataStructuresGuid, e.RegisteredApp })
                    .HasName("IDX_Platform_DataStructures");

                entity.Property(e => e.PlatformDataStructuresId).HasColumnName("PlatformDataStructuresID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.DataStructureName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.PlatformDataStructuresGuid)
                    .HasColumnName("PlatformDataStructuresGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SensitivityFlagId).HasColumnName("SensitivityFlagID");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.PlatformDatastructures)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_platform_datastructures__registeredapp");

                entity.HasOne(d => d.SensitivityFlag)
                    .WithMany(p => p.PlatformDatastructures)
                    .HasForeignKey(d => d.SensitivityFlagId)
                    .HasConstraintName("FK_platform_datastructures_sensitivityflag");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformDatastructures)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_datastructures_status");
            });

            modelBuilder.Entity<PlatformDatastructurestodataattributes>(entity =>
            {
                entity.ToTable("platform_datastructurestodataattributes");

                entity.HasIndex(e => e.PlatformDataAttributesId)
                    .HasName("FK_platform_datastructurestodataattributes_dataattributes");

                entity.HasIndex(e => e.PlatformDataStructuresId)
                    .HasName("FK_platform_datastructurestodataattributes_datastructure");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_platform_datastructurestodataattributes_registeredapp");

                entity.HasIndex(e => e.SensitivityFlagId)
                    .HasName("FK_platform_datastructurestodataattributes_sensitivityflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_datastructurestodataattributes_status");

                entity.HasIndex(e => new { e.PlatformDataStructuresToDataAttributesId, e.PlatformDataStructuresToDataAttributesGuid, e.PlatformDataStructuresId, e.CompositeDataStructureName, e.SensitivityFlagId, e.CreatedDate, e.StatusId, e.CreatedUser, e.RegisteredApp, e.PlatformDataAttributesId })
                    .HasName("IDX_Platform_DataStructuresToDataAttributes");

                entity.Property(e => e.PlatformDataStructuresToDataAttributesId).HasColumnName("PlatformDataStructuresToDataAttributesID");

                entity.Property(e => e.CompositeDataStructureName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.PlatformDataAttributesId).HasColumnName("PlatformDataAttributesID");

                entity.Property(e => e.PlatformDataStructuresId).HasColumnName("PlatformDataStructuresID");

                entity.Property(e => e.PlatformDataStructuresToDataAttributesGuid)
                    .HasColumnName("PlatformDataStructuresToDataAttributesGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SensitivityFlagId)
                    .HasColumnName("SensitivityFlagID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.PlatformDataAttributes)
                    .WithMany(p => p.PlatformDatastructurestodataattributes)
                    .HasForeignKey(d => d.PlatformDataAttributesId)
                    .HasConstraintName("FK_platform_datastructurestodataattributes_dataattributes");

                entity.HasOne(d => d.PlatformDataStructures)
                    .WithMany(p => p.PlatformDatastructurestodataattributes)
                    .HasForeignKey(d => d.PlatformDataStructuresId)
                    .HasConstraintName("FK_platform_datastructurestodataattributes_datastructure");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.PlatformDatastructurestodataattributes)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_platform_datastructurestodataattributes_registeredapp");

                entity.HasOne(d => d.SensitivityFlag)
                    .WithMany(p => p.PlatformDatastructurestodataattributes)
                    .HasForeignKey(d => d.SensitivityFlagId)
                    .HasConstraintName("FK_platform_datastructurestodataattributes_sensitivityflag");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformDatastructurestodataattributes)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_datastructurestodataattributes_status");
            });

            modelBuilder.Entity<PlatformRulesets>(entity =>
            {
                entity.HasKey(e => e.RuleId)
                    .HasName("PRIMARY");

                entity.ToTable("platform_rulesets");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_rulesets_status");

                entity.HasIndex(e => new { e.RuleId, e.RuleName, e.CreatedUser, e.CreatedDate, e.ExpirationDate, e.StatusId })
                    .HasName("IDX_Platform_RuleSets");

                entity.Property(e => e.RuleId).HasColumnName("RuleID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ExpirationDate).HasColumnType("timestamp");

                entity.Property(e => e.RuleName)
                    .HasColumnType("varchar(65)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformRulesets)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_rulesets_status");
            });

            modelBuilder.Entity<PlatformRulesetsdefinitions>(entity =>
            {
                entity.HasKey(e => e.RulesetDefinitionsId)
                    .HasName("PRIMARY");

                entity.ToTable("platform_rulesetsdefinitions");

                entity.HasIndex(e => e.ApplicationId)
                    .HasName("FK_platform_rulesetsdefinitions_registeredapp");

                entity.HasIndex(e => e.DataAttributeId)
                    .HasName("FK_platform_rulesetsdefinitions_dataattributes");

                entity.HasIndex(e => e.OperationTypeId)
                    .HasName("FK_platform_rulesetsdefinitions_operationtype");

                entity.HasIndex(e => e.RuleSetId)
                    .HasName("FK_platform_rulesetsdefinitions_ruleset");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_platform_rulesetsdefinitions_status");

                entity.HasIndex(e => new { e.RulesetDefinitionsId, e.RuleSetId, e.RulesetDefinitionName, e.StepOrderId, e.OperationTypeId, e.RulesetDefValue, e.CreatedDate, e.EffectiveDate, e.StatusId, e.ApplicationId, e.TermDate, e.DataAttributeId })
                    .HasName("IDX_Platform_RulesetsDefinitions");

                entity.Property(e => e.RulesetDefinitionsId)
                    .HasColumnName("RulesetDefinitionsID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ApplicationId)
                    .HasColumnName("ApplicationID")
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.DataAttributeId).HasColumnName("DataAttributeID");

                entity.Property(e => e.EffectiveDate).HasColumnType("timestamp");

                entity.Property(e => e.OperationTypeId)
                    .HasColumnName("OperationTypeID")
                    .HasColumnType("varchar(7)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RuleSetId).HasColumnName("RuleSetID");

                entity.Property(e => e.RulesetDefValue)
                    .HasColumnType("char(40)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.RulesetDefinitionName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.StepOrderId).HasColumnName("StepOrderID");

                entity.Property(e => e.TermDate).HasColumnType("timestamp");

                entity.HasOne(d => d.Application)
                    .WithMany(p => p.PlatformRulesetsdefinitions)
                    .HasForeignKey(d => d.ApplicationId)
                    .HasConstraintName("FK_platform_rulesetsdefinitions_registeredapp");

                entity.HasOne(d => d.DataAttribute)
                    .WithMany(p => p.PlatformRulesetsdefinitions)
                    .HasForeignKey(d => d.DataAttributeId)
                    .HasConstraintName("FK_platform_rulesetsdefinitions_dataattributes");

                entity.HasOne(d => d.OperationType)
                    .WithMany(p => p.PlatformRulesetsdefinitions)
                    .HasForeignKey(d => d.OperationTypeId)
                    .HasConstraintName("FK_platform_rulesetsdefinitions_operationtype");

                entity.HasOne(d => d.RuleSet)
                    .WithMany(p => p.PlatformRulesetsdefinitions)
                    .HasForeignKey(d => d.RuleSetId)
                    .HasConstraintName("FK_platform_rulesetsdefinitions_ruleset");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PlatformRulesetsdefinitions)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_platform_rulesetsdefinitions_status");
            });

            modelBuilder.Entity<RefdataAddressformattype>(entity =>
            {
                entity.HasKey(e => e.AddressFormatTypeId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_addressformattype");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_AddressFormatType_Status");

                entity.HasIndex(e => new { e.AddressFormatTypeId, e.AddressFormatTypeDesc, e.CreatedDate, e.StatusId })
                    .HasName("IDX_refdata_addressformattype_AddressFormatTypeID");

                entity.Property(e => e.AddressFormatTypeId).HasColumnName("AddressFormatTypeID");

                entity.Property(e => e.AddressFormatTypeDesc)
                    .HasColumnType("varchar(35)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.StatusId).HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataAddressformattype)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_AddressFormatType_Status");
            });

            modelBuilder.Entity<RefdataApplication>(entity =>
            {
                entity.HasKey(e => e.AppGuid)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_application");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_application_status");

                entity.HasIndex(e => e.VendorId)
                    .HasName("FK_refdata_application_vendors");

                entity.HasIndex(e => new { e.AppGuid, e.ApplicationCustomCode, e.ApplicationDesc, e.CreatedUser, e.CreatedDate, e.StatusId, e.VendorId })
                    .HasName("IDX_RefData_Application");

                entity.Property(e => e.AppGuid)
                    .HasColumnName("AppGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ApplicationCustomCode)
                    .HasColumnType("varchar(15)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.ApplicationDesc)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.VendorId).HasColumnName("VendorID");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataApplication)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_application_status");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.RefdataApplication)
                    .HasForeignKey(d => d.VendorId)
                    .HasConstraintName("FK_refdata_application_vendors");
            });

            modelBuilder.Entity<RefdataCodeset>(entity =>
            {
                entity.HasKey(e => e.CodeSetsId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_codeset");

                entity.HasIndex(e => e.IndustryStd)
                    .HasName("FK_refdata_codeset_industrystd");

                entity.HasIndex(e => e.SensitivityFlagId)
                    .HasName("FK_refdata_codeset_sensitivityflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_codesets_status");

                entity.HasIndex(e => new { e.CodeSetsId, e.CodeSetName, e.IndustryStd, e.CreatedDate, e.StatusId, e.CreatedUser, e.CodesetGuid, e.FieldMapping, e.SensitivityFlagId })
                    .HasName("IDX_RefData_CodeSets");

                entity.Property(e => e.CodeSetsId).HasColumnName("CodeSetsID");

                entity.Property(e => e.CodeSetName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CodesetGuid)
                    .HasColumnName("CodesetGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.FieldMapping)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.IndustryStd)
                    .HasColumnType("varchar(6)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SensitivityFlagId).HasColumnName("SensitivityFlagID");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.IndustryStdNavigation)
                    .WithMany(p => p.RefdataCodeset)
                    .HasForeignKey(d => d.IndustryStd)
                    .HasConstraintName("FK_refdata_codeset_industrystd");

                entity.HasOne(d => d.SensitivityFlag)
                    .WithMany(p => p.RefdataCodeset)
                    .HasForeignKey(d => d.SensitivityFlagId)
                    .HasConstraintName("FK_refdata_codeset_sensitivityflag");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataCodeset)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_codesets_status");
            });

            modelBuilder.Entity<RefdataCodesetstructures>(entity =>
            {
                entity.HasKey(e => e.CodeSetStructuresId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_codesetstructures");

                entity.HasIndex(e => e.CodesetsId)
                    .HasName("FK_refdata_codesetstructures_codesets");

                entity.HasIndex(e => e.IndustryStd)
                    .HasName("FK_refdata_codesetstructures_industrystd");

                entity.HasIndex(e => e.SensitivityFlagId)
                    .HasName("FK_refdata_codesetstructures_sensitivityflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_codesetstructures_status");

                entity.HasIndex(e => new { e.CodeSetStructuresId, e.CodeSetStructureName, e.IndustryStd, e.CreatedDate, e.StatusId, e.CreatedUser, e.CodesetStructureGuid, e.CodesetsId })
                    .HasName("IDX_RefData_CodeSetStructure1");

                entity.HasIndex(e => new { e.Field1Value, e.Field2Value, e.Field3Value, e.Field4Value, e.Field5Value, e.Field6Value, e.Field7Value, e.Field8Value, e.Field9Value, e.SensitivityFlagId })
                    .HasName("IDX_RefData_CodeSetStructure2");

                entity.Property(e => e.CodeSetStructuresId).HasColumnName("CodeSetStructuresID");

                entity.Property(e => e.CodeSetStructureName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CodesetStructureGuid)
                    .HasColumnName("CodesetStructureGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CodesetsId).HasColumnName("CodesetsID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field1Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field2Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field3Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field4Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field5Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field6Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field7Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field8Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Field9Value)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.IndustryStd)
                    .HasColumnType("varchar(6)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SensitivityFlagId).HasColumnName("SensitivityFlagID");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Codesets)
                    .WithMany(p => p.RefdataCodesetstructures)
                    .HasForeignKey(d => d.CodesetsId)
                    .HasConstraintName("FK_refdata_codesetstructures_codesets");

                entity.HasOne(d => d.IndustryStdNavigation)
                    .WithMany(p => p.RefdataCodesetstructures)
                    .HasForeignKey(d => d.IndustryStd)
                    .HasConstraintName("FK_refdata_codesetstructures_industrystd");

                entity.HasOne(d => d.SensitivityFlag)
                    .WithMany(p => p.RefdataCodesetstructures)
                    .HasForeignKey(d => d.SensitivityFlagId)
                    .HasConstraintName("FK_refdata_codesetstructures_sensitivityflag");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataCodesetstructures)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_codesetstructures_status");
            });

            modelBuilder.Entity<RefdataCountries>(entity =>
            {
                entity.HasKey(e => e.CountryId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_countries");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_Countries_Status");

                entity.HasIndex(e => new { e.CountryId, e.Idd, e.CountryName, e.CreatedDate, e.StatusId })
                    .HasName("IX_Countries");

                entity.Property(e => e.CountryId).HasColumnName("CountryID");

                entity.Property(e => e.CountryName)
                    .HasColumnType("varchar(59)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.Idd)
                    .HasColumnName("IDD")
                    .HasColumnType("varchar(5)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataCountries)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_Countries_Status");
            });

            modelBuilder.Entity<RefdataIndustrystd>(entity =>
            {
                entity.HasKey(e => e.IndustryStd)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_industrystd");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_industrystd_status");

                entity.HasIndex(e => new { e.IndustryStd, e.IndustryStdDesc, e.CreatedDate, e.StatusId })
                    .HasName("IDX_IndustryStd");

                entity.Property(e => e.IndustryStd)
                    .HasColumnType("varchar(6)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.IndustryStdDesc)
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataIndustrystd)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_industrystd_status");
            });

            modelBuilder.Entity<RefdataLegalentity>(entity =>
            {
                entity.HasKey(e => e.LegalEntityGuid)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_legalentity");

                entity.HasIndex(e => e.StateId)
                    .HasName("FK_refdata_location_states");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_location_status");

                entity.HasIndex(e => new { e.LegalEntityGuid, e.LocationName, e.Address, e.City, e.StateId, e.ZipCode, e.CreatedUser, e.StatusId, e.CreatedDate, e.LocationUrl, e.LocationPhone })
                    .HasName("IDX_RefData_LegalEntity2");

                entity.Property(e => e.LegalEntityGuid)
                    .HasColumnName("LegalEntityGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Address)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(60)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.LocationName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.LocationPhone)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.LocationUrl)
                    .HasColumnName("LocationURL")
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateId)
                    .HasColumnName("StateID")
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.ZipCode)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.RefdataLegalentity)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_refdata_location_states");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataLegalentity)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_location_status");
            });

            modelBuilder.Entity<RefdataOperationtype>(entity =>
            {
                entity.HasKey(e => e.OperationTypeId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_operationtype");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_operationtype_status");

                entity.HasIndex(e => new { e.OperationTypeId, e.OperationTypeName, e.StatusId, e.CreatedDate })
                    .HasName("IDX_RefData_OperationType");

                entity.Property(e => e.OperationTypeId)
                    .HasColumnName("OperationTypeID")
                    .HasColumnType("varchar(7)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.OperationTypeName)
                    .HasColumnType("varchar(60)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataOperationtype)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_operationtype_status");
            });

            modelBuilder.Entity<RefdataOrganization>(entity =>
            {
                entity.HasKey(e => e.OrganizationGuid)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_organization");

                entity.HasIndex(e => e.LegalEntityGuid)
                    .HasName("FK_refdata_organization_legalentity");

                entity.HasIndex(e => e.StateId)
                    .HasName("FK_refdata_organization_states");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_organization_status");

                entity.HasIndex(e => new { e.OrganizationGuid, e.OrganizationName, e.Address, e.City, e.StateId, e.ZipCode, e.CreatedDate, e.StatusId, e.CreatedUser, e.OrganizationInternalCode, e.OrganizationInternalId, e.LegalEntityGuid })
                    .HasName("IDX_RefData_Organization");

                entity.Property(e => e.OrganizationGuid)
                    .HasColumnName("OrganizationGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Address)
                    .HasColumnType("varchar(75)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.City)
                    .HasColumnType("varchar(60)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.LegalEntityGuid)
                    .HasColumnName("LegalEntityGUID")
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.OrganizationInternalCode)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.OrganizationInternalId)
                    .HasColumnName("OrganizationInternalID")
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.OrganizationName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateId)
                    .HasColumnName("StateID")
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.ZipCode)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.LegalEntityGu)
                    .WithMany(p => p.RefdataOrganization)
                    .HasForeignKey(d => d.LegalEntityGuid)
                    .HasConstraintName("FK_refdata_organization_legalentity");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.RefdataOrganization)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_refdata_organization_states");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataOrganization)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_organization_status");
            });

            modelBuilder.Entity<RefdataPlatformparams>(entity =>
            {
                entity.HasKey(e => e.PlatformParamsId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_platformparams");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_platformparams_status");

                entity.HasIndex(e => new { e.PlatformParamsId, e.PlatformParamDesc, e.PlatformParamValues, e.CreatedDate, e.StatusId })
                    .HasName("IDX_refdata_platformparams");

                entity.Property(e => e.PlatformParamsId).HasColumnName("PlatformParamsID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.PlatformParamDesc)
                    .HasColumnType("varchar(70)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.PlatformParamValues)
                    .HasColumnType("varchar(35)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataPlatformparams)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_platformparams_status");
            });

            modelBuilder.Entity<RefdataPlatformparamstodataattributes>(entity =>
            {
                entity.HasKey(e => e.PlatformParamsToDataAttributeId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_platformparamstodataattributes");

                entity.HasIndex(e => e.DataAttributeId)
                    .HasName("FK_refdata_platformparamstodataattributes_dataattributes");

                entity.HasIndex(e => e.PlatformParamsId)
                    .HasName("FK_refdata_platformparamstodataattributes_platformparams");

                entity.HasIndex(e => e.RegisteredApp)
                    .HasName("FK_refdata_platformparamstodataattributes_registeredapp");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_platformparamstodataattributes_status");

                entity.HasIndex(e => new { e.PlatformParamsToDataAttributeId, e.PlatformParamsId, e.DataAttributeId, e.CreatedDate, e.StatusId, e.RegisteredApp })
                    .HasName("IDX_refdata_platformparamstodataattributes");

                entity.Property(e => e.PlatformParamsToDataAttributeId).HasColumnName("PlatformParamsToDataAttributeID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.DataAttributeId).HasColumnName("DataAttributeID");

                entity.Property(e => e.PlatformParamsId).HasColumnName("PlatformParamsID");

                entity.Property(e => e.RegisteredApp)
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.DataAttribute)
                    .WithMany(p => p.RefdataPlatformparamstodataattributes)
                    .HasForeignKey(d => d.DataAttributeId)
                    .HasConstraintName("FK_refdata_platformparamstodataattributes_dataattributes");

                entity.HasOne(d => d.PlatformParams)
                    .WithMany(p => p.RefdataPlatformparamstodataattributes)
                    .HasForeignKey(d => d.PlatformParamsId)
                    .HasConstraintName("FK_refdata_platformparamstodataattributes_platformparams");

                entity.HasOne(d => d.RegisteredAppNavigation)
                    .WithMany(p => p.RefdataPlatformparamstodataattributes)
                    .HasForeignKey(d => d.RegisteredApp)
                    .HasConstraintName("FK_refdata_platformparamstodataattributes_registeredapp");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataPlatformparamstodataattributes)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_platformparamstodataattributes_status");
            });

            modelBuilder.Entity<RefdataSensitivityflag>(entity =>
            {
                entity.HasKey(e => e.SensitiveFlagId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_sensitivityflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_sensitivityflag_status");

                entity.HasIndex(e => new { e.SensitiveFlagId, e.SensitiveFlagDesc, e.StatusId, e.CreatedDate })
                    .HasName("IDX_RefData_SensitivityFlag");

                entity.Property(e => e.SensitiveFlagId).HasColumnName("SensitiveFlagID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.SensitiveFlagDesc)
                    .HasColumnType("varchar(30)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataSensitivityflag)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_sensitivityflag_status");
            });

            modelBuilder.Entity<RefdataStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_status");

                entity.HasIndex(e => new { e.StatusId, e.StatusDescription, e.CreatedDate, e.CreatedUser })
                    .HasName("IDX_RefData_Status");

                entity.Property(e => e.StatusId).HasColumnName("StatusID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusDescription)
                    .IsRequired()
                    .HasColumnType("varchar(45)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");
            });

            modelBuilder.Entity<RefdataTimezones>(entity =>
            {
                entity.HasKey(e => e.TimeZoneValue)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_timezones");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_TimeZones_Status");

                entity.HasIndex(e => new { e.TimeZoneValue, e.TimeZoneDesc, e.CreatedDate, e.StatusId })
                    .HasName("IDX_RefData_TimeZones");

                entity.Property(e => e.TimeZoneValue)
                    .HasColumnType("varchar(3)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.TimeZoneDesc)
                    .HasColumnType("varchar(25)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataTimezones)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_TimeZones_Status");
            });

            modelBuilder.Entity<RefdataUsstates>(entity =>
            {
                entity.HasKey(e => e.StateId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_usstates");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_USStates_Status");

                entity.HasIndex(e => new { e.StateId, e.StateDescription, e.Lattitude, e.Longitude, e.CreatedDate, e.StatusId, e.CreatedUser })
                    .HasName("IDX_RefData_USStates");

                entity.Property(e => e.StateId)
                    .HasColumnName("StateID")
                    .HasColumnType("varchar(2)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Lattitude)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Longitude)
                    .HasColumnType("varchar(12)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StateDescription)
                    .HasColumnType("varchar(65)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataUsstates)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_USStates_Status");
            });

            modelBuilder.Entity<RefdataVendor>(entity =>
            {
                entity.HasKey(e => e.VendorId)
                    .HasName("PRIMARY");

                entity.ToTable("refdata_vendor");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_refdata_vendors_status");

                entity.HasIndex(e => new { e.VendorId, e.VendorName, e.StatusId, e.VendorGuid, e.CreatedDate, e.CreatedUser })
                    .HasName("IDX_RefData_Vendors");

                entity.Property(e => e.VendorId).HasColumnName("VendorID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.VendorGuid)
                    .HasColumnName("VendorGUID")
                    .HasColumnType("char(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.VendorName)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.RefdataVendor)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_refdata_vendors_status");
            });

            modelBuilder.Entity<TermsCodesetstoapplication>(entity =>
            {
                entity.HasKey(e => e.CodeSetToApplicationId)
                    .HasName("PRIMARY");

                entity.ToTable("terms_codesetstoapplication");

                entity.HasIndex(e => e.ApplicationId)
                    .HasName("FK_terms_codesetstoapplication_Application");

                entity.HasIndex(e => e.CodeSetsId)
                    .HasName("FK_terms_codesetstoapplication_codeset");

                entity.HasIndex(e => e.IndustryStd)
                    .HasName("FK_terms_codesetstoapplication_industrystd");

                entity.HasIndex(e => e.OrganizationId)
                    .HasName("FK_terms_codesetstoapplication_Org");

                entity.HasIndex(e => e.SensitiveFlagId)
                    .HasName("FK_terms_codesetstoapplication_sensitiveflag");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_terms_codesetstoapplication_status");

                entity.HasIndex(e => e.VendorId)
                    .HasName("FK_terms_codesetstoapplication_Vendor");

                entity.HasIndex(e => new { e.CodeSetToApplicationId, e.CodeSetsId, e.Domain, e.IndustryStd, e.SpecificDetails, e.CreatedDate, e.CreatedUser, e.OrganizationId, e.ApplicationId, e.StatusId, e.VendorId, e.SensitiveFlagId })
                    .HasName("IDX_Terms_CodeSetsToApplication");

                entity.Property(e => e.CodeSetToApplicationId).HasColumnName("CodeSetToApplicationID");

                entity.Property(e => e.ApplicationId)
                    .HasColumnName("ApplicationID")
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CodeDesc)
                    .HasColumnType("varchar(129)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CodeSetsId).HasColumnName("CodeSetsID");

                entity.Property(e => e.CodeValue)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.Domain)
                    .HasColumnType("varchar(50)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.IndustryStd)
                    .HasColumnType("varchar(6)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.OrganizationId)
                    .HasColumnName("OrganizationID")
                    .HasColumnType("varchar(38)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.SensitiveFlagId).HasColumnName("SensitiveFlagID");

                entity.Property(e => e.SpecificDetails)
                    .HasColumnType("varchar(99)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.VendorId).HasColumnName("VendorID");

                entity.HasOne(d => d.Application)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.ApplicationId)
                    .HasConstraintName("FK_terms_codesetstoapplication_Application");

                entity.HasOne(d => d.CodeSets)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.CodeSetsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_terms_codesetstoapplication_codeset");

                entity.HasOne(d => d.IndustryStdNavigation)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.IndustryStd)
                    .HasConstraintName("FK_terms_codesetstoapplication_industrystd");

                entity.HasOne(d => d.Organization)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.OrganizationId)
                    .HasConstraintName("FK_terms_codesetstoapplication_Org");

                entity.HasOne(d => d.SensitiveFlag)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.SensitiveFlagId)
                    .HasConstraintName("FK_terms_codesetstoapplication_sensitiveflag");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_terms_codesetstoapplication_status");

                entity.HasOne(d => d.Vendor)
                    .WithMany(p => p.TermsCodesetstoapplication)
                    .HasForeignKey(d => d.VendorId)
                    .HasConstraintName("FK_terms_codesetstoapplication_Vendor");
            });

            modelBuilder.Entity<TermsCodesetstoapplicationvalues>(entity =>
            {
                entity.HasKey(e => e.CodeSetToApplicationValuesId)
                    .HasName("PRIMARY");

                entity.ToTable("terms_codesetstoapplicationvalues");

                entity.HasIndex(e => e.CodeSetToApplicationId)
                    .HasName("FK_terms_codesetstoapplicationvalues_codesettoapp");

                entity.HasIndex(e => e.CodeSetsId)
                    .HasName("FK_terms_codesetstoapplicationvalues_codeset");

                entity.HasIndex(e => e.StatusId)
                    .HasName("FK_terms_codesetstoapplicationvalues_status");

                entity.HasIndex(e => new { e.CodeSetToApplicationValuesId, e.CodeSetToApplicationId, e.CodeSetsId, e.CreatedDate, e.CreatedUser, e.StatusId, e.TermValue, e.TermValueLow, e.TermValueHigh })
                    .HasName("IDX_Terms_CodeSetsToApplicationValues");

                entity.Property(e => e.CodeSetToApplicationValuesId).HasColumnName("CodeSetToApplicationValuesID");

                entity.Property(e => e.CodeSetToApplicationId).HasColumnName("CodeSetToApplicationID");

                entity.Property(e => e.CodeSetsId).HasColumnName("CodeSetsID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("CURRENT_TIMESTAMP");

                entity.Property(e => e.CreatedUser)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.StatusId)
                    .HasColumnName("StatusID")
                    .HasDefaultValueSql("'1'");

                entity.Property(e => e.TermValue)
                    .HasColumnType("varchar(20)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.TermValueHigh)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.Property(e => e.TermValueLow)
                    .HasColumnType("varchar(10)")
                    .HasCharSet("utf8mb4")
                    .HasCollation("utf8mb4_0900_ai_ci");

                entity.HasOne(d => d.CodeSetToApplication)
                    .WithMany(p => p.TermsCodesetstoapplicationvalues)
                    .HasForeignKey(d => d.CodeSetToApplicationId)
                    .HasConstraintName("FK_terms_codesetstoapplicationvalues_codesettoapp");

                entity.HasOne(d => d.CodeSets)
                    .WithMany(p => p.TermsCodesetstoapplicationvalues)
                    .HasForeignKey(d => d.CodeSetsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_terms_codesetstoapplicationvalues_codeset");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.TermsCodesetstoapplicationvalues)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("FK_terms_codesetstoapplicationvalues_status");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
