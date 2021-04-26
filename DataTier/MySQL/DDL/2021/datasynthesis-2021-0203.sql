create table if not exists datamodel_datatables
(
	TableName varchar(64) collate utf8_tolower_ci not null
		primary key,
	TableInformation varchar(249) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null
);

create index IDX_datamodel_datatables
	on datamodel_datatables (TableName, TableInformation, StatusID, CreatedDate);

create table if not exists refdata_status
(
	StatusID smallint auto_increment
		primary key,
	StatusDescription varchar(45) not null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null
);

create table if not exists auditing_datarequest
(
	DataRequestID bigint auto_increment
		primary key,
	DataRequestDate datetime(3) null,
	CreatedByUser varchar(20) null,
	Organizaton bigint null,
	Application bigint null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	constraint FK_platform_datarequest_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_platform_datarequest
	on auditing_datarequest (DataRequestID, DataRequestDate, CreatedByUser, Organizaton, Application, StatusID, CreatedDate);

create table if not exists databuilt_address
(
	CompleteAddressID bigint auto_increment
		primary key,
	Address1 varchar(99) null,
	City varchar(70) null,
	StateID varchar(2) null,
	ZipCode varchar(10) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint FK_databuilt_address_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_databuilt_completeaddress
	on databuilt_address (CompleteAddressID, Address1, City, StateID, ZipCode, CreatedDate, StatusID, RegisteredApp);

create table if not exists databuilt_bankaccount
(
	DataBuiltBankAccountsID bigint auto_increment
		primary key,
	BankAccountNumber varchar(12) null,
	BankAccountName varchar(75) null,
	BankRoutingID varchar(9) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint fk_databuilt_bankAccounts_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_databuilt_bankAccounts
	on databuilt_bankaccount (DataBuiltBankAccountsID, BankAccountName, BankAccountNumber, BankRoutingID, StatusID, CreatedDate, RegisteredApp);

create table if not exists databuilt_corporations
(
	DataBuiltCorporationID bigint auto_increment
		primary key,
	CorporationName varchar(99) null,
	Address1 varchar(99) null,
	City varchar(70) null,
	StateID varchar(2) null,
	ZipCode varchar(10) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint FK_databuilt_corporations_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_databuilt_completeaddress
	on databuilt_corporations (DataBuiltCorporationID, CorporationName, Address1, City, StateID, ZipCode, CreatedDate, StatusID, RegisteredApp);

create table if not exists databuilt_names
(
	DataBuiltNamesID bigint auto_increment
		primary key,
	CompleteName varchar(100) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint FK_databuilt_completenames_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_databuilt_names_databuiltnamesid
	on databuilt_names (DataBuiltNamesID, CompleteName, CreatedDate, StatusID, RegisteredApp);

create table if not exists databuilt_phonenumbers
(
	DataBuiltPhoneNumbersID bigint auto_increment
		primary key,
	AreaCode varchar(3) null,
	PhoneNumber varchar(8) null,
	CompletePhoneNumber varchar(14) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint IDX_databuilt_phonenumbers_status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_databuilt_phonenumbers_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_databuilt_phonenumbers
	on databuilt_phonenumbers (DataBuiltPhoneNumbersID, AreaCode, PhoneNumber, CompletePhoneNumber, StatusID, CreatedDate, RegisteredApp);

create table if not exists databuilt_products
(
	DatabuiltProductsID bigint auto_increment
		primary key,
	ProductID varchar(20) null,
	ProductName varchar(99) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint FK_databuilt_products_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_databuilt_products
	on databuilt_products (DatabuiltProductsID, ProductID, ProductName, CreatedDate, StatusID, RegisteredApp);

create table if not exists dataexisting_ababanking
(
	ABABankingID bigint auto_increment
		primary key,
	RoutingNumber varchar(9) null,
	TelegraphicName varchar(20) null,
	CustomerName varchar(36) null,
	City varchar(20) null,
	State varchar(2) null,
	ZipCode varchar(5) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_ABABanking_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_ABABanking
	on dataexisting_ababanking (ABABankingID, RoutingNumber, TelegraphicName, CustomerName, City, State, ZipCode, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists dataexisting_companies
(
	CompaniesID bigint auto_increment
		primary key,
	CompanyName varchar(79) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_Companies_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_Companies
	on dataexisting_companies (CompaniesID, CompanyName, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists dataexisting_namefirst
(
	FirstNameID bigint auto_increment
		primary key,
	FirstName varchar(39) null,
	Gender varchar(1) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_NameFirst
		unique (FirstName, RegisteredApp),
	constraint FK_NameFirst_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_NameFirst
	on dataexisting_namefirst (FirstNameID, FirstName, Gender, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists dataexisting_namelast
(
	LastNameID bigint auto_increment
		primary key,
	LastName varchar(69) null,
	StatusID smallint default 1 not null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_NameLast
		unique (LastName, RegisteredApp),
	constraint FK_NameLast_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_NameLast
	on dataexisting_namelast (LastNameID, LastName, StatusID, CreatedDate, CreatedUser, RegisteredApp);

create table if not exists dataexisting_upccodes
(
	UPCCodeID bigint auto_increment
		primary key,
	UPCCodeName varchar(15) null,
	UPCProductName varchar(150) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp char(38) null,
	constraint FK_UPCCodes_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_UPCCodes
	on dataexisting_upccodes (UPCCodeID, UPCCodeName, UPCProductName, CreatedDate, StatusID, RegisteredApp);

create table if not exists dataexisting_zipcodeus
(
	ZipCodeID bigint auto_increment
		primary key,
	ZipCode char(5) not null,
	ZipCodeType varchar(15) null,
	City varchar(75) null,
	State varchar(2) null,
	Lattitude varchar(10) null,
	Longitude varchar(10) null,
	Location varchar(99) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_ZipcodeUS_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_dataexisting_zipcodeus
	on dataexisting_zipcodeus (ZipCodeID, ZipCode, ZipCodeType, City, State, Lattitude, Longitude, Location, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_accountnumbers
(
	AccountNumbersID bigint auto_increment
		primary key,
	AccountNumberValue varchar(20) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null,
	StatusID smallint default 1 null,
	RegisteredApp char(38) null,
	constraint IX_Unqiue_AccountNumbers
		unique (AccountNumberValue, RegisteredApp),
	constraint FK_AccountNumbers_Status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_datagenerated_accountnumbers
		foreign key (StatusID) references refdata_status (StatusID)
);

create index FK_datagenerated_accountnumbers_status
	on datagenerated_accountnumbers (StatusID);

create index IX_AccountNumbers
	on datagenerated_accountnumbers (AccountNumbersID, AccountNumberValue, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_bankaccount
(
	BankAccountsID bigint auto_increment
		primary key,
	BankAccountValue varchar(17) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unqiue_BankAccounts
		unique (BankAccountValue, RegisteredApp),
	constraint FK_BankAccounts_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_BankAccounts
	on datagenerated_bankaccount (BankAccountsID, BankAccountValue, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_creditcard
(
	CreditCardID bigint auto_increment
		primary key,
	CreditCardNumber varchar(20) null,
	CreditCardName varchar(10) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_CreditCard_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_CreditCard
	on datagenerated_creditcard (CreditCardID, CreditCardNumber, CreditCardName, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_dateofbirth
(
	DateofBirthsID bigint auto_increment
		primary key,
	DateOfBirth varchar(12) null,
	DateOfBirthDate date null,
	Age int null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_DateOfBirths
		unique (DateOfBirth, DateOfBirthDate, RegisteredApp),
	constraint FK_DateOfBirths_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_DateOfBirths
	on datagenerated_dateofbirth (DateofBirthsID, DateOfBirth, DateOfBirthDate, Age, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_ein
(
	EINID bigint auto_increment
		primary key,
	EINValue varchar(10) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_EIN
		unique (EINValue, RegisteredApp),
	constraint FK_EIN_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_EIN
	on datagenerated_ein (EINID, EINValue, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_phonenumber
(
	PhoneNumberID bigint auto_increment
		primary key,
	PhoneNumberValue varchar(8) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_PhoneNumbers
		unique (PhoneNumberValue, RegisteredApp),
	constraint FK_PhoneNumbers_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PhoneNumbers
	on datagenerated_phonenumber (PhoneNumberID, PhoneNumberValue, RegisteredApp, CreatedUser, CreatedDate, StatusID);

create table if not exists datagenerated_socialsecuritynumber
(
	SocialSecurityNumberID bigint auto_increment
		primary key,
	SocialSecurityNumberValue varchar(11) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_SocialSecurityNumbers
		unique (SocialSecurityNumberValue, RegisteredApp),
	constraint FK_SocialSecurityNumber_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_SocialSecurityNumber
	on datagenerated_socialsecuritynumber (SocialSecurityNumberID, SocialSecurityNumberValue, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_useridentities
(
	UserIdentitiesID bigint auto_increment
		primary key,
	UserIdentityValue varchar(20) null,
	UserDomain varchar(20) null,
	AdditionalAttributes varchar(40) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp char(38) null,
	constraint IX_Unique_UserIdentities
		unique (UserIdentityValue, UserDomain, RegisteredApp),
	constraint FK_UserIdentities_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_UserIdentities
	on datagenerated_useridentities (UserIdentitiesID, UserIdentityValue, UserDomain, CreatedDate, StatusID, AdditionalAttributes, RegisteredApp);

create table if not exists platform_rulesets
(
	RuleID bigint auto_increment
		primary key,
	RuleName varchar(65) null,
	CreatedUser varchar(20) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	ExpirationDate timestamp null,
	constraint FK_platform_rulesets_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformRuleSets
	on platform_rulesets (RuleID, RuleName, CreatedUser, CreatedDate, ExpirationDate, StatusID);

create table if not exists platform_rulesetsattributes
(
	RulesetAttributeID bigint auto_increment
		primary key,
	RuleSetAttributeDesc varchar(75) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP not null,
	StatusID smallint default 1 null,
	constraint FK_platform_rulesetsattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_PlatformRuleSetsAttributes
	on platform_rulesetsattributes (RuleSetAttributeDesc, CreatedDate, StatusID);

create table if not exists refdata_addressformattype
(
	AddressFormatTypeID smallint auto_increment
		primary key,
	AddressFormatTypeDesc varchar(35) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusId smallint default 1 null,
	constraint FK_AddressFormatType_Status
		foreign key (StatusId) references refdata_status (StatusID)
);

create table if not exists datagenerated_addresses
(
	AddressID bigint auto_increment
		primary key,
	AddressStreet varchar(99) null,
	AddressStreet2 varchar(59) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	AddressFormatTypeId smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_Addresses
		unique (AddressStreet, AddressStreet2, RegisteredApp),
	constraint FK_Addresses_AddressFormatType
		foreign key (AddressFormatTypeId) references refdata_addressformattype (AddressFormatTypeID),
	constraint FK_datagenerated_addresses_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_Addresses
	on datagenerated_addresses (AddressID, AddressStreet, AddressStreet2, AddressFormatTypeId, StatusID, CreatedDate, CreatedUser, RegisteredApp);

create index IDX_refdata_addressformattype_AddressFormatTypeID
	on refdata_addressformattype (AddressFormatTypeID, AddressFormatTypeDesc, CreatedDate, StatusId);

create index IX_AddressFormatType
	on refdata_addressformattype (AddressFormatTypeID, AddressFormatTypeDesc, CreatedDate, StatusId);

create table if not exists refdata_codeset
(
	CodeSetsID bigint auto_increment
		primary key,
	CodeSetName varchar(50) null,
	IndustryStd varchar(6) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null,
	CodesetGUID char(38) null,
	FieldMapping varchar(20) null,
	constraint FK_refdata_codesets_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_RefData_CodeSets
	on refdata_codeset (CodeSetsID, CodeSetName, IndustryStd, CreatedDate, StatusID, CreatedUser, CodesetGUID, FieldMapping);

create table if not exists refdata_countries
(
	CountryID smallint auto_increment
		primary key,
	IDD varchar(5) null,
	CountryName varchar(59) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_Countries_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create table if not exists dataexisting_areacodeintl
(
	IDDCode varchar(5) not null
		primary key,
	CountryID smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp char(38) null,
	constraint FK_AreaCodeIntl_Countries
		foreign key (CountryID) references refdata_countries (CountryID),
	constraint FK_AreaCodeIntl_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_AreaCodeIntl
	on dataexisting_areacodeintl (IDDCode, CountryID, CreatedDate, StatusID, RegisteredApp);

create table if not exists dataexisting_zipcodeintl
(
	ZipCodeIntnlID int auto_increment
		primary key,
	ZipCode char(10) not null,
	ZipCodeType varchar(15) null,
	City varchar(75) null,
	Country smallint null,
	Lattitude varchar(10) null,
	Longitude varchar(10) null,
	Location varchar(99) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_ZipcodeIntl_Countries
		foreign key (Country) references refdata_countries (CountryID),
	constraint FK_ZipcodeIntl_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_ZipcodeIntl
	on dataexisting_zipcodeintl (ZipCodeIntnlID, ZipCode, ZipCodeType, Country, City, Lattitude, Longitude, Location, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_phonenumbersintl
(
	PhoneNumberIntlID bigint auto_increment
		primary key,
	PhoneNumberValue varchar(12) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CountryId smallint null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_PhoneNumbersIntl_Country
		foreign key (CountryId) references refdata_countries (CountryID),
	constraint FK_PhoneNumbersIntl_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PhoneNumbersIntl
	on datagenerated_phonenumbersintl (PhoneNumberIntlID, PhoneNumberValue, CountryId, CreatedDate, CreatedUser, StatusID, RegisteredApp);

create index IX_Countries
	on refdata_countries (CountryID, IDD, CountryName, CreatedDate, StatusID);

create table if not exists refdata_industrystd
(
	IndustryStd varchar(6) not null
		primary key,
	IndustryStdDesc varchar(30) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_refdata_industrystd_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_IndustryStd
	on refdata_industrystd (IndustryStd, IndustryStdDesc, CreatedDate, StatusID);

create table if not exists refdata_operationtype
(
	OperationTypeID varchar(7) not null
		primary key,
	OperationTypeName varchar(60) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_refdata_operationtype_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_OperationType
	on refdata_operationtype (OperationTypeID, OperationTypeName, StatusID, CreatedDate);

create table if not exists refdata_sensitivityflag
(
	SensitiveFlagID smallint auto_increment
		primary key,
	SensitiveFlagDesc varchar(30) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_refdata_sensitivityflag_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_SensitivityFlag
	on refdata_sensitivityflag (SensitiveFlagID, SensitiveFlagDesc, StatusID, CreatedDate);

create index IX_RefStatus
	on refdata_status (StatusID, StatusDescription, CreatedDate, CreatedUser);

create table if not exists refdata_timezones
(
	TimeZoneValue varchar(3) not null
		primary key,
	TimeZoneDesc varchar(25) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_TimeZones_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_TimeZones
	on refdata_timezones (TimeZoneValue, TimeZoneDesc, CreatedDate, StatusID);

create table if not exists refdata_usstates
(
	StateID varchar(2) not null
		primary key,
	StateDescription varchar(65) null,
	Lattitude varchar(12) null,
	Longitude varchar(12) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_USStates_Status
		foreign key (StatusID) references refdata_status (StatusID)
);

create table if not exists dataexisting_areacode
(
	AreaCodeID bigint auto_increment
		primary key,
	AreaCodeValue varchar(3) not null,
	TimeZone varchar(3) null,
	StateCode varchar(2) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint FK_AreaCode_Status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_AreaCode_TimeZones
		foreign key (TimeZone) references refdata_timezones (TimeZoneValue),
	constraint FK_AreaCode_USStates
		foreign key (StateCode) references refdata_usstates (StateID)
);

create index IX_AreaCode
	on dataexisting_areacode (AreaCodeValue, TimeZone, StateCode, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_driverslicenses
(
	DriversLicensesID bigint auto_increment
		primary key,
	DLN varchar(25) null,
	StateCode varchar(2) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CompleteDriversLicenseNumber varchar(30) null,
	CreatedUser varchar(20) null,
	RegisteredApp char(38) null,
	constraint IX_Unique_DriversLicenses
		unique (DLN, StateCode, CompleteDriversLicenseNumber, RegisteredApp),
	constraint FK_DriversLicenses_Status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_DriversLicenses_USStates
		foreign key (StateCode) references refdata_usstates (StateID)
);

create index IX_DriversLicenses
	on datagenerated_driverslicenses (DriversLicensesID, CreatedDate, DLN, StateCode, StatusID, CompleteDriversLicenseNumber, CreatedUser, RegisteredApp);

create table if not exists refdata_organization
(
	OrganizationGUID char(38) not null
		primary key,
	OrganizationInternalCode varchar(10) null,
	OrganizationInternalID varchar(10) null,
	OrganizationName varchar(50) null,
	Address varchar(75) null,
	City varchar(60) null,
	StateID varchar(2) null,
	ZipCode varchar(12) null,
	CreatedUser varchar(20) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP not null,
	constraint FK_refdata_organization_states
		foreign key (StateID) references refdata_usstates (StateID),
	constraint FK_refdata_organization_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create table if not exists platform_appsetting
(
	AppSettingsID smallint auto_increment
		primary key,
	AppSettingName varchar(50) null,
	AppSettingValue varchar(199) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp varchar(38) null,
	constraint FK_platform_appsettings_registeredapp
		foreign key (RegisteredApp) references refdata_organization (OrganizationGUID),
	constraint FK_refdata_appsettings_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_RefDataAppSettings
	on platform_appsetting (AppSettingsID, AppSettingName, AppSettingValue, CreatedDate, StatusID, RegisteredApp);

create index IX_RefData_Organization
	on refdata_organization (OrganizationGUID, OrganizationName, Address, City, StateID, ZipCode, CreatedDate, StatusID, CreatedUser, OrganizationInternalCode, OrganizationInternalID);

create definer = root@`%` trigger refdata_organization_uuid
	before insert
	on refdata_organization
	for each row
	BEGIN
  IF new.OrganizationGUID IS NULL THEN
    SET new.OrganizationGUID = UUID();
  END IF;
END;

create index IX_USStates
	on refdata_usstates (StateID, StateDescription, Lattitude, Longitude, CreatedDate, StatusID, CreatedUser);

create table if not exists refdata_vendor
(
	VendorID int auto_increment
		primary key,
	VendorName varchar(50) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	VendorGUID char(38) null,
	constraint FK_refdata_vendors_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create table if not exists refdata_application
(
	AppGUID char(38) not null
		primary key,
	ApplicationCustomCode varchar(15) null,
	ApplicationDesc varchar(50) null,
	CreatedUser varchar(20) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	VendorID int null,
	constraint FK_refdata_application_status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_refdata_application_vendors
		foreign key (VendorID) references refdata_vendor (VendorID)
);

create table if not exists platform_dataattributes
(
	PlatformDataAttributesID smallint auto_increment
		primary key,
	DataAttributeName varchar(50) null,
	SensitivityFlagID smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	PlatformDataAttributeGUID char(38) null,
	RegisteredApp char(38) null,
	constraint FK_platform_dataattributes_registeredapp
		foreign key (RegisteredApp) references refdata_application (AppGUID),
	constraint FK_platformdataattributes_sensitivtyflag
		foreign key (SensitivityFlagID) references refdata_sensitivityflag (SensitiveFlagID),
	constraint FK_platformdataattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create table if not exists auditing_datarequestdetail
(
	DataRequestDetailID bigint auto_increment
		primary key,
	DataRequestID bigint null,
	DataAttributeID smallint null,
	RecCount bigint null,
	RecordFormatDetails varchar(75) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	constraint FK_platform_datarequestdetail
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_platform_datarequestdetail_dataattributes
		foreign key (DataAttributeID) references platform_dataattributes (PlatformDataAttributesID),
	constraint FK_platform_datarequestdetail_datarequest
		foreign key (DataRequestID) references auditing_datarequest (DataRequestID)
);

create index IDX_platform_datarequestdetail
	on auditing_datarequestdetail (DataRequestDetailID, DataRequestID, DataAttributeID, RecCount, RecordFormatDetails, StatusID, CreatedDate);

create index IX_PlatformDataAttributes
	on platform_dataattributes (PlatformDataAttributesID, DataAttributeName, SensitivityFlagID, CreatedDate, StatusID, CreatedUser, PlatformDataAttributeGUID, RegisteredApp);

create table if not exists platform_datagenconfig
(
	DataGenConfigID smallint auto_increment
		primary key,
	DataTypeGenConfigName varchar(25) null,
	DataAttributeID smallint null,
	SpecialInstructions varchar(99) null,
	RunQuantity int null,
	MinuteInterval smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	ApplicationID varchar(38) null,
	constraint FK_platform_datagenconfig_dataattributes
		foreign key (DataAttributeID) references platform_dataattributes (PlatformDataAttributesID),
	constraint FK_platform_datagenconfig_registeredapp
		foreign key (ApplicationID) references refdata_application (AppGUID),
	constraint FK_platform_datagenconfig_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformDataGenConfig
	on platform_datagenconfig (DataGenConfigID, DataAttributeID, DataTypeGenConfigName, RunQuantity, MinuteInterval, SpecialInstructions, CreatedDate, CreatedUser, StatusID, ApplicationID);

create table if not exists platform_datastructures
(
	PlatformDataStructuresID smallint auto_increment
		primary key,
	DataStructureName varchar(50) null,
	SensitivityFlagID smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	PlatformDataStructuresGUID char(38) null,
	RegisteredApp varchar(38) null,
	constraint FK_platform_datastructures__registeredapp
		foreign key (RegisteredApp) references refdata_application (AppGUID),
	constraint FK_platform_datastructures_sensitivityflag
		foreign key (SensitivityFlagID) references refdata_sensitivityflag (SensitiveFlagID),
	constraint FK_platform_datastructures_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformDataStructures
	on platform_datastructures (PlatformDataStructuresID, DataStructureName, SensitivityFlagID, CreatedDate, StatusID, CreatedUser, PlatformDataStructuresGUID, RegisteredApp);

create table if not exists platform_datastructurestodataattributes
(
	PlatformDataStructuresToDataAttributesID smallint auto_increment
		primary key,
	PlatformDataStructuresID smallint null,
	CompositeDataStructureName varchar(50) null,
	SensitivityFlagID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	PlatformDataStructuresToDataAttributesGUID char(38) null,
	RegisteredApp varchar(38) null,
	PlatformDataAttributesID smallint null,
	constraint FK_platform_datastructurestodataattributes_dataattributes
		foreign key (PlatformDataAttributesID) references platform_dataattributes (PlatformDataAttributesID),
	constraint FK_platform_datastructurestodataattributes_datastructure
		foreign key (PlatformDataStructuresID) references platform_datastructures (PlatformDataStructuresID),
	constraint FK_platform_datastructurestodataattributes_registeredapp
		foreign key (RegisteredApp) references refdata_application (AppGUID),
	constraint FK_platform_datastructurestodataattributes_sensitivityflag
		foreign key (SensitivityFlagID) references refdata_sensitivityflag (SensitiveFlagID),
	constraint FK_platform_datastructurestodataattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformDataStructuresToDataAttributes
	on platform_datastructurestodataattributes (PlatformDataStructuresToDataAttributesID, PlatformDataStructuresToDataAttributesGUID, PlatformDataStructuresID, CompositeDataStructureName, SensitivityFlagID, CreatedDate, StatusID, CreatedUser, RegisteredApp, PlatformDataAttributesID);

create table if not exists platform_rulesetsdefinitions
(
	RulesetDefinitionsID char(38) not null
		primary key,
	RulesetDefinitionName varchar(50) null,
	RuleSetID bigint null,
	StepOrderID smallint null,
	OperationTypeID varchar(7) null,
	RulesetDefValue char(40) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	EffectiveDate timestamp null,
	ApplicationID varchar(38) null,
	constraint FK_platform_rulesetsdefinitions_operationtype
		foreign key (OperationTypeID) references refdata_operationtype (OperationTypeID),
	constraint FK_platform_rulesetsdefinitions_registeredapp
		foreign key (ApplicationID) references refdata_application (AppGUID),
	constraint FK_platform_rulesetsdefinitions_ruleset
		foreign key (RuleSetID) references platform_rulesets (RuleID),
	constraint FK_platform_rulesetsdefinitions_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformRulesetsDefinitions
	on platform_rulesetsdefinitions (RulesetDefinitionsID, RuleSetID, RulesetDefinitionName, StepOrderID, OperationTypeID, RulesetDefValue, CreatedDate, EffectiveDate, StatusID, ApplicationID);

create index IX_RefData_Application
	on refdata_application (AppGUID, ApplicationCustomCode, ApplicationDesc, CreatedUser, CreatedDate, StatusID, VendorID);

create definer = root@`%` trigger refdata_application_uuid
	before insert
	on refdata_application
	for each row
	BEGIN
  IF new.AppGUID IS NULL THEN
    SET new.AppGUID = UUID();
  END IF;
END;

create table if not exists refdata_codesetvalues
(
	CodeSetValueID bigint auto_increment
		primary key,
	CodesetID bigint null,
	QtyValue varchar(20) null,
	QtyValueDesc varchar(20) null,
	ApplicationGUID varchar(38) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_refdata_codesetvalues_apps
		foreign key (ApplicationGUID) references refdata_application (AppGUID),
	constraint FK_refdata_codesetvalues_codesets
		foreign key (CodesetID) references refdata_codeset (CodeSetsID),
	constraint FK_refdata_codesetvalues_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_refdata_codesetvalues
	on refdata_codesetvalues (CodeSetValueID, CodesetID, QtyValue, QtyValueDesc, ApplicationGUID, StatusID, CreatedDate);

create index IX_RefData_Vendors
	on refdata_vendor (VendorID, VendorName, StatusID, VendorGUID, CreatedDate, CreatedUser);

create definer = root@`%` trigger refdata_vendors_uuid
	before insert
	on refdata_vendor
	for each row
	BEGIN
  IF new.VendorGUID IS NULL THEN
    SET new.VendorGUID = UUID();
  END IF;
END;

create table if not exists terms_codesetstoapplication
(
	CodeSetToApplicationID bigint auto_increment
		primary key,
	CodeSetsID bigint not null,
	Domain varchar(50) null,
	IndustryStd varchar(6) null,
	SpecificDetails varchar(99) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	MessageTrigger varchar(4) null,
	OrganizationID varchar(38) null,
	ApplicationID varchar(38) null,
	VendorID smallint null,
	constraint FK_terms_codesetstoapplication_Application
		foreign key (ApplicationID) references refdata_application (AppGUID),
	constraint FK_terms_codesetstoapplication_Org
		foreign key (OrganizationID) references refdata_organization (OrganizationGUID),
	constraint FK_terms_codesetstoapplication_industrystd
		foreign key (IndustryStd) references refdata_industrystd (IndustryStd),
	constraint FK_terms_codesetstoapplication_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_Terms_CodeSetsToApplication
	on terms_codesetstoapplication (CodeSetToApplicationID, CodeSetsID, Domain, IndustryStd, SpecificDetails, CreatedDate, CreatedUser, MessageTrigger, OrganizationID, ApplicationID, StatusID, VendorID);

