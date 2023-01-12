CREATE TABLE auditing_dataplatform (
	DataPlatformID serial NOT NULL,
	DataProcessingDate timestamp DEFAULT NULL,
	CreatedByUser varchar(20) DEFAULT 'NULL',
	Organizaton varchar(38) DEFAULT 'NULL',
	Application varchar(38) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	RecCount int DEFAULT NULL,
	Component varchar(20) DEFAULT 'NULL',
	ActionName varchar(20) DEFAULT 'NULL',
	DurationToRun int DEFAULT NULL,
	ActivityDetail varchar(75) DEFAULT 'NULL',
	PRIMARY KEY (DataPlatformID)
);
CREATE TABLE auditing_datarequest (
	DataRequestID serial NOT NULL,
	DataRequestDate timestamp DEFAULT NULL,
	CreatedByUser varchar(20) DEFAULT 'NULL',
	Organizaton varchar(38) DEFAULT 'NULL',
	Application varchar(38) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	RecCount int DEFAULT NULL,
	RecordDataRequest varchar(400) DEFAULT 'NULL',
	PRIMARY KEY (DataRequestID)
);
CREATE TABLE dataexisting_ababanking (
	ABABankingID serial NOT NULL,
	RoutingNumber varchar(9) DEFAULT 'NULL',
	TelegraphicName varchar(20) DEFAULT 'NULL',
	CustomerName varchar(36) DEFAULT 'NULL',
	City varchar(20) DEFAULT 'NULL',
	"State" varchar(2) DEFAULT 'NULL',
	ZipCode varchar(5) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (ABABankingID)
);
CREATE TABLE dataexisting_areacode (
	AreaCodeID serial NOT NULL,
	AreaCodeValue varchar(3) NOT NULL,
	TimeZone varchar(3) DEFAULT 'NULL',
	StateCode varchar(2) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (AreaCodeID)
);
CREATE TABLE dataexisting_areacodeintl (
	IDDCode varchar(5) NOT NULL,
	CountryID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (IDDCode)
);
CREATE TABLE dataexisting_companies (
	CompaniesID serial NOT NULL,
	CompanyName varchar(79) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (CompaniesID)
);
CREATE TABLE dataexisting_namefirst (
	FirstNameID serial NOT NULL,
	FirstName varchar(39) DEFAULT 'NULL',
	Gender varchar(1) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (FirstNameID)
);
CREATE TABLE dataexisting_namelast (
	LastNameID serial NOT NULL,
	LastName varchar(69) DEFAULT 'NULL',
	StatusID int DEFAULT 1 NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (LastNameID)
);
CREATE TABLE dataexisting_upccodes (
	UPCCodeID serial NOT NULL,
	UPCCodeName varchar(15) DEFAULT 'NULL',
	UPCProductName varchar(150) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (UPCCodeID)
);
CREATE TABLE dataexisting_zipcodeintl (
	ZipCodeIntnlID serial NOT NULL,
	ZipCode char(10) NOT NULL,
	ZipCodeType varchar(15) DEFAULT 'NULL',
	City varchar(75) DEFAULT 'NULL',
	Country int DEFAULT NULL,
	Lattitude varchar(10) DEFAULT 'NULL',
	Longitude varchar(10) DEFAULT 'NULL',
	"Location" varchar(99) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (ZipCodeIntnlID)
);
CREATE TABLE dataexisting_zipcodeus (
	ZipCodeID serial NOT NULL,
	ZipCode char(5) NOT NULL,
	ZipCodeType varchar(15) DEFAULT 'NULL',
	City varchar(75) DEFAULT 'NULL',
	"State" varchar(2) DEFAULT 'NULL',
	Lattitude varchar(10) DEFAULT 'NULL',
	Longitude varchar(10) DEFAULT 'NULL',
	"Location" varchar(99) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (ZipCodeID)
);
CREATE TABLE datagenerated_accountnumbers (
	AccountNumbersID serial NOT NULL,
	AccountNumberValue varchar(20) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	CreatedUser varchar(20) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	RegisteredApp char(38) DEFAULT 'NULL',
	DataGenTypeID int DEFAULT NULL,
	PRIMARY KEY (AccountNumbersID)
);
CREATE TABLE datagenerated_addresses (
	AddressID serial NOT NULL,
	AddressStreet varchar(99) DEFAULT 'NULL',
	AddressStreet2 varchar(59) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	DataGenTypeID int DEFAULT NULL,
	PRIMARY KEY (AddressID)
);
CREATE TABLE datagenerated_bankaccount (
	BankAccountsID serial NOT NULL,
	BankAccountValue varchar(17) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	DataGenTypeID int DEFAULT NULL,
	PRIMARY KEY (BankAccountsID)
);
CREATE TABLE datagenerated_creditcard (
	CreditCardID serial NOT NULL,
	CreditCardNumber varchar(20) DEFAULT 'NULL',
	CreditCardName varchar(20) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	DataGenTypeID int DEFAULT NULL,
	PRIMARY KEY (CreditCardID)
);
CREATE TABLE datagenerated_dateofbirth (
	DateofBirthsID serial NOT NULL,
	DateOfBirth varchar(12) DEFAULT 'NULL',
	DateOfBirthDate date DEFAULT NULL,
	Age int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (DateofBirthsID)
);
CREATE TABLE datagenerated_driverslicenses (
	DriversLicensesID serial NOT NULL,
	DLN varchar(25) DEFAULT 'NULL',
	StateCode varchar(2) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	DataGenTypeID int DEFAULT NULL,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (DriversLicensesID)
);
CREATE TABLE datagenerated_ein (
	EINID serial NOT NULL,
	EINValue varchar(10) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (EINID)
);
CREATE TABLE datagenerated_phonenumber (
	PhoneNumberID serial NOT NULL,
	PhoneNumberValue varchar(8) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (PhoneNumberID)
);
CREATE TABLE datagenerated_phonenumbersintl (
	PhoneNumberIntlID serial NOT NULL,
	PhoneNumberValue varchar(12) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CountryId int DEFAULT NULL,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (PhoneNumberIntlID)
);
CREATE TABLE datagenerated_socialsecuritynumber (
	SocialSecurityNumberID serial NOT NULL,
	SocialSecurityNumberValue varchar(11) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (SocialSecurityNumberID)
);
CREATE TABLE datagenerated_useridentities (
	UserIdentitiesID serial NOT NULL,
	UserIdentityValue varchar(20) DEFAULT 'NULL',
	UserDomain varchar(20) DEFAULT 'NULL',
	AdditionalAttributes varchar(40) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp char(38) DEFAULT 'NULL',
	DataGenTypeID int DEFAULT NULL,
	PRIMARY KEY (UserIdentitiesID)
);
CREATE TABLE datamodel_datatables (
	TableName varchar(64) NOT NULL,
	TableInformation varchar(249) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	PRIMARY KEY (TableName)
);
CREATE TABLE datamodel_domain (
	DomainName varchar(64) NOT NULL,
	DomainInformation varchar(249) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	PRIMARY KEY (DomainName)
);
CREATE TABLE datastructure_address (
	CompleteAddressID serial NOT NULL,
	Address1 varchar(99) DEFAULT 'NULL',
	City varchar(70) DEFAULT 'NULL',
	StateID varchar(2) DEFAULT 'NULL',
	ZipCode varchar(10) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (CompleteAddressID)
);
CREATE TABLE datastructure_bankaccount (
	DataBuiltBankAccountsID serial NOT NULL,
	BankAccountNumber varchar(12) DEFAULT 'NULL',
	BankAccountName varchar(75) DEFAULT 'NULL',
	BankRoutingID varchar(9) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (DataBuiltBankAccountsID)
);
CREATE TABLE datastructure_corporations (
	DataBuiltCorporationID serial NOT NULL,
	CorporationName varchar(99) DEFAULT 'NULL',
	Address1 varchar(99) DEFAULT 'NULL',
	City varchar(70) DEFAULT 'NULL',
	StateID varchar(2) DEFAULT 'NULL',
	ZipCode varchar(10) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (DataBuiltCorporationID)
);
CREATE TABLE datastructure_names (
	DataBuiltNamesID serial NOT NULL,
	CompleteName varchar(100) DEFAULT 'NULL',
	Gender varchar(1) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (DataBuiltNamesID)
);
CREATE TABLE datastructure_persondemographics (
	PersonDemographicsID serial NOT NULL,
	DLN varchar(25) DEFAULT 'NULL',
	DLNState varchar(2) DEFAULT 'NULL',
	SSN varchar(11) DEFAULT 'NULL',
	DOBValue varchar(12) DEFAULT 'NULL',
	DOBDate date DEFAULT NULL,
	Age int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (PersonDemographicsID)
);
CREATE TABLE datastructure_phonenumbers (
	DataBuiltPhoneNumbersID serial NOT NULL,
	AreaCode varchar(3) DEFAULT 'NULL',
	PhoneNumber varchar(8) DEFAULT 'NULL',
	CompletePhoneNumber varchar(14) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (DataBuiltPhoneNumbersID)
);
CREATE TABLE datastructure_phonenumbersintl (
	DataBuiltPhoneNumbersIntlID serial NOT NULL,
	AreaCode varchar(3) DEFAULT 'NULL',
	PhoneNumber varchar(8) DEFAULT 'NULL',
	CompletePhoneNumber varchar(14) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (DataBuiltPhoneNumbersIntlID)
);
CREATE TABLE datastructure_products (
	DatabuiltProductsID serial NOT NULL,
	ProductID varchar(20) DEFAULT 'NULL',
	ProductName varchar(99) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (DatabuiltProductsID)
);
CREATE TABLE impl_application (
	AppGUID char(38) NOT NULL,
	ApplicationCustomCode varchar(15) DEFAULT 'NULL',
	ApplicationDesc varchar(50) DEFAULT 'NULL',
	CreatedUser varchar(20) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	VendorID int DEFAULT NULL,
	PRIMARY KEY (AppGUID)
);
CREATE TABLE impl_codesets (
	ImplCodeSetID serial NOT NULL,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	OrganizationID varchar(38) DEFAULT 'NULL',
	ApplicationID varchar(38) DEFAULT 'NULL',
	IndustryStd varchar(6) DEFAULT 'NULL',
	FieldMapping varchar(40) DEFAULT 'NULL',
	SensitivityFlagID int DEFAULT NULL,
	ExternalTableID varchar(20) DEFAULT 'NULL',
	ExternalNotes varchar(149) DEFAULT 'NULL',
	ExternalLink varchar(99) DEFAULT 'NULL',
	PRIMARY KEY (ImplCodeSetID)
);
CREATE TABLE impl_codesetscrossmaps (
	CodeSetCrossMapID serial NOT NULL,
	CodeSetsID bigint NOT NULL,
	CodeSetToApplicationID bigint DEFAULT NULL,
	TerminologyStdTo int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	TransformCodeValue varchar(40) DEFAULT 'NULL',
	TransformCodeDesc varchar(129) DEFAULT 'NULL',
	PRIMARY KEY (CodeSetCrossMapID)
);
CREATE TABLE impl_codesetstoapplication (
	CodeSetToApplicationID serial NOT NULL,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	OrganizationID varchar(38) DEFAULT 'NULL',
	ApplicationID varchar(38) DEFAULT 'NULL',
	CodeValue varchar(20) DEFAULT 'NULL',
	CodeDesc varchar(129) DEFAULT 'NULL',
	FormalName varchar(45) DEFAULT 'NULL',
	Address varchar(45) DEFAULT 'NULL',
	CityStateZip varchar(99) DEFAULT 'NULL',
	PhoneNumber varchar(20) DEFAULT 'NULL',
	OtherField1 varchar(49) DEFAULT 'NULL',
	OtherField2 varchar(49) DEFAULT 'NULL',
	TermLow varchar(25) DEFAULT 'NULL',
	TermHigh varchar(25) DEFAULT 'NULL',
	PRIMARY KEY (CodeSetToApplicationID)
);
CREATE TABLE impl_codesetstomsgtype (
	CodeSetToMsgTypeID serial NOT NULL,
	CodeSetsID bigint DEFAULT NULL,
	MsgType varchar(75) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	CreatedUser varchar(20) DEFAULT 'NULL',
	AppGUID char(38) DEFAULT 'NULL',
	OrgGUID char(38) DEFAULT 'NULL',
	PRIMARY KEY (CodeSetToMsgTypeID)
);
CREATE TABLE impl_legalentities (
	LegalEntityGUID char(38) NOT NULL,
	LocationName varchar(50) DEFAULT 'NULL',
	Address varchar(75) DEFAULT 'NULL',
	City varchar(60) DEFAULT 'NULL',
	StateID varchar(2) DEFAULT 'NULL',
	ZipCode varchar(12) DEFAULT 'NULL',
	CreatedUser varchar(20) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp() NOT NULL,
	LocationURL varchar(99) DEFAULT 'NULL',
	LocationPhone varchar(12) DEFAULT 'NULL',
	PRIMARY KEY (LegalEntityGUID)
);
CREATE TABLE impl_organization (
	OrganizationGUID char(38) NOT NULL,
	OrganizationInternalCode varchar(10) DEFAULT 'NULL',
	OrganizationInternalID varchar(10) DEFAULT 'NULL',
	OrganizationName varchar(50) DEFAULT 'NULL',
	Address varchar(75) DEFAULT 'NULL',
	City varchar(60) DEFAULT 'NULL',
	StateID varchar(2) DEFAULT 'NULL',
	ZipCode varchar(12) DEFAULT 'NULL',
	CreatedUser varchar(20) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp() NOT NULL,
	LegalEntityGUID varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (OrganizationGUID)
);
CREATE TABLE impl_rulesets (
	RuleID serial NOT NULL,
	RuleName varchar(65) DEFAULT 'NULL',
	CreatedUser varchar(20) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	ExpirationDate timestamp DEFAULT NULL,
	PRIMARY KEY (RuleID)
);
CREATE TABLE impl_rulesetsdefinitions (
	RulesetDefinitionsID char(38) NOT NULL,
	RulesetDefinitionName varchar(50) DEFAULT 'NULL',
	RuleSetID bigint DEFAULT NULL,
	StepOrderID int DEFAULT NULL,
	OperationTypeID varchar(7) DEFAULT 'NULL',
	RulesetDefValue char(40) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	EffectiveDate timestamp DEFAULT NULL,
	ApplicationID varchar(38) DEFAULT 'NULL',
	TermDate timestamp DEFAULT NULL,
	DataAttributeID int DEFAULT NULL,
	PRIMARY KEY (RulesetDefinitionsID)
);
CREATE TABLE platform_appsettings_general (
	AppSettingsID serial NOT NULL,
	AppSettingName varchar(50) DEFAULT 'NULL',
	AppSettingValue varchar(199) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	DefaultDataGenerationApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (AppSettingsID)
);
CREATE TABLE platform_config_datagen (
	DataGenConfigID serial NOT NULL,
	DataTypeGenConfigName varchar(25) DEFAULT 'NULL',
	DataAttributeID int DEFAULT NULL,
	RunQuantity int DEFAULT NULL,
	MinuteInterval int DEFAULT NULL,
	DataGenTypeID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	ApplicationID char(38) DEFAULT 'NULL',
	PRIMARY KEY (DataGenConfigID)
);
CREATE TABLE platform_dataattributes (
	PlatformDataAttributesID serial NOT NULL,
	DataAttributeName varchar(50) DEFAULT 'NULL',
	SensitivityFlagID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	PlatformDataAttributeGUID char(38) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PRIMARY KEY (PlatformDataAttributesID)
);
CREATE TABLE platform_datastructures (
	PlatformDataStructuresID serial NOT NULL,
	DataStructureName varchar(50) DEFAULT 'NULL',
	SensitivityFlagID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	PlatformDataStructuresGUID char(38) DEFAULT 'NULL',
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (PlatformDataStructuresID)
);
CREATE TABLE platform_datastructurestodataattributes (
	PlatformDataStructuresToDataAttributesID serial NOT NULL,
	PlatformDataStructuresID int DEFAULT NULL,
	CompositeDataStructureName varchar(50) DEFAULT 'NULL',
	SensitivityFlagID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	PlatformDataStructuresToDataAttributesGUID char(38) DEFAULT 'NULL',
	RegisteredApp char(38) DEFAULT 'NULL',
	PlatformDataAttributesID int DEFAULT NULL,
	PRIMARY KEY (PlatformDataStructuresToDataAttributesID)
);
CREATE TABLE refdata_codeset (
	CodeSetsID serial NOT NULL,
	CodeSetName varchar(50) DEFAULT 'NULL',
	IndustryStd varchar(6) DEFAULT 'NULL',
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT current_timestamp(),
	CreatedUser varchar(20) DEFAULT 'NULL',
	CodesetGUID char(38) DEFAULT 'NULL',
	FieldMapping varchar(40) DEFAULT 'NULL',
	SensitivityFlagID int DEFAULT NULL,
	ExternalTableID varchar(20) DEFAULT 'NULL',
	ExternalNotes varchar(149) DEFAULT 'NULL',
	ExternalLink varchar(99) DEFAULT 'NULL',
	PRIMARY KEY (CodeSetsID)
);
CREATE TABLE refdata_countries (
	CountryID serial NOT NULL,
	IDD varchar(5) DEFAULT 'NULL',
	CountryName varchar(59) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (CountryID)
);
CREATE TABLE refdata_datagentypes (
	DataGenTypeID serial NOT NULL,
	DataGenTypeDescription varchar(65) DEFAULT 'NULL',
	Definition varchar(255) DEFAULT 'NULL',
	DataAttributeID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	PRIMARY KEY (DataGenTypeID)
);
CREATE TABLE refdata_industrystd (
	IndustryStd varchar(6) NOT NULL,
	IndustryStdDesc varchar(30) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (IndustryStd)
);
CREATE TABLE refdata_industrystd_datatypes (
	DataTypesToIndustryID serial NOT NULL,
	IndustryStd varchar(6) NOT NULL,
	DataTypeName varchar(10) DEFAULT 'NULL',
	DataTypeNameDesc varchar(75) DEFAULT 'NULL',
	DataTypeSubFields varchar(249) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (DataTypesToIndustryID)
);
CREATE TABLE refdata_industrystd_fields (
	FieldsToIndustryID serial NOT NULL,
	MessageFieldNumber varchar(14) DEFAULT 'NULL',
	MessageFieldName varchar(154) DEFAULT 'NULL',
	FieldLength varchar(10) DEFAULT 'NULL',
	DataType varchar(7) DEFAULT 'NULL',
	MessageSegment varchar(3) DEFAULT 'NULL',
	SegmentFieldOrder varchar(8) DEFAULT 'NULL',
	Vrsn varchar(7) DEFAULT 'NULL',
	IndustryStd varchar(7) DEFAULT 'NULL',
	SensitivityFlagID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (FieldsToIndustryID)
);
CREATE TABLE refdata_industrystd_segments (
	SegmentToIndustryID serial NOT NULL,
	IndustryStd varchar(6) NOT NULL,
	IndustryStdDesc varchar(30) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	SegmentName varchar(10) DEFAULT 'NULL',
	SegmentNameDesc varchar(129) DEFAULT 'NULL',
	PRIMARY KEY (SegmentToIndustryID)
);
CREATE TABLE refdata_operationtype (
	OperationTypeID varchar(7) NOT NULL,
	OperationTypeName varchar(60) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (OperationTypeID)
);
CREATE TABLE refdata_platformparams (
	PlatformParamsID serial NOT NULL,
	PlatformParamValues varchar(35) DEFAULT 'NULL',
	PlatformParamDesc varchar(70) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (PlatformParamsID)
);
CREATE TABLE refdata_platformparamstodataattributes (
	PlatformParamsToDataAttributeID serial NOT NULL,
	PlatformParamsID int DEFAULT NULL,
	DataAttributeID int DEFAULT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38) DEFAULT 'NULL',
	PRIMARY KEY (PlatformParamsToDataAttributeID)
);
CREATE TABLE refdata_sensitivityflag (
	SensitiveFlagID serial NOT NULL,
	SensitiveFlagDesc varchar(30) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (SensitiveFlagID)
);
CREATE TABLE refdata_status (
	StatusID serial NOT NULL,
	StatusDescription varchar(45) NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	CreatedUser varchar(20) DEFAULT 'NULL',
	PRIMARY KEY (StatusID)
);
CREATE TABLE refdata_terminologystd (
	TerminologyStdID serial NOT NULL,
	TerminologyStd varchar(25) NOT NULL,
	TerminologyStdVersion varchar(10) NOT NULL,
	TerminologyStdDesc varchar(129) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (TerminologyStdID)
);
CREATE TABLE refdata_timezones (
	TimeZoneValue varchar(3) NOT NULL,
	TimeZoneDesc varchar(25) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	PRIMARY KEY (TimeZoneValue)
);
CREATE TABLE refdata_usstates (
	StateID varchar(2) NOT NULL,
	StateDescription varchar(65) DEFAULT 'NULL',
	Lattitude varchar(12) DEFAULT 'NULL',
	Longitude varchar(12) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	PRIMARY KEY (StateID)
);
CREATE TABLE refdata_vendor (
	VendorID serial NOT NULL,
	VendorName varchar(50) DEFAULT 'NULL',
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CreatedUser varchar(20) DEFAULT 'NULL',
	VendorGUID char(38) DEFAULT 'NULL',
	PRIMARY KEY (VendorID)
);
CREATE TABLE terms_codeset_hl7v2 (
	TermCodeSetID serial NOT NULL,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp DEFAULT current_timestamp(),
	StatusID int DEFAULT 1,
	CodeValue varchar(20) DEFAULT 'NULL',
	CodeDesc varchar(129) DEFAULT 'NULL',
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
	SAUI varchar(50) DEFAULT 'NULL',
	SCUI varchar(100) DEFAULT 'NULL',
	SDUI varchar(100) DEFAULT 'NULL',
	SAB varchar(20) NOT NULL,
	TTY varchar(20) NOT NULL,
	CODE varchar(100) NOT NULL,
	STR varchar(3000) NOT NULL,
	SRL varchar(25) NOT NULL,
	SUPPRESS char(1) NOT NULL,
	CVF varchar(25) DEFAULT 'NULL'
);
ALTER TABLE auditing_dataplatform
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE auditing_datarequest
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_ababanking
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_ababanking
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (StateCode) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (TimeZone) 
	REFERENCES refdata_timezones (TimeZoneValue);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (CountryID) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_companies
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_companies
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_namefirst
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_namefirst
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_namelast
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_namelast
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_upccodes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_upccodes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (Country) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_zipcodeus
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE dataexisting_zipcodeus
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);


ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);


ALTER TABLE datagenerated_dateofbirth
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_dateofbirth
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (StateCode) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);


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
	ADD FOREIGN KEY (CountryId) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_socialsecuritynumber
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_socialsecuritynumber
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);


ALTER TABLE datastructure_address
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_address
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_bankaccount
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_bankaccount
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_corporations
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_corporations
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);


ALTER TABLE datastructure_names
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_names
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_persondemographics
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_persondemographics
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_products
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES impl_application (AppGUID);

ALTER TABLE datastructure_products
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE impl_application
	ADD FOREIGN KEY (VendorID) 
	REFERENCES refdata_vendor (VendorID);

ALTER TABLE impl_application
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


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

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);


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

ALTER TABLE impl_rulesetsdefinitions
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


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

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


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


