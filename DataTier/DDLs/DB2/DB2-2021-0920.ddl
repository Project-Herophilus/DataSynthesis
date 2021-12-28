CREATE TABLE auditing_dataplatform (
	DataPlatformID bigint NOT NULL,
	DataProcessingDate timestamp,
	CreatedByUser varchar(20),
	Organizaton varchar(38),
	Application varchar(38),
	StatusID smallint,
	CreatedDate timestamp,
	RecCount int,
	Component varchar(20),
	ActionName varchar(20),
	DurationToRun int,
	ActivityDetail varchar(75),
	PRIMARY KEY (DataPlatformID)
);
CREATE TABLE auditing_datarequest (
	DataRequestID bigint NOT NULL,
	DataRequestDate timestamp,
	CreatedByUser varchar(20),
	Organizaton varchar(38),
	Application varchar(38),
	StatusID smallint,
	CreatedDate timestamp,
	RecCount int,
	RecordDataRequest varchar(400),
	PRIMARY KEY (DataRequestID)
);
CREATE TABLE dataexisting_ababanking (
	ABABankingID bigint NOT NULL,
	RoutingNumber varchar(9),
	TelegraphicName varchar(20),
	CustomerName varchar(36),
	City varchar(20),
	State varchar(2),
	ZipCode varchar(5),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (ABABankingID)
);
CREATE TABLE dataexisting_areacode (
	AreaCodeID bigint NOT NULL,
	AreaCodeValue varchar(3) NOT NULL,
	TimeZone varchar(3),
	StateCode varchar(2),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (AreaCodeID)
);
CREATE TABLE dataexisting_areacodeintl (
	IDDCode varchar(5) NOT NULL,
	CountryID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp char(38),
	PRIMARY KEY (IDDCode)
);
CREATE TABLE dataexisting_companies (
	CompaniesID bigint NOT NULL,
	CompanyName varchar(79),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (CompaniesID)
);
CREATE TABLE dataexisting_namefirst (
	FirstNameID bigint NOT NULL,
	FirstName varchar(39),
	Gender varchar(1),
	StatusID smallint,
	CreatedDate timestamp,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (FirstNameID)
);
CREATE TABLE dataexisting_namelast (
	LastNameID bigint NOT NULL,
	LastName varchar(69),
	StatusID smallint NOT NULL,
	CreatedDate timestamp,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (LastNameID)
);
CREATE TABLE dataexisting_upccodes (
	UPCCodeID bigint NOT NULL,
	UPCCodeName varchar(15),
	UPCProductName varchar(150),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp char(38),
	PRIMARY KEY (UPCCodeID)
);
CREATE TABLE dataexisting_zipcodeintl (
	ZipCodeIntnlID int NOT NULL,
	ZipCode char(10) NOT NULL,
	ZipCodeType varchar(15),
	City varchar(75),
	Country smallint,
	Lattitude varchar(10),
	Longitude varchar(10),
	Location varchar(99),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (ZipCodeIntnlID)
);
CREATE TABLE dataexisting_zipcodeus (
	ZipCodeID bigint NOT NULL,
	ZipCode char(5) NOT NULL,
	ZipCodeType varchar(15),
	City varchar(75),
	State varchar(2),
	Lattitude varchar(10),
	Longitude varchar(10),
	Location varchar(99),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (ZipCodeID)
);
CREATE TABLE datagenerated_accountnumbers (
	AccountNumbersID bigint NOT NULL,
	AccountNumberValue varchar(20),
	CreatedDate timestamp,
	CreatedUser varchar(20),
	StatusID smallint,
	RegisteredApp char(38),
	DataGenTypeID smallint,
	PRIMARY KEY (AccountNumbersID)
);
CREATE TABLE datagenerated_addresses (
	AddressID bigint NOT NULL,
	AddressStreet varchar(99),
	AddressStreet2 varchar(59),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	DataGenTypeID smallint,
	PRIMARY KEY (AddressID)
);
CREATE TABLE datagenerated_bankaccount (
	BankAccountsID bigint NOT NULL,
	BankAccountValue varchar(17),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	DataGenTypeID smallint,
	PRIMARY KEY (BankAccountsID)
);
CREATE TABLE datagenerated_creditcard (
	CreditCardID bigint NOT NULL,
	CreditCardNumber varchar(20),
	CreditCardName varchar(20),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	DataGenTypeID smallint,
	PRIMARY KEY (CreditCardID)
);
CREATE TABLE datagenerated_dateofbirth (
	DateofBirthsID bigint NOT NULL,
	DateOfBirth varchar(12),
	DateOfBirthDate date,
	Age int,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (DateofBirthsID)
);
CREATE TABLE datagenerated_driverslicenses (
	DriversLicensesID bigint NOT NULL,
	DLN varchar(25),
	StateCode varchar(2),
	CreatedDate timestamp,
	StatusID smallint,
	DataGenTypeID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (DriversLicensesID)
);
CREATE TABLE datagenerated_ein (
	EINID bigint NOT NULL,
	EINValue varchar(10),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (EINID)
);
CREATE TABLE datagenerated_phonenumber (
	PhoneNumberID bigint NOT NULL,
	PhoneNumberValue varchar(8),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (PhoneNumberID)
);
CREATE TABLE datagenerated_phonenumbersintl (
	PhoneNumberIntlID bigint NOT NULL,
	PhoneNumberValue varchar(12),
	CreatedDate timestamp,
	StatusID smallint,
	CountryId smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (PhoneNumberIntlID)
);
CREATE TABLE datagenerated_socialsecuritynumber (
	SocialSecurityNumberID bigint NOT NULL,
	SocialSecurityNumberValue varchar(11),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (SocialSecurityNumberID)
);
CREATE TABLE datagenerated_useridentities (
	UserIdentitiesID bigint NOT NULL,
	UserIdentityValue varchar(20),
	UserDomain varchar(20),
	AdditionalAttributes varchar(40),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp char(38),
	DataGenTypeID smallint,
	PRIMARY KEY (UserIdentitiesID)
);
CREATE TABLE datamodel_datatables (
	TableName varchar(64) NOT NULL,
	TableInformation varchar(249),
	StatusID smallint,
	CreatedDate timestamp,
	PRIMARY KEY (TableName)
);
CREATE TABLE datamodel_domain (
	DomainName varchar(64) NOT NULL,
	DomainInformation varchar(249),
	StatusID smallint,
	CreatedDate timestamp,
	PRIMARY KEY (DomainName)
);
CREATE TABLE datastructure_address (
	CompleteAddressID bigint NOT NULL,
	Address1 varchar(99),
	City varchar(70),
	StateID varchar(2),
	ZipCode varchar(10),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (CompleteAddressID)
);
CREATE TABLE datastructure_bankaccount (
	DataBuiltBankAccountsID bigint NOT NULL,
	BankAccountNumber varchar(12),
	BankAccountName varchar(75),
	BankRoutingID varchar(9),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltBankAccountsID)
);
CREATE TABLE datastructure_corporations (
	DataBuiltCorporationID bigint NOT NULL,
	CorporationName varchar(99),
	Address1 varchar(99),
	City varchar(70),
	StateID varchar(2),
	ZipCode varchar(10),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltCorporationID)
);
CREATE TABLE datastructure_names (
	DataBuiltNamesID bigint NOT NULL,
	CompleteName varchar(100),
	Gender varchar(1),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltNamesID)
);
CREATE TABLE datastructure_persondemographics (
	PersonDemographicsID bigint NOT NULL,
	DLN varchar(25),
	DLNState varchar(2),
	SSN varchar(11),
	DOBValue varchar(12),
	DOBDate date,
	Age int,
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (PersonDemographicsID)
);
CREATE TABLE datastructure_phonenumbers (
	DataBuiltPhoneNumbersID bigint NOT NULL,
	AreaCode varchar(3),
	PhoneNumber varchar(8),
	CompletePhoneNumber varchar(14),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltPhoneNumbersID)
);
CREATE TABLE datastructure_phonenumbersintl (
	DataBuiltPhoneNumbersIntlID bigint NOT NULL,
	AreaCode varchar(3),
	PhoneNumber varchar(8),
	CompletePhoneNumber varchar(14),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltPhoneNumbersIntlID)
);
CREATE TABLE datastructure_products (
	DatabuiltProductsID bigint NOT NULL,
	ProductID varchar(20),
	ProductName varchar(99),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (DatabuiltProductsID)
);
CREATE TABLE impl_application (
	AppGUID char(38) NOT NULL,
	ApplicationCustomCode varchar(15),
	ApplicationDesc varchar(50),
	CreatedUser varchar(20),
	CreatedDate timestamp,
	StatusID smallint,
	VendorID int,
	PRIMARY KEY (AppGUID)
);
CREATE TABLE impl_codesets (
	ImplCodeSetID bigint NOT NULL,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp,
	StatusID smallint,
	OrganizationID varchar(38),
	ApplicationID varchar(38),
	IndustryStd varchar(6),
	FieldMapping varchar(40),
	SensitivityFlagID smallint,
	ExternalTableID varchar(20),
	ExternalNotes varchar(149),
	ExternalLink varchar(99),
	PRIMARY KEY (ImplCodeSetID)
);
CREATE TABLE impl_codesetscrossmaps (
	CodeSetCrossMapID bigint NOT NULL,
	CodeSetsID bigint NOT NULL,
	CodeSetToApplicationID bigint,
	TerminologyStdTo smallint,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	TransformCodeValue varchar(40),
	TransformCodeDesc varchar(129),
	PRIMARY KEY (CodeSetCrossMapID)
);
CREATE TABLE impl_codesetstoapplication (
	CodeSetToApplicationID bigint NOT NULL,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp,
	StatusID smallint,
	OrganizationID varchar(38),
	ApplicationID varchar(38),
	CodeValue varchar(20),
	CodeDesc varchar(129),
	FormalName varchar(45),
	Address varchar(45),
	CityStateZip varchar(99),
	PhoneNumber varchar(20),
	OtherField1 varchar(49),
	OtherField2 varchar(49),
	TermLow varchar(25),
	TermHigh varchar(25),
	PRIMARY KEY (CodeSetToApplicationID)
);
CREATE TABLE impl_codesetstomsgtype (
	CodeSetToMsgTypeID bigint NOT NULL,
	CodeSetsID bigint,
	MsgType varchar(75),
	StatusID smallint,
	CreatedDate timestamp,
	CreatedUser varchar(20),
	AppGUID char(38),
	OrgGUID char(38),
	PRIMARY KEY (CodeSetToMsgTypeID)
);
CREATE TABLE impl_legalentities (
	LegalEntityGUID char(38) NOT NULL,
	LocationName varchar(50),
	Address varchar(75),
	City varchar(60),
	StateID varchar(2),
	ZipCode varchar(12),
	CreatedUser varchar(20),
	StatusID smallint,
	CreatedDate timestamp NOT NULL,
	LocationURL varchar(99),
	LocationPhone varchar(12),
	PRIMARY KEY (LegalEntityGUID)
);
CREATE TABLE impl_organization (
	OrganizationGUID char(38) NOT NULL,
	OrganizationInternalCode varchar(10),
	OrganizationInternalID varchar(10),
	OrganizationName varchar(50),
	Address varchar(75),
	City varchar(60),
	StateID varchar(2),
	ZipCode varchar(12),
	CreatedUser varchar(20),
	StatusID smallint,
	CreatedDate timestamp NOT NULL,
	LegalEntityGUID varchar(38),
	PRIMARY KEY (OrganizationGUID)
);
CREATE TABLE impl_rulesets (
	RuleID bigint NOT NULL,
	RuleName varchar(65),
	CreatedUser varchar(20),
	CreatedDate timestamp,
	StatusID smallint,
	ExpirationDate timestamp,
	PRIMARY KEY (RuleID)
);
CREATE TABLE impl_rulesetsdefinitions (
	RulesetDefinitionsID char(38) NOT NULL,
	RulesetDefinitionName varchar(50),
	RuleSetID bigint,
	StepOrderID smallint,
	OperationTypeID varchar(7),
	RulesetDefValue char(40),
	StatusID smallint,
	CreatedDate timestamp,
	EffectiveDate timestamp,
	ApplicationID varchar(38),
	TermDate timestamp,
	DataAttributeID smallint,
	PRIMARY KEY (RulesetDefinitionsID)
);
CREATE TABLE platform_appsettings_general (
	AppSettingsID smallint NOT NULL,
	AppSettingName varchar(50),
	AppSettingValue varchar(199),
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	DefaultDataGenerationApp varchar(38),
	PRIMARY KEY (AppSettingsID)
);
CREATE TABLE platform_config_datagen (
	DataGenConfigID smallint NOT NULL,
	DataTypeGenConfigName varchar(25),
	DataAttributeID smallint,
	RunQuantity int,
	MinuteInterval smallint,
	DataGenTypeID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	ApplicationID char(38),
	PRIMARY KEY (DataGenConfigID)
);
CREATE TABLE platform_dataattributes (
	PlatformDataAttributesID smallint NOT NULL,
	DataAttributeName varchar(50),
	SensitivityFlagID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	PlatformDataAttributeGUID char(38),
	RegisteredApp char(38),
	PRIMARY KEY (PlatformDataAttributesID)
);
CREATE TABLE platform_datastructures (
	PlatformDataStructuresID smallint NOT NULL,
	DataStructureName varchar(50),
	SensitivityFlagID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	PlatformDataStructuresGUID char(38),
	RegisteredApp varchar(38),
	PRIMARY KEY (PlatformDataStructuresID)
);
CREATE TABLE platform_datastructurestodataattributes (
	PlatformDataStructuresToDataAttributesID smallint NOT NULL,
	PlatformDataStructuresID smallint,
	CompositeDataStructureName varchar(50),
	SensitivityFlagID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	PlatformDataStructuresToDataAttributesGUID char(38),
	RegisteredApp char(38),
	PlatformDataAttributesID smallint,
	PRIMARY KEY (PlatformDataStructuresToDataAttributesID)
);
CREATE TABLE refdata_codeset (
	CodeSetsID bigint NOT NULL,
	CodeSetName varchar(50),
	IndustryStd varchar(6),
	StatusID smallint,
	CreatedDate timestamp,
	CreatedUser varchar(20),
	CodesetGUID char(38),
	FieldMapping varchar(40),
	SensitivityFlagID smallint,
	ExternalTableID varchar(20),
	ExternalNotes varchar(149),
	ExternalLink varchar(99),
	PRIMARY KEY (CodeSetsID)
);
CREATE TABLE refdata_countries (
	CountryID smallint NOT NULL,
	IDD varchar(5),
	CountryName varchar(59),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (CountryID)
);
CREATE TABLE refdata_datagentypes (
	DataGenTypeID smallint NOT NULL,
	DataGenTypeDescription varchar(65),
	Definition varchar(255),
	DataAttributeID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	PRIMARY KEY (DataGenTypeID)
);
CREATE TABLE refdata_industrystd (
	IndustryStd varchar(6) NOT NULL,
	IndustryStdDesc varchar(30),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (IndustryStd)
);
CREATE TABLE refdata_industrystd_datatypes (
	DataTypesToIndustryID int NOT NULL,
	IndustryStd varchar(6) NOT NULL,
	DataTypeName varchar(10),
	DataTypeNameDesc varchar(75),
	DataTypeSubFields varchar(249),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (DataTypesToIndustryID)
);
CREATE TABLE refdata_industrystd_fields (
	FieldsToIndustryID int NOT NULL,
	MessageFieldNumber varchar(14),
	MessageFieldName varchar(154),
	FieldLength varchar(10),
	DataType varchar(7),
	MessageSegment varchar(3),
	SegmentFieldOrder varchar(8),
	Vrsn varchar(7),
	IndustryStd varchar(7),
	SensitivityFlagID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (FieldsToIndustryID)
);
CREATE TABLE refdata_industrystd_segments (
	SegmentToIndustryID int NOT NULL,
	IndustryStd varchar(6) NOT NULL,
	IndustryStdDesc varchar(30),
	CreatedDate timestamp,
	StatusID smallint,
	SegmentName varchar(10),
	SegmentNameDesc varchar(129),
	PRIMARY KEY (SegmentToIndustryID)
);
CREATE TABLE refdata_operationtype (
	OperationTypeID varchar(7) NOT NULL,
	OperationTypeName varchar(60),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (OperationTypeID)
);
CREATE TABLE refdata_platformparams (
	PlatformParamsID smallint NOT NULL,
	PlatformParamValues varchar(35),
	PlatformParamDesc varchar(70),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (PlatformParamsID)
);
CREATE TABLE refdata_platformparamstodataattributes (
	PlatformParamsToDataAttributeID bigint NOT NULL,
	PlatformParamsID smallint,
	DataAttributeID smallint,
	CreatedDate timestamp,
	StatusID smallint,
	RegisteredApp varchar(38),
	PRIMARY KEY (PlatformParamsToDataAttributeID)
);
CREATE TABLE refdata_sensitivityflag (
	SensitiveFlagID smallint NOT NULL,
	SensitiveFlagDesc varchar(30),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (SensitiveFlagID)
);
CREATE TABLE refdata_status (
	StatusID smallint NOT NULL,
	StatusDescription varchar(45) NOT NULL,
	CreatedDate timestamp,
	CreatedUser varchar(20),
	PRIMARY KEY (StatusID)
);
CREATE TABLE refdata_terminologystd (
	TerminologyStdID smallint NOT NULL,
	TerminologyStd varchar(25) NOT NULL,
	TerminologyStdVersion varchar(10) NOT NULL,
	TerminologyStdDesc varchar(129),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (TerminologyStdID)
);
CREATE TABLE refdata_timezones (
	TimeZoneValue varchar(3) NOT NULL,
	TimeZoneDesc varchar(25),
	CreatedDate timestamp,
	StatusID smallint,
	PRIMARY KEY (TimeZoneValue)
);
CREATE TABLE refdata_usstates (
	StateID varchar(2) NOT NULL,
	StateDescription varchar(65),
	Lattitude varchar(12),
	Longitude varchar(12),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	PRIMARY KEY (StateID)
);
CREATE TABLE refdata_vendor (
	VendorID int NOT NULL,
	VendorName varchar(50),
	CreatedDate timestamp,
	StatusID smallint,
	CreatedUser varchar(20),
	VendorGUID char(38),
	PRIMARY KEY (VendorID)
);
CREATE TABLE terms_codeset_hl7v2 (
	TermCodeSetID bigint NOT NULL,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp,
	StatusID smallint,
	CodeValue varchar(20),
	CodeDesc varchar(129),
	PRIMARY KEY (TermCodeSetID)
);
CREATE TABLE terms_umls_mrconoso (
	CUI char(8) NOT NULL,
	LAT char(3) NOT NULL,
	TS char(1) NOT NULL,
	LUI varchar(10) NOT NULL,
	STT varchar(3) NOT NULL,
	SUI varchar(10) NOT NULL,
	ISPREF char(1) NOT NULL,
	AUI varchar(9) NOT NULL,
	SAUI varchar(50),
	SCUI varchar(100),
	SDUI varchar(100),
	SAB varchar(20) NOT NULL,
	TTY varchar(20) NOT NULL,
	CODE varchar(100) NOT NULL,
	STR varchar(3000) NOT NULL,
	SRL varchar(25) NOT NULL,
	SUPPRESS char(1) NOT NULL,
	CVF varchar(25)
);
ALTER TABLE auditing_dataplatform
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE auditing_datarequest
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_ababanking
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_ababanking
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (StateCode) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (TimeZone) 
	REFERENCES refdata_timezones (TimeZoneValue);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (CountryID) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_companies
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_companies
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_namefirst
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_namefirst
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_namelast
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_namelast
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_upccodes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_upccodes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (Country) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_zipcodeus
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_zipcodeus
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);


ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_dateofbirth
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_dateofbirth
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (StateCode) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_ein
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_ein
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_phonenumber
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_phonenumber
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (CountryId) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_socialsecuritynumber
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_socialsecuritynumber
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datastructure_address
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_address
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datastructure_bankaccount
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_bankaccount
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datastructure_corporations
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_corporations
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_names
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_names
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_persondemographics
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_persondemographics
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_products
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_products
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE impl_application
	ADD FOREIGN KEY (VendorID) 
	REFERENCES refdata_vendor (VendorID);

ALTER TABLE impl_application
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE impl_codesets
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (OrganizationID) 
	REFERENCES impl_organization (OrganizationGUID);

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);


ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);

ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (TerminologyStdTo) 
	REFERENCES refdata_terminologystd (TerminologyStdID);

ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (CodeSetToApplicationID) 
	REFERENCES impl_codesetstoapplication (CodeSetToApplicationID);

ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (OrganizationID) 
	REFERENCES impl_organization (OrganizationGUID);

ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);


ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);

ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (AppGUID) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (OrgGUID) 
	REFERENCES impl_organization (OrganizationGUID);


ALTER TABLE impl_legalentities
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE impl_legalentities
	ADD FOREIGN KEY (StateID) 
	REFERENCES refdata_usstates (StateID);


ALTER TABLE impl_organization
	ADD FOREIGN KEY (StateID) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE impl_organization
	ADD FOREIGN KEY (LegalEntityGUID) 
	REFERENCES impl_legalentities (LegalEntityGUID);

ALTER TABLE impl_organization
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE impl_rulesets
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE impl_rulesetsdefinitions
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE impl_rulesetsdefinitions
	ADD FOREIGN KEY (OperationTypeID) 
	REFERENCES refdata_operationtype (OperationTypeID);

ALTER TABLE impl_rulesetsdefinitions
	ADD FOREIGN KEY (RuleSetID) 
	REFERENCES impl_rulesets (RuleID);

ALTER TABLE impl_rulesetsdefinitions
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE impl_rulesetsdefinitions
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE platform_appsettings_general
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE platform_appsettings_general
	ADD FOREIGN KEY (DefaultDataGenerationApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE platform_appsettings_general
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE platform_dataattributes
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE platform_dataattributes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE platform_dataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_datastructures
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE platform_datastructures
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE platform_datastructures
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (PlatformDataStructuresID) 
	REFERENCES platform_datastructures (PlatformDataStructuresID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (PlatformDataAttributesID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE refdata_codeset
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE refdata_codeset
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE refdata_codeset
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_countries
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_datagentypes
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE refdata_datagentypes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_industrystd
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_industrystd_datatypes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE refdata_industrystd_datatypes
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);


ALTER TABLE refdata_industrystd_fields
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE refdata_industrystd_fields
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE refdata_industrystd_fields
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_industrystd_segments
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE refdata_industrystd_segments
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);


ALTER TABLE refdata_operationtype
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_platformparams
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (PlatformParamsID) 
	REFERENCES refdata_platformparams (PlatformParamsID);

ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE refdata_sensitivityflag
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_terminologystd
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_timezones
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_usstates
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_vendor
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE terms_codeset_hl7v2
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE terms_codeset_hl7v2
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);


