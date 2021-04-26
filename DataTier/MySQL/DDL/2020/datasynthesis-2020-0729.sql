create schema if not exists datasynthesis collate utf8mb4_0900_ai_ci;

create table if not exists refdata_operationtype
(
	OperationTypeID varchar(7) not null
		primary key,
	OperationTypeName varchar(60) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null
);

create index IX_OperationType
	on refdata_operationtype (OperationTypeID, OperationTypeName, StatusID, CreatedDate);

create table if not exists refdata_sensitivityflag
(
	SensitiveFlagID smallint auto_increment
		primary key,
	SensitiveFlagDesc varchar(30) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null
);

create index IX_SensitivityFlag
	on refdata_sensitivityflag (SensitiveFlagID, SensitiveFlagDesc, StatusID, CreatedDate);

create table if not exists refdata_status
(
	StatusID smallint auto_increment
		primary key,
	StatusDescription varchar(45) not null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null
);

create table if not exists data_namefirst
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
	on data_namefirst (FirstNameID, FirstName, Gender, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists data_namelast
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
	on data_namelast (LastNameID, LastName, StatusID, CreatedDate, CreatedUser, RegisteredApp);

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
	constraint FK_databuilt_address_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_databuilt_completeaddress
	on databuilt_address (CompleteAddressID, Address1, City, StateID, ZipCode, CreatedDate, StatusID);

create table if not exists databuilt_names
(
	DataBuiltNamesID bigint auto_increment
		primary key,
	CompleteName varchar(100) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint FK_databuilt_completenames_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_databuilt_names_databuiltnamesid
	on databuilt_names (DataBuiltNamesID, CompleteName, CreatedDate, StatusID);

create table if not exists databuilt_phonenumbers
(
	DataBuiltPhoneNumbersID bigint auto_increment
		primary key,
	AreaCode varchar(3) null,
	PhoneNumber varchar(8) null,
	CompletePhoneNumber varchar(14) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	constraint IDX_databuilt_phonenumbers_status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_databuilt_phonenumbers_status
		foreign key (StatusID) references refdata_status (StatusID)
);

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
	AccountNumberValue varchar(17) null,
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

create table if not exists datagenerated_bankaccounts
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
	on datagenerated_bankaccounts (BankAccountsID, BankAccountValue, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_creditcards
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
	on datagenerated_creditcards (CreditCardID, CreditCardNumber, CreditCardName, CreatedDate, StatusID, CreatedUser, RegisteredApp);

create table if not exists datagenerated_dateofbirths
(
	DateofBirthsID bigint auto_increment
		primary key,
	DateOfBirth varchar(12) null,
	DateOfBirthDate varchar(10) null,
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
	on datagenerated_dateofbirths (DateofBirthsID, DateOfBirth, DateOfBirthDate, Age, CreatedDate, StatusID, CreatedUser, RegisteredApp);

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

create table if not exists datagenerated_phonenumbers
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
	on datagenerated_phonenumbers (PhoneNumberID, PhoneNumberValue, RegisteredApp, CreatedUser, CreatedDate, StatusID);

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

create table if not exists map_delimiteddatamapdetailtocodesets
(
	DelimitedDataMapToCodesetsDataMappingDetailID bigint auto_increment
		primary key,
	DelimitedDataMapDetailID bigint null,
	CodesetsID smallint null,
	FieldNumber varchar(25) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_map_delimiteddatamapdetailtocodesets_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_DelimitedDataMapDetailToCodesets
	on map_delimiteddatamapdetailtocodesets (DelimitedDataMapToCodesetsDataMappingDetailID, DelimitedDataMapDetailID, CodesetsID, FieldNumber, CreatedDate, StatusID, CreatedUser);

create table if not exists map_delimiteddatamapdetailtodataattributes
(
	DelimitedDataMapToCoreMetadataDataMappingDetailID bigint auto_increment
		primary key,
	DelimitedDataMapDetailID bigint null,
	DataAttributesID smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_map_delimiteddatamapdetailtodataattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_DelimitedDataMapDetailToDataAttributes
	on map_delimiteddatamapdetailtodataattributes (DelimitedDataMapToCoreMetadataDataMappingDetailID, DelimitedDataMapDetailID, DataAttributesID, CreatedUser, StatusID, CreatedDate);

create table if not exists map_delimiteddatamapdetailtovendordatamodel
(
	DelimitedDataMapToVendorDataMappingDetailID bigint auto_increment
		primary key,
	DelimitedDataMapDetailID bigint null,
	VendorDataMappingDetailID bigint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_map_delimiteddatamapdetailtovendordatamodel_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_DelimitedDataMapToVendorDataMappingDetail
	on map_delimiteddatamapdetailtovendordatamodel (DelimitedDataMapToVendorDataMappingDetailID, DelimitedDataMapDetailID, VendorDataMappingDetailID, CreatedDate, StatusID, CreatedUser);

create table if not exists map_delimiteddatamappingdetail
(
	DelimitedDataMappingDetailID bigint auto_increment
		primary key,
	DelimitedDataMappingHeaderID smallint null,
	SourceDataMapDesc varchar(75) null,
	ApplicationID int null,
	DBName varchar(20) null,
	TableName varchar(30) null,
	FieldNumber varchar(10) null,
	FieldName varchar(50) null,
	FieldDataType varchar(10) null,
	FieldLength varchar(10) null,
	CompeleteFieldName varchar(102) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	DelimitedDataMappingDetailGUID char(38) null,
	constraint FK_delimiteddatamappingdetail_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IDX_delimiteddatamappingdetail
	on map_delimiteddatamappingdetail (DelimitedDataMappingDetailID, DelimitedDataMappingHeaderID, SourceDataMapDesc, ApplicationID, DBName, TableName, FieldNumber, FieldName, FieldDataType, FieldLength, CompeleteFieldName, CreatedDate, StatusID, CreatedUser, DelimitedDataMappingDetailGUID);

create table if not exists map_delimiteddatamappingheader
(
	DelimitedDataMappingHeaderID smallint auto_increment
		primary key,
	VendorTechnologyName varchar(50) null,
	VendorTechnologyDesc varchar(50) null,
	VendorTechnologyInternalCode varchar(10) null,
	VendorID int null,
	ApplicationID int null,
	OrganizationID int null,
	VendorTechnologyVersion varchar(15) null,
	CreatedBy varchar(20) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	DelimitedDataMappingHeaderGUID char(38) null,
	DelimiterCharacter varchar(1) null,
	constraint FK_map_delimiteddatamappingheader
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_DelimitedDataMappingHeader
	on map_delimiteddatamappingheader (DelimitedDataMappingHeaderID, VendorTechnologyName, VendorTechnologyDesc, VendorTechnologyInternalCode, VendorID, ApplicationID, VendorTechnologyVersion, CreatedDate, StatusID, CreatedBy, CreatedUser, OrganizationID, DelimitedDataMappingHeaderGUID);

create table if not exists map_hcinterfacedatamapdetail
(
	HCInterfaceDataMapDetailID bigint auto_increment
		primary key,
	InterfaceDataMapHeaderID bigint null,
	SourceApplicationID smallint null,
	Vrsn varchar(7) null,
	MsgSegment varchar(3) null,
	SegmentFieldOrder varchar(8) null,
	MsgFieldNumber varchar(7) null,
	MsgFieldName varchar(154) null,
	MsgFieldLength varchar(10) null,
	DataType varchar(5) null,
	SensitivityFlagID smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	HCInterfaceDataMapDetailIGUID char(38) null,
	constraint FK_map_hcinterfacedatamapdetail
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_HCInterfaceDataMapDetail
	on map_hcinterfacedatamapdetail (HCInterfaceDataMapDetailID, InterfaceDataMapHeaderID, SourceApplicationID, Vrsn, MsgSegment, SegmentFieldOrder, MsgFieldNumber, MsgFieldName, MsgFieldLength, DataType, SensitivityFlagID, CreatedDate, StatusID, CreatedUser, HCInterfaceDataMapDetailIGUID);

create table if not exists map_hcinterfacedatamapdetailtocodesets
(
	HCInterfaceDataMapToCodesetsDataMappingDetailID bigint auto_increment
		primary key,
	HCInterfaceDataMapDetailID bigint null,
	CodesetsID smallint null,
	FieldNumber varchar(25) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP not null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_map_hcinterfacedatamapdetailtocodesets
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_HCInterfaceDataMapDetailToCodesets
	on map_hcinterfacedatamapdetailtocodesets (HCInterfaceDataMapToCodesetsDataMappingDetailID, HCInterfaceDataMapDetailID, CodesetsID, FieldNumber, CreatedDate, StatusID, CreatedUser);

create table if not exists map_hcinterfacedatamapdetailtodataattributes
(
	HCInterfaceDataMapToCoreMetadataDataMappingDetailID bigint auto_increment
		primary key,
	HCInterfaceDataMapDetailID bigint null,
	DataAttributesID smallint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_map_hcinterfacedatamapdetailtodataattributes
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_HCInterfaceDataMapDetailToDataAttributes
	on map_hcinterfacedatamapdetailtodataattributes (HCInterfaceDataMapToCoreMetadataDataMappingDetailID, HCInterfaceDataMapDetailID, DataAttributesID, CreatedUser, StatusID, CreatedDate);

create table if not exists map_hcinterfacedatamapdetailtovendordatamodel
(
	HCInterfaceDataMapToVendorDataMappingDetailID bigint auto_increment
		primary key,
	HCInterfaceDataMapDetailID bigint null,
	VendorDataMappingDetailID bigint null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	constraint FK_map_hcinterfacedatamapdetailtovendordatamodel_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_HCInterfaceDataMapToVendorDataMappingDetail
	on map_hcinterfacedatamapdetailtovendordatamodel (HCInterfaceDataMapToVendorDataMappingDetailID, HCInterfaceDataMapDetailID, VendorDataMappingDetailID, CreatedDate, StatusID, CreatedUser);

create table if not exists map_hcinterfacedatamapheader
(
	HCInterfaceDataMapHeaderID bigint auto_increment
		primary key,
	InterfaceName varchar(50) null,
	InterfaceDesc varchar(50) null,
	VendorID int null,
	ApplicationID int null,
	MessageType varchar(11) null,
	MessageTrigger varchar(10) null,
	MessageVersion varchar(7) null,
	OrganizationID int null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	HCInterfaceDataMapHeaderGUID char(38) null,
	IndustryStd varchar(6) null,
	constraint FK_map_hcinterfacedatamapheader_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_HCInterfaceDataMapHeader
	on map_hcinterfacedatamapheader (HCInterfaceDataMapHeaderID, InterfaceName, InterfaceDesc, VendorID, ApplicationID, MessageType, MessageTrigger, MessageVersion, OrganizationID, CreatedDate, CreatedUser, StatusID, HCInterfaceDataMapHeaderGUID, IndustryStd);

create table if not exists map_vendordatamappingdetail
(
	VendorDataMappingDetailID bigint auto_increment
		primary key,
	VendorDataMappingHeaderID smallint null,
	SourceDataMapDesc varchar(75) null,
	ApplicationID int null,
	DBName varchar(20) null,
	TableName varchar(30) null,
	FieldNumber varchar(10) null,
	FieldName varchar(50) null,
	FieldDataType varchar(10) null,
	FieldLength varchar(10) null,
	CompeleteFieldName varchar(102) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	VendorDataMappingDetailGUID char(38) null,
	constraint FK_map_vendordatamappingdetail_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_VendorDataMappingDetail
	on map_vendordatamappingdetail (VendorDataMappingDetailID, SourceDataMapDesc, ApplicationID, DBName, TableName, FieldNumber, FieldName, FieldDataType, FieldLength, CompeleteFieldName, CreatedDate, StatusID, VendorDataMappingHeaderID, CreatedUser, VendorDataMappingDetailGUID);

create table if not exists map_vendordatamappingdetailtocodesets
(
	VendorDataMappingDetailToCodesetsID bigint auto_increment
		primary key,
	VendorDataMappingDetailID bigint null,
	CodesetsID smallint null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null,
	constraint FK_map_vendordatamappingdetailtocodesets_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_VendorDataMappingDetailToCodesets
	on map_vendordatamappingdetailtocodesets (VendorDataMappingDetailToCodesetsID, CodesetsID, VendorDataMappingDetailID, StatusID, CreatedUser, CreatedDate);

create table if not exists map_vendordatamappingdetailtodataattributes
(
	VendorDataMappingDetailToDataAttributesID bigint auto_increment
		primary key,
	VendorDataMappingDetailID bigint null,
	DataAttributesID smallint null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	CreatedUser varchar(20) null,
	constraint FK_map_vendordatamappingdetailtodataattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_VendorDataMappingDetailToDataAttributes
	on map_vendordatamappingdetailtodataattributes (VendorDataMappingDetailToDataAttributesID, VendorDataMappingDetailID, DataAttributesID, StatusID, CreatedUser, CreatedDate);

create table if not exists map_vendordatamappingheader
(
	VendorDataMappingHeaderID smallint auto_increment
		primary key,
	VendorTechnologyName varchar(50) null,
	VendorTechnologyDesc varchar(50) null,
	VendorTechnologyInternalMnemonic varchar(10) null,
	VendorID int null,
	ApplicationID int null,
	OrganizationID int null,
	VendorTechnologyVersion varchar(15) null,
	CreatedBy varchar(20) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	CreatedUser varchar(20) null,
	VendorDataMappingHeaderGUID char(38) null,
	constraint vendordatamappingheader_FK
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_VendorDataMappingHeader
	on map_vendordatamappingheader (VendorDataMappingHeaderID, VendorTechnologyName, VendorTechnologyDesc, VendorTechnologyInternalMnemonic, VendorID, ApplicationID, VendorTechnologyVersion, CreatedDate, StatusID, CreatedBy, CreatedUser, OrganizationID, VendorDataMappingHeaderGUID);

create table if not exists platform_appsetting
(
	AppSettingsID smallint auto_increment
		primary key,
	AppSettingName varchar(50) null,
	AppSettingValue varchar(199) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	RegisteredApp char(38) null,
	constraint FK_refdata_appsettings_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_RefDataAppSettings
	on platform_appsetting (AppSettingsID, AppSettingName, AppSettingValue, CreatedDate, StatusID, RegisteredApp);

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
	constraint FK_platformdataattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

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
	ApplicationID bigint null,
	constraint FK_platform_datagenconfig_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformDataGenConfig
	on platform_datagenconfig (DataGenConfigID, DataAttributeID, DataTypeGenConfigName, RunQuantity, MinuteInterval, SpecialInstructions, CreatedDate, CreatedUser, StatusID, ApplicationID);

create table if not exists platform_datarequest
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
	on platform_datarequest (DataRequestID, DataRequestDate, CreatedByUser, Organizaton, Application, StatusID, CreatedDate);

create table if not exists platform_datarequestdetail
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
		foreign key (DataRequestID) references platform_datarequest (DataRequestID)
);

create index IDX_platform_datarequestdetail
	on platform_datarequestdetail (DataRequestDetailID, DataRequestID, DataAttributeID, RecCount, RecordFormatDetails, StatusID, CreatedDate);

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
	RegisteredApp char(38) null,
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
	RegisteredApp char(38) null,
	PlatformDataAttributesID smallint null,
	constraint FK_platform_datastructurestodataattributes_dataattributes
		foreign key (PlatformDataAttributesID) references platform_dataattributes (PlatformDataAttributesID),
	constraint FK_platform_datastructurestodataattributes_datastructure
		foreign key (PlatformDataStructuresID) references platform_datastructures (PlatformDataStructuresID),
	constraint FK_platform_datastructurestodataattributes_sensitivityflag
		foreign key (SensitivityFlagID) references refdata_sensitivityflag (SensitiveFlagID),
	constraint FK_platform_datastructurestodataattributes_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformDataStructuresToDataAttributes
	on platform_datastructurestodataattributes (PlatformDataStructuresToDataAttributesID, PlatformDataStructuresToDataAttributesGUID, PlatformDataStructuresID, CompositeDataStructureName, SensitivityFlagID, CreatedDate, StatusID, CreatedUser, RegisteredApp, PlatformDataAttributesID);

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
	constraint FK_platform_rulesetsdefinitions_operationtype
		foreign key (OperationTypeID) references refdata_operationtype (OperationTypeID),
	constraint FK_platform_rulesetsdefinitions_ruleset
		foreign key (RuleSetID) references platform_rulesets (RuleID),
	constraint FK_platform_rulesetsdefinitions_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_PlatformRulesetsDefinitions
	on platform_rulesetsdefinitions (RulesetDefinitionsID, RuleSetID, RulesetDefinitionName, StepOrderID, OperationTypeID, RulesetDefValue, CreatedDate, EffectiveDate, StatusID);

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
	AddressFormatTypeId smallint null,
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

create table if not exists datagenerated_areacodeintl
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
	on datagenerated_areacodeintl (IDDCode, CountryID, CreatedDate, StatusID, RegisteredApp);

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

create table if not exists datagenerated_areacode
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
	on datagenerated_areacode (AreaCodeValue, TimeZone, StateCode, CreatedDate, StatusID, CreatedUser, RegisteredApp);

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
	OrganizationID bigint auto_increment
		primary key,
	OrganizationName varchar(50) null,
	Address varchar(75) null,
	City varchar(60) null,
	StateID varchar(2) null,
	ZipCode varchar(12) null,
	CreatedUser varchar(20) null,
	StatusID smallint default 1 null,
	CreatedDate timestamp default CURRENT_TIMESTAMP not null,
	OrganizationInternalID varchar(10) null,
	OrganizationInternalCode varchar(10) null,
	OrganizationGUID char(38) null,
	constraint FK_refdata_organization_states
		foreign key (StateID) references refdata_usstates (StateID),
	constraint FK_refdata_organization_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_RefData_Organization
	on refdata_organization (OrganizationID, OrganizationName, Address, City, StateID, ZipCode, CreatedDate, StatusID, CreatedUser, OrganizationInternalCode, OrganizationInternalID, OrganizationGUID);

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
	ApplicationID bigint auto_increment
		primary key,
	ApplicationCustomCode varchar(15) null,
	ApplicationDesc varchar(50) null,
	CreatedUser varchar(20) null,
	CreatedDate timestamp default CURRENT_TIMESTAMP null,
	StatusID smallint default 1 null,
	AppGUID char(38) null,
	VendorID int null,
	constraint FK_refdata_application_status
		foreign key (StatusID) references refdata_status (StatusID),
	constraint FK_refdata_application_vendors
		foreign key (VendorID) references refdata_vendor (VendorID)
);

create index IX_RefData_Application
	on refdata_application (ApplicationID, ApplicationCustomCode, ApplicationDesc, AppGUID, CreatedUser, CreatedDate, StatusID, VendorID);

create definer = root@`%` trigger refdata_application_uuid
	before insert
	on refdata_application
	for each row
	BEGIN
  IF new.AppGUID IS NULL THEN
    SET new.AppGUID = UUID();
  END IF;
END;

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
	OrganizationID bigint null,
	ApplicationID bigint null,
	VendorID smallint null,
	constraint FK_terms_codesetstoapplication_status
		foreign key (StatusID) references refdata_status (StatusID)
);

create index IX_Terms_CodeSetsToApplication
	on terms_codesetstoapplication (CodeSetToApplicationID, CodeSetsID, Domain, IndustryStd, SpecificDetails, CreatedDate, CreatedUser, MessageTrigger, OrganizationID, ApplicationID, StatusID, VendorID);

