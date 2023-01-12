CREATE TABLE auditing_dataplatform (
	DataPlatformID bigint NOT NULL,
	DataProcessingDate timestamp,
	CreatedByUser varchar(20),
	Organizaton varchar(38),
	Application varchar(38),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
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
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
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
	"State" varchar(2),
	ZipCode varchar(5),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (ABABankingID)
);
CREATE TABLE dataexisting_areacode (
	AreaCodeID bigint NOT NULL,
	AreaCodeValue varchar(3) NOT NULL,
	TimeZone varchar(3),
	StateCode varchar(2),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (AreaCodeID)
);
CREATE TABLE dataexisting_areacodeintl (
	IDDCode varchar(5) NOT NULL,
	CountryID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp char(38),
	PRIMARY KEY (IDDCode)
);
CREATE TABLE dataexisting_companies (
	CompaniesID bigint NOT NULL,
	CompanyName varchar(79),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (CompaniesID)
);
CREATE TABLE dataexisting_namefirst (
	FirstNameID bigint NOT NULL,
	FirstName varchar(39),
	Gender varchar(1),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (FirstNameID)
);
CREATE TABLE dataexisting_namelast (
	LastNameID bigint NOT NULL,
	LastName varchar(69),
	StatusID int DEFAULT 1 NOT NULL,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (LastNameID)
);
CREATE TABLE dataexisting_upccodes (
	UPCCodeID bigint NOT NULL,
	UPCCodeName varchar(15),
	UPCProductName varchar(150),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp char(38),
	PRIMARY KEY (UPCCodeID)
);
CREATE TABLE dataexisting_zipcodeintl (
	ZipCodeIntnlID int NOT NULL,
	ZipCode char(10) NOT NULL,
	ZipCodeType varchar(15),
	City varchar(75),
	Country int,
	Lattitude varchar(10),
	Longitude varchar(10),
	"Location" varchar(99),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (ZipCodeIntnlID)
);
CREATE TABLE dataexisting_zipcodeus (
	ZipCodeID bigint NOT NULL,
	ZipCode char(5) NOT NULL,
	ZipCodeType varchar(15),
	City varchar(75),
	"State" varchar(2),
	Lattitude varchar(10),
	Longitude varchar(10),
	"Location" varchar(99),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (ZipCodeID)
);
CREATE TABLE datagenerated_accountnumbers (
	AccountNumbersID bigint NOT NULL,
	AccountNumberValue varchar(20),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	StatusID int DEFAULT 1,
	RegisteredApp char(38),
	DataGenTypeID int,
	PRIMARY KEY (AccountNumbersID)
);
CREATE TABLE datagenerated_addresses (
	AddressID bigint NOT NULL,
	AddressStreet varchar(99),
	AddressStreet2 varchar(59),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	DataGenTypeID int,
	PRIMARY KEY (AddressID)
);
CREATE TABLE datagenerated_bankaccount (
	BankAccountsID bigint NOT NULL,
	BankAccountValue varchar(17),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	DataGenTypeID int,
	PRIMARY KEY (BankAccountsID)
);
CREATE TABLE datagenerated_creditcard (
	CreditCardID bigint NOT NULL,
	CreditCardNumber varchar(20),
	CreditCardName varchar(20),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	DataGenTypeID int,
	PRIMARY KEY (CreditCardID)
);
CREATE TABLE datagenerated_dateofbirth (
	DateofBirthsID bigint NOT NULL,
	DateOfBirth varchar(12),
	DateOfBirthDate date,
	Age int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (DateofBirthsID)
);
CREATE TABLE datagenerated_driverslicenses (
	DriversLicensesID bigint NOT NULL,
	DLN varchar(25),
	StateCode varchar(2),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	DataGenTypeID int,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (DriversLicensesID)
);
CREATE TABLE datagenerated_ein (
	EINID bigint NOT NULL,
	EINValue varchar(10),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (EINID)
);
CREATE TABLE datagenerated_phonenumber (
	PhoneNumberID bigint NOT NULL,
	PhoneNumberValue varchar(8),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (PhoneNumberID)
);
CREATE TABLE datagenerated_phonenumbersintl (
	PhoneNumberIntlID bigint NOT NULL,
	PhoneNumberValue varchar(12),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CountryId int,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (PhoneNumberIntlID)
);
CREATE TABLE datagenerated_socialsecuritynumber (
	SocialSecurityNumberID bigint NOT NULL,
	SocialSecurityNumberValue varchar(11),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	RegisteredApp char(38),
	PRIMARY KEY (SocialSecurityNumberID)
);
CREATE TABLE datagenerated_useridentities (
	UserIdentitiesID bigint NOT NULL,
	UserIdentityValue varchar(20),
	UserDomain varchar(20),
	AdditionalAttributes varchar(40),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp char(38),
	DataGenTypeID int,
	PRIMARY KEY (UserIdentitiesID)
);
CREATE TABLE datamodel_datatables (
	TableName varchar(64) NOT NULL,
	TableInformation varchar(249),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (TableName)
);
CREATE TABLE datastructure_address (
	CompleteAddressID bigint NOT NULL,
	Address1 varchar(99),
	City varchar(70),
	StateID varchar(2),
	ZipCode varchar(10),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (CompleteAddressID)
);
CREATE TABLE datastructure_bankaccount (
	DataBuiltBankAccountsID bigint NOT NULL,
	BankAccountNumber varchar(12),
	BankAccountName varchar(75),
	BankRoutingID varchar(9),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
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
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltCorporationID)
);
CREATE TABLE datastructure_names (
	DataBuiltNamesID bigint NOT NULL,
	CompleteName varchar(100),
	Gender varchar(1),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
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
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (PersonDemographicsID)
);
CREATE TABLE datastructure_phonenumbers (
	DataBuiltPhoneNumbersID bigint NOT NULL,
	AreaCode varchar(3),
	PhoneNumber varchar(8),
	CompletePhoneNumber varchar(14),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltPhoneNumbersID)
);
CREATE TABLE datastructure_phonenumbersintl (
	DataBuiltPhoneNumbersIntlID bigint NOT NULL,
	AreaCode varchar(3),
	PhoneNumber varchar(8),
	CompletePhoneNumber varchar(14),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (DataBuiltPhoneNumbersIntlID)
);
CREATE TABLE datastructure_products (
	DatabuiltProductsID bigint NOT NULL,
	ProductID varchar(20),
	ProductName varchar(99),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (DatabuiltProductsID)
);
CREATE TABLE platform_appsettings_dataattributes (
	AppSettingsDataAttributeID int NOT NULL,
	PlatformDataAttributeID int,
	ServiceClassName varchar(75),
	CodeBaseLang varchar(20),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	MaxTableTransactionCount bigint,
	CurrentTableTransactionCount bigint,
	CurrentTableTransactionCounRunDateTime timestamp,
	RegisteredApp varchar(38),
	PRIMARY KEY (AppSettingsDataAttributeID)
);
CREATE TABLE platform_appsettings_general (
	AppSettingsID int NOT NULL,
	AppSettingName varchar(50),
	AppSettingValue varchar(199),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	DefaultDataGenerationApp varchar(38),
	PRIMARY KEY (AppSettingsID)
);
CREATE TABLE platform_config_datagen (
	DataGenConfigID int NOT NULL,
	DataTypeGenConfigName varchar(25),
	DataAttributeID int,
	RunQuantity int,
	MinuteInterval int,
	DataGenTypeID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	ApplicationID char(38),
	PRIMARY KEY (DataGenConfigID)
);
CREATE TABLE platform_dataattributes (
	PlatformDataAttributesID int NOT NULL,
	DataAttributeName varchar(50),
	SensitivityFlagID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	PlatformDataAttributeGUID char(38),
	RegisteredApp char(38),
	PRIMARY KEY (PlatformDataAttributesID)
);
CREATE TABLE platform_datastructures (
	PlatformDataStructuresID int NOT NULL,
	DataStructureName varchar(50),
	SensitivityFlagID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	PlatformDataStructuresGUID char(38),
	RegisteredApp varchar(38),
	PRIMARY KEY (PlatformDataStructuresID)
);
CREATE TABLE platform_datastructurestodataattributes (
	PlatformDataStructuresToDataAttributesID int NOT NULL,
	PlatformDataStructuresID int,
	CompositeDataStructureName varchar(50),
	SensitivityFlagID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	PlatformDataStructuresToDataAttributesGUID char(38),
	RegisteredApp char(38),
	PlatformDataAttributesID int,
	PRIMARY KEY (PlatformDataStructuresToDataAttributesID)
);
CREATE TABLE platform_rulesets (
	RuleID bigint NOT NULL,
	RuleName varchar(65),
	CreatedUser varchar(20),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	ExpirationDate timestamp,
	PRIMARY KEY (RuleID)
);
CREATE TABLE platform_rulesetsdefinitions (
	RulesetDefinitionsID char(38) NOT NULL,
	RulesetDefinitionName varchar(50),
	RuleSetID bigint,
	StepOrderID int,
	OperationTypeID varchar(7),
	RulesetDefValue char(40),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	EffectiveDate timestamp,
	ApplicationID varchar(38),
	TermDate timestamp,
	DataAttributeID int,
	PRIMARY KEY (RulesetDefinitionsID)
);
CREATE TABLE refdata_application (
	AppGUID char(38) NOT NULL,
	ApplicationCustomCode varchar(15),
	ApplicationDesc varchar(50),
	CreatedUser varchar(20),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	VendorID int,
	PRIMARY KEY (AppGUID)
);
CREATE TABLE refdata_codeset (
	CodeSetsID bigint NOT NULL,
	CodeSetName varchar(50),
	IndustryStd varchar(6),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	CodesetGUID char(38),
	FieldMapping varchar(20),
	SensitivityFlagID int,
	PRIMARY KEY (CodeSetsID)
);
CREATE TABLE refdata_codesettomsgtype (
	CodeSetToMsgTypeID bigint NOT NULL,
	CodeSetsID bigint,
	MsgType varchar(10),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	PRIMARY KEY (CodeSetToMsgTypeID)
);
CREATE TABLE refdata_countries (
	CountryID int NOT NULL,
	IDD varchar(5),
	CountryName varchar(59),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (CountryID)
);
CREATE TABLE refdata_datagentypes (
	DataGenTypeID int NOT NULL,
	DataGenTypeDescription varchar(65),
	Definition varchar(255),
	DataAttributeID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	PRIMARY KEY (DataGenTypeID)
);
CREATE TABLE refdata_industrystd (
	IndustryStd varchar(6) NOT NULL,
	IndustryStdDesc varchar(30),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (IndustryStd)
);
CREATE TABLE refdata_industrystd_datatypes (
	DataTypesToIndustryID int NOT NULL,
	IndustryStd varchar(6) NOT NULL,
	DataTypeName varchar(10),
	DataTypeNameDesc varchar(75),
	DataTypeSubFields varchar(249),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
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
	SensitivityFlagID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (FieldsToIndustryID)
);
CREATE TABLE refdata_industrystd_segments (
	SegmentToIndustryID int NOT NULL,
	IndustryStd varchar(6) NOT NULL,
	IndustryStdDesc varchar(30),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	SegmentName varchar(10),
	SegmentNameDesc varchar(129),
	PRIMARY KEY (SegmentToIndustryID)
);
CREATE TABLE refdata_legalentity (
	LegalEntityGUID char(38) NOT NULL,
	LocationName varchar(50),
	Address varchar(75),
	City varchar(60),
	StateID varchar(2),
	ZipCode varchar(12),
	CreatedUser varchar(20),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	LocationURL varchar(99),
	LocationPhone varchar(12),
	PRIMARY KEY (LegalEntityGUID)
);
CREATE TABLE refdata_operationtype (
	OperationTypeID varchar(7) NOT NULL,
	OperationTypeName varchar(60),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (OperationTypeID)
);
CREATE TABLE refdata_organization (
	OrganizationGUID char(38) NOT NULL,
	OrganizationInternalCode varchar(10),
	OrganizationInternalID varchar(10),
	OrganizationName varchar(50),
	Address varchar(75),
	City varchar(60),
	StateID varchar(2),
	ZipCode varchar(12),
	CreatedUser varchar(20),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	LegalEntityGUID varchar(38),
	PRIMARY KEY (OrganizationGUID)
);
CREATE TABLE refdata_platformparams (
	PlatformParamsID int NOT NULL,
	PlatformParamValues varchar(35),
	PlatformParamDesc varchar(70),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (PlatformParamsID)
);
CREATE TABLE refdata_platformparamstodataattributes (
	PlatformParamsToDataAttributeID bigint NOT NULL,
	PlatformParamsID int,
	DataAttributeID int,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	RegisteredApp varchar(38),
	PRIMARY KEY (PlatformParamsToDataAttributeID)
);
CREATE TABLE refdata_sensitivityflag (
	SensitiveFlagID int NOT NULL,
	SensitiveFlagDesc varchar(30),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (SensitiveFlagID)
);
CREATE TABLE refdata_status (
	StatusID int NOT NULL,
	StatusDescription varchar(45) NOT NULL,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	PRIMARY KEY (StatusID)
);
CREATE TABLE refdata_timezones (
	TimeZoneValue varchar(3) NOT NULL,
	TimeZoneDesc varchar(25),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	PRIMARY KEY (TimeZoneValue)
);
CREATE TABLE refdata_usstates (
	StateID varchar(2) NOT NULL,
	StateDescription varchar(65),
	Lattitude varchar(12),
	Longitude varchar(12),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	PRIMARY KEY (StateID)
);
CREATE TABLE refdata_vendor (
	VendorID int NOT NULL,
	VendorName varchar(50),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	VendorGUID char(38),
	PRIMARY KEY (VendorID)
);
CREATE TABLE tasks (
	"id" int NOT NULL,
	task varchar(200) NOT NULL,
	status int DEFAULT 1 NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY ("id")
);
CREATE TABLE terms_codesetmetadata (
	CodeSetStructuresID bigint NOT NULL,
	CodeSetStructureName varchar(50),
	IndustryStd varchar(6),
	StatusID int DEFAULT 1,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	CreatedUser varchar(20),
	CodesetStructureGUID char(38),
	Field1Value varchar(75),
	Field2Value varchar(75),
	Field3Value varchar(75),
	Field4Value varchar(75),
	Field5Value varchar(75),
	Field6Value varchar(75),
	Field7Value varchar(75),
	Field8Value varchar(75),
	Field9Value varchar(75),
	SensitivityFlagID int,
	CodesetsID bigint,
	PRIMARY KEY (CodeSetStructuresID)
);
CREATE TABLE terms_codesetstoapplication (
	CodeSetToApplicationID bigint NOT NULL,
	CodeSetsID bigint NOT NULL,
	"Domain" varchar(50),
	IndustryStd varchar(6),
	SpecificDetails varchar(99),
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	OrganizationID varchar(38),
	ApplicationID varchar(38),
	VendorID int,
	CodeValue varchar(20),
	CodeDesc varchar(129),
	SensitiveFlagID int,
	PRIMARY KEY (CodeSetToApplicationID)
);
CREATE TABLE terms_codesetstoapplicationvalues (
	CodeSetToApplicationValuesID bigint NOT NULL,
	CodeSetToApplicationID bigint,
	CodeSetsID bigint NOT NULL,
	CreatedDate timestamp DEFAULT CURRENT_TIMESTAMP,
	StatusID int DEFAULT 1,
	CreatedUser varchar(20),
	TermValue varchar(20),
	TermValueLow varchar(10),
	TermValueHigh varchar(10),
	PRIMARY KEY (CodeSetToApplicationValuesID)
);
ALTER TABLE auditing_dataplatform
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE auditing_datarequest
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_ababanking
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_ababanking
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (TimeZone) 
	REFERENCES refdata_timezones (TimeZoneValue);

ALTER TABLE dataexisting_areacode
	ADD FOREIGN KEY (StateCode) 
	REFERENCES refdata_usstates (StateID);


ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (CountryID) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_areacodeintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_companies
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_companies
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_namefirst
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_namefirst
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_namelast
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_namelast
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_upccodes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_upccodes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (Country) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_zipcodeintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE dataexisting_zipcodeus
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE dataexisting_zipcodeus
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_accountnumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_addresses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_bankaccount
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_creditcard
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_dateofbirth
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_dateofbirth
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_driverslicenses
	ADD FOREIGN KEY (StateCode) 
	REFERENCES refdata_usstates (StateID);


ALTER TABLE datagenerated_ein
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_ein
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_phonenumber
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datagenerated_phonenumber
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);


ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (CountryId) 
	REFERENCES refdata_countries (CountryID);

ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_socialsecuritynumber
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_socialsecuritynumber
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datagenerated_useridentities
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_address
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datastructure_address
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_bankaccount
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_bankaccount
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);


ALTER TABLE datastructure_corporations
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datastructure_corporations
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_names
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_names
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);


ALTER TABLE datastructure_persondemographics
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datastructure_persondemographics
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_phonenumbers
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE datastructure_phonenumbersintl
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE datastructure_products
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE datastructure_products
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_appsettings_dataattributes
	ADD FOREIGN KEY (PlatformDataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE platform_appsettings_dataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_appsettings_general
	ADD FOREIGN KEY (DefaultDataGenerationApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE platform_appsettings_general
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE platform_appsettings_general
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (DataGenTypeID) 
	REFERENCES refdata_datagentypes (DataGenTypeID);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_dataattributes
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE platform_dataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE platform_dataattributes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);


ALTER TABLE platform_datastructures
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE platform_datastructures
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE platform_datastructures
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);


ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (PlatformDataAttributesID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (PlatformDataStructuresID) 
	REFERENCES platform_datastructures (PlatformDataStructuresID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE platform_datastructurestodataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_rulesets
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE platform_rulesetsdefinitions
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE platform_rulesetsdefinitions
	ADD FOREIGN KEY (OperationTypeID) 
	REFERENCES refdata_operationtype (OperationTypeID);

ALTER TABLE platform_rulesetsdefinitions
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE platform_rulesetsdefinitions
	ADD FOREIGN KEY (RuleSetID) 
	REFERENCES platform_rulesets (RuleID);

ALTER TABLE platform_rulesetsdefinitions
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_application
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE refdata_application
	ADD FOREIGN KEY (VendorID) 
	REFERENCES refdata_vendor (VendorID);


ALTER TABLE refdata_codeset
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE refdata_codeset
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE refdata_codeset
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);


ALTER TABLE refdata_codesettomsgtype
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);

ALTER TABLE refdata_codesettomsgtype
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
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE refdata_industrystd_datatypes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_industrystd_fields
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE refdata_industrystd_fields
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE refdata_industrystd_fields
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_industrystd_segments
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE refdata_industrystd_segments
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_legalentity
	ADD FOREIGN KEY (StateID) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE refdata_legalentity
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_operationtype
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_organization
	ADD FOREIGN KEY (LegalEntityGUID) 
	REFERENCES refdata_legalentity (LegalEntityGUID);

ALTER TABLE refdata_organization
	ADD FOREIGN KEY (StateID) 
	REFERENCES refdata_usstates (StateID);

ALTER TABLE refdata_organization
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_platformparams
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (DataAttributeID) 
	REFERENCES platform_dataattributes (PlatformDataAttributesID);

ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (PlatformParamsID) 
	REFERENCES refdata_platformparams (PlatformParamsID);

ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (RegisteredApp) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE refdata_platformparamstodataattributes
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE refdata_sensitivityflag
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


ALTER TABLE terms_codesetmetadata
	ADD FOREIGN KEY (CodesetsID) 
	REFERENCES refdata_codeset (CodeSetsID);

ALTER TABLE terms_codesetmetadata
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE terms_codesetmetadata
	ADD FOREIGN KEY (SensitivityFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE terms_codesetmetadata
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (ApplicationID) 
	REFERENCES refdata_application (AppGUID);

ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);

ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (IndustryStd) 
	REFERENCES refdata_industrystd (IndustryStd);

ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (OrganizationID) 
	REFERENCES refdata_organization (OrganizationGUID);

ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (SensitiveFlagID) 
	REFERENCES refdata_sensitivityflag (SensitiveFlagID);

ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);

ALTER TABLE terms_codesetstoapplication
	ADD FOREIGN KEY (VendorID) 
	REFERENCES refdata_vendor (VendorID);


ALTER TABLE terms_codesetstoapplicationvalues
	ADD FOREIGN KEY (CodeSetsID) 
	REFERENCES refdata_codeset (CodeSetsID);

ALTER TABLE terms_codesetstoapplicationvalues
	ADD FOREIGN KEY (CodeSetToApplicationID) 
	REFERENCES terms_codesetstoapplication (CodeSetToApplicationID);

ALTER TABLE terms_codesetstoapplicationvalues
	ADD FOREIGN KEY (StatusID) 
	REFERENCES refdata_status (StatusID);


