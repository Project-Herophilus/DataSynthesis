-- -----------------------------------------------------
-- Table refdata_status
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_status ;

CREATE TABLE refdata_status (
  StatusID SMALLINT autoincrement start 1 end 1,
  StatusDescription VARCHAR(45) NOT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (StatusID));

-- -----------------------------------------------------
-- Table auditing_dataplatform
-- -----------------------------------------------------
DROP TABLE IF EXISTS auditing_dataplatform ;

CREATE TABLE auditing_dataplatform (
  DataPlatformID BIGINT NOT NULL AUTO_INCREMENT,
  DataProcessingDate DATETIME() NULL,
  CreatedByUser VARCHAR(20) NULL DEFAULT NULL,
  Organizaton VARCHAR(38) NULL DEFAULT NULL,
  Application VARCHAR(38) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  RecCount INT NULL DEFAULT NULL,
  Component VARCHAR(20) NULL DEFAULT NULL,
  ActionName VARCHAR(20) NULL DEFAULT NULL,
  DurationToRun INT NULL DEFAULT NULL,
  ActivityDetail VARCHAR(75) NULL DEFAULT NULL,
  PRIMARY KEY (DataPlatformID),
  CONSTRAINT FK_platform_dataplatform_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table auditing_datarequest
-- -----------------------------------------------------
DROP TABLE IF EXISTS auditing_datarequest ;

CREATE TABLE auditing_datarequest (
  DataRequestID BIGINT NOT NULL AUTO_INCREMENT,
  DataRequestDate DATETIME() NULL DEFAULT NULL,
  CreatedByUser VARCHAR(20) NULL DEFAULT NULL,
  Organizaton VARCHAR(38) NULL DEFAULT NULL,
  Application VARCHAR(38) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  RecCount INT NULL DEFAULT NULL,
  RecordDataRequest VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (DataRequestID),
  CONSTRAINT FK_platform_datarequest_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))


-- -----------------------------------------------------
-- Table refdata_vendor
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_vendor ;

CREATE TABLE refdata_vendor (
  VendorID INT NOT NULL AUTO_INCREMENT,
  VendorName VARCHAR(50)  NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  VendorGUID CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (VendorID),
  CONSTRAINT FK_refdata_vendors_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_application
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_application ;

CREATE TABLE refdata_application (
  AppGUID CHAR(38) NOT NULL,
  ApplicationCustomCode VARCHAR(15) NULL DEFAULT NULL,
  ApplicationDesc VARCHAR(50) NULL DEFAULT NULL,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  VendorID INT NULL DEFAULT NULL,
  PRIMARY KEY (AppGUID),
  CONSTRAINT FK_refdata_application_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT FK_refdata_application_vendors
    FOREIGN KEY (VendorID)
    REFERENCES refdata_vendor (VendorID))

-- -----------------------------------------------------
-- Table databuilt_address
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_address ;

CREATE TABLE databuilt_address (
  CompleteAddressID BIGINT NOT NULL AUTO_INCREMENT,
  Address1 VARCHAR(99) NULL DEFAULT NULL,
  City VARCHAR(70) NULL DEFAULT NULL,
  StateID VARCHAR(2) NULL DEFAULT NULL,
  ZipCode VARCHAR(10) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (CompleteAddressID),
  CONSTRAINT FK_databuilt_address_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_databuilt_address_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table databuilt_bankaccount
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_bankaccount ;

CREATE TABLE databuilt_bankaccount (
  DataBuiltBankAccountsID BIGINT NOT NULL AUTO_INCREMENT,
  BankAccountNumber VARCHAR(12) NULL DEFAULT NULL,
  BankAccountName VARCHAR(75) NULL DEFAULT NULL,
  BankRoutingID VARCHAR(9) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DataBuiltBankAccountsID),
  CONSTRAINT FK_databuilt_bankaccount_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT fk_databuilt_bankAccounts_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table databuilt_corporations
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_corporations ;

CREATE TABLE databuilt_corporations (
  DataBuiltCorporationID BIGINT NOT NULL AUTO_INCREMENT,
  CorporationName VARCHAR(99) NULL DEFAULT NULL,
  Address1 VARCHAR(99) NULL DEFAULT NULL,
  City VARCHAR(70) NULL DEFAULT NULL,
  StateID VARCHAR(2) NULL DEFAULT NULL,
  ZipCode VARCHAR(10) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DataBuiltCorporationID),
  CONSTRAINT FK_databuilt_corporations_resiteredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_databuilt_corporations_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table databuilt_names
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_names ;

CREATE TABLE databuilt_names (
  DataBuiltNamesID BIGINT NOT NULL AUTO_INCREMENT,
  CompleteName VARCHAR(100) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DataBuiltNamesID),
  CONSTRAINT FK_databuilt_completenames_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT FK_databuilt_names_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID))

-- -----------------------------------------------------
-- Table databuilt_persondemographics
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_persondemographics ;

CREATE TABLE databuilt_persondemographics (
  PersonDemographicsID BIGINT NOT NULL AUTO_INCREMENT,
  DLN VARCHAR(25) NULL DEFAULT NULL,
  DLNState VARCHAR(2) NULL DEFAULT NULL,
  SSN VARCHAR(11) NULL DEFAULT NULL,
  DOBValue VARCHAR(12) NULL DEFAULT NULL,
  DOBDate DATE NULL DEFAULT NULL,
  Age INT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (PersonDemographicsID),
  CONSTRAINT FK_databuilt_persondemographics_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_databuilt_persondemographics_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table databuilt_phonenumbers
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_phonenumbers ;

CREATE TABLE databuilt_phonenumbers (
  DataBuiltPhoneNumbersID BIGINT NOT NULL AUTO_INCREMENT,
  AreaCode VARCHAR(3) NULL DEFAULT NULL,
  PhoneNumber VARCHAR(8) NULL DEFAULT NULL,
  CompletePhoneNumber VARCHAR(14) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DataBuiltPhoneNumbersID),
  CONSTRAINT FK_databuilt_phonenumbers_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_databuilt_phonenumbers_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT IDX_databuilt_phonenumbers_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table databuilt_products
-- -----------------------------------------------------
DROP TABLE IF EXISTS databuilt_products ;

CREATE TABLE databuilt_products (
  DatabuiltProductsID BIGINT NOT NULL AUTO_INCREMENT,
  ProductID VARCHAR(20) NULL DEFAULT NULL,
  ProductName VARCHAR(99) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DatabuiltProductsID),
  CONSTRAINT FK_databuilt_products_regsiteredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_databuilt_products_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_ababanking
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_ababanking ;

CREATE TABLE dataexisting_ababanking (
  ABABankingID BIGINT NOT NULL AUTO_INCREMENT,
  RoutingNumber VARCHAR(9) NULL DEFAULT NULL,
  TelegraphicName VARCHAR(20) NULL DEFAULT NULL,
  CustomerName VARCHAR(36) NULL DEFAULT NULL,
  City VARCHAR(20) NULL DEFAULT NULL,
  State VARCHAR(2) NULL DEFAULT NULL,
  ZipCode VARCHAR(5) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (ABABankingID),
  CONSTRAINT FK_dataexisting_ababanking_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_ababanking_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_timezones
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_timezones ;

CREATE TABLE refdata_timezones (
  TimeZoneValue VARCHAR(3) NOT NULL,
  TimeZoneDesc VARCHAR(25) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (TimeZoneValue),
  CONSTRAINT FK_TimeZones_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_usstates
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_usstates ;

CREATE TABLE refdata_usstates (
  StateID VARCHAR(2) NOT NULL,
  StateDescription VARCHAR(65) NULL DEFAULT NULL,
  Lattitude VARCHAR(12) NULL DEFAULT NULL,
  Longitude VARCHAR(12) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (StateID),
  CONSTRAINT FK_USStates_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_areacode
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_areacode ;

CREATE TABLE dataexisting_areacode (
  AreaCodeID BIGINT NOT NULL AUTO_INCREMENT,
  AreaCodeValue VARCHAR(3) NOT NULL,
  TimeZone VARCHAR(3) NULL DEFAULT NULL,
  StateCode VARCHAR(2) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (AreaCodeID),
  CONSTRAINT FK_dataexisting_areacode_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_areacode_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT FK_dataexisting_areacode_timezones
    FOREIGN KEY (TimeZone)
    REFERENCES refdata_timezones (TimeZoneValue),
  CONSTRAINT FK_dataexisting_areacode_USStates
    FOREIGN KEY (StateCode)
    REFERENCES refdata_usstates (StateID))

-- -----------------------------------------------------
-- Table refdata_countries
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_countries ;

CREATE TABLE refdata_countries (
  CountryID SMALLINT NOT NULL AUTO_INCREMENT,
  IDD VARCHAR(5) NULL DEFAULT NULL,
  CountryName VARCHAR(59) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (CountryID),
  CONSTRAINT FK_Countries_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_areacodeintl
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_areacodeintl ;

CREATE TABLE dataexisting_areacodeintl (
  IDDCode VARCHAR(5) NOT NULL,
  CountryID SMALLINT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (IDDCode),
  CONSTRAINT FK_dataexisting_areacodeintl_Countries
    FOREIGN KEY (CountryID)
    REFERENCES refdata_countries (CountryID),
  CONSTRAINT FK_dataexisting_areacodeintl_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_areacodeintl_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_companies
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_companies ;

CREATE TABLE dataexisting_companies (
  CompaniesID BIGINT NOT NULL AUTO_INCREMENT,
  CompanyName VARCHAR(79) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (CompaniesID),
  CONSTRAINT FK_dataexisting_companies_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_companies_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_namefirst
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_namefirst ;

CREATE TABLE dataexisting_namefirst (
  FirstNameID BIGINT NOT NULL AUTO_INCREMENT,
  FirstName VARCHAR(39) NULL DEFAULT NULL,
  Gender VARCHAR(1) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (FirstNameID),
  CONSTRAINT FK_dataexisting_namefirst_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_namefirst_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_namelast
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_namelast ;

CREATE TABLE dataexisting_namelast (
  LastNameID BIGINT NOT NULL AUTO_INCREMENT,
  LastName VARCHAR(69) NULL DEFAULT NULL,
  StatusID SMALLINT NOT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (LastNameID),
  CONSTRAINT FK_dataexisting_namelast_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_namelast_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_upccodes
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_upccodes ;

CREATE TABLE dataexisting_upccodes (
  UPCCodeID BIGINT NOT NULL AUTO_INCREMENT,
  UPCCodeName VARCHAR(15) NULL DEFAULT NULL,
  UPCProductName VARCHAR(150) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (UPCCodeID),
  CONSTRAINT FK_dataexisting_upccodes_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_upccodes_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_zipcodeintl
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_zipcodeintl ;

CREATE TABLE dataexisting_zipcodeintl (
  ZipCodeIntnlID INT NOT NULL AUTO_INCREMENT,
  ZipCode CHAR(10) NOT NULL,
  ZipCodeType VARCHAR(15) NULL DEFAULT NULL,
  City VARCHAR(75) NULL DEFAULT NULL,
  Country SMALLINT NULL DEFAULT NULL,
  Lattitude VARCHAR(10) NULL DEFAULT NULL,
  Longitude VARCHAR(10) NULL DEFAULT NULL,
  Location VARCHAR(99) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (ZipCodeIntnlID),
  CONSTRAINT FK_dataexisting_zipcodeIntl_Countries
    FOREIGN KEY (Country)
    REFERENCES refdata_countries (CountryID),
  CONSTRAINT FK_dataexisting_zipcodeintl_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_zipcodeIntl_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table dataexisting_zipcodeus
-- -----------------------------------------------------
DROP TABLE IF EXISTS dataexisting_zipcodeus ;

CREATE TABLE dataexisting_zipcodeus (
  ZipCodeID BIGINT NOT NULL AUTO_INCREMENT,
  ZipCode CHAR(5) NOT NULL,
  ZipCodeType VARCHAR(15) NULL DEFAULT NULL,
  City VARCHAR(75) NULL DEFAULT NULL,
  State VARCHAR(2) NULL DEFAULT NULL,
  Lattitude VARCHAR(10) NULL DEFAULT NULL,
  Longitude VARCHAR(10) NULL DEFAULT NULL,
  Location VARCHAR(99) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (ZipCodeID),
  CONSTRAINT FK_dataexisting_zipcodeus_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_dataexisting_zipcodeUS_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_accountnumbers
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_accountnumbers ;

CREATE TABLE datagenerated_accountnumbers (
  AccountNumbersID BIGINT NOT NULL AUTO_INCREMENT,
  AccountNumberValue VARCHAR(20) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (AccountNumbersID),
  CONSTRAINT FK_datagenerated_accountnumbers_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_accountnumbers_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_addressformattype
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_addressformattype ;

CREATE TABLE refdata_addressformattype (
  AddressFormatTypeID SMALLINT NOT NULL AUTO_INCREMENT,
  AddressFormatTypeDesc VARCHAR(35) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusId SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (AddressFormatTypeID),
  CONSTRAINT FK_AddressFormatType_Status
    FOREIGN KEY (StatusId)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_addresses
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_addresses ;

CREATE TABLE datagenerated_addresses (
  AddressID BIGINT NOT NULL AUTO_INCREMENT,
  AddressStreet VARCHAR(99) NULL DEFAULT NULL,
  AddressStreet2 VARCHAR(59) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  AddressFormatTypeId SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (AddressID),
  CONSTRAINT FK_datagenerated_addresses_AddressFormatType
    FOREIGN KEY (AddressFormatTypeId)
    REFERENCES refdata_addressformattype (AddressFormatTypeID),
  CONSTRAINT FK_datagenerated_addresses_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_addresses_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_bankaccount
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_bankaccount ;

CREATE TABLE datagenerated_bankaccount (
  BankAccountsID BIGINT NOT NULL AUTO_INCREMENT,
  BankAccountValue VARCHAR(17) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (BankAccountsID),
  CONSTRAINT FK_datagenerated_bankaccount_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_bankaccount_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_creditcard
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_creditcard ;

CREATE TABLE datagenerated_creditcard (
  CreditCardID BIGINT NOT NULL AUTO_INCREMENT,
  CreditCardNumber VARCHAR(20) NULL DEFAULT NULL,
  CreditCardName VARCHAR(10) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (CreditCardID),
  CONSTRAINT FK_datagenerated_creditcard_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_creditcard_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_dateofbirth
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_dateofbirth ;

CREATE TABLE datagenerated_dateofbirth (
  DateofBirthsID BIGINT NOT NULL AUTO_INCREMENT,
  DateOfBirth VARCHAR(12) NULL DEFAULT NULL,
  DateOfBirthDate DATE NULL DEFAULT NULL,
  Age INT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DateofBirthsID),
  CONSTRAINT FK_datagenerated_dateofbirth_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_dateofbirth_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_driverslicenses
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_driverslicenses ;

CREATE TABLE datagenerated_driverslicenses (
  DriversLicensesID BIGINT NOT NULL AUTO_INCREMENT,
  DLN VARCHAR(25) NULL DEFAULT NULL,
  StateCode VARCHAR(2) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CompleteDriversLicenseNumber VARCHAR(30) NULL DEFAULT NULL,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DriversLicensesID),
  CONSTRAINT FK_datagenerated_driverslicenses_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_driverslicenses_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT FK_datagenerated_driverslicenses_USStates
    FOREIGN KEY (StateCode)
    REFERENCES refdata_usstates (StateID))

-- -----------------------------------------------------
-- Table datagenerated_ein
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_ein ;

CREATE TABLE datagenerated_ein (
  EINID BIGINT NOT NULL AUTO_INCREMENT,
  EINValue VARCHAR(10) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (EINID),
  CONSTRAINT FK_datagenerated_ein_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_ein_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_phonenumber
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_phonenumber ;

CREATE TABLE datagenerated_phonenumber (
  PhoneNumberID BIGINT NOT NULL AUTO_INCREMENT,
  PhoneNumberValue VARCHAR(8) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (PhoneNumberID),
  CONSTRAINT FK_datagenerated_phonenumber_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_phonenumbers_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_phonenumbersintl
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_phonenumbersintl ;

CREATE TABLE datagenerated_phonenumbersintl (
  PhoneNumberIntlID BIGINT NOT NULL AUTO_INCREMENT,
  PhoneNumberValue VARCHAR(12) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CountryId SMALLINT NULL DEFAULT NULL,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (PhoneNumberIntlID),
  CONSTRAINT FK_datagenerated_phonenumbersintl_Country
    FOREIGN KEY (CountryId)
    REFERENCES refdata_countries (CountryID),
  CONSTRAINT FK_datagenerated_phonenumbersintl_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_phonenumbersintl_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_socialsecuritynumber
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_socialsecuritynumber ;

CREATE TABLE datagenerated_socialsecuritynumber (
  SocialSecurityNumberID BIGINT NOT NULL AUTO_INCREMENT,
  SocialSecurityNumberValue VARCHAR(11) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (SocialSecurityNumberID),
  CONSTRAINT FK_datagenerated_socialsecuritynumber_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_socialsecuritynumber_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datagenerated_useridentities
-- -----------------------------------------------------
DROP TABLE IF EXISTS datagenerated_useridentities ;

CREATE TABLE datagenerated_useridentities (
  UserIdentitiesID BIGINT NOT NULL AUTO_INCREMENT,
  UserIdentityValue VARCHAR(20) NULL DEFAULT NULL,
  UserDomain VARCHAR(20) NULL DEFAULT NULL,
  AdditionalAttributes VARCHAR(40) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (UserIdentitiesID),
  CONSTRAINT FK_datagenerated_useridentities_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_datagenerated_useridentities_Status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table datamodel_datatables
-- -----------------------------------------------------
DROP TABLE IF EXISTS datamodel_datatables ;

CREATE TABLE datamodel_datatables (
  TableName VARCHAR(64) NOT NULL,
  TableInformation VARCHAR(249) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (TableName))

-- -----------------------------------------------------
-- Table platform_appsetting
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_appsetting ;

CREATE TABLE platform_appsetting (
  AppSettingsID SMALLINT NOT NULL AUTO_INCREMENT,
  AppSettingName VARCHAR(50) NULL DEFAULT NULL,
  AppSettingValue VARCHAR(199) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  DefaultDataGenerationApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (AppSettingsID),
  CONSTRAINT FK_platform_appsetting_datagenapp
    FOREIGN KEY (DefaultDataGenerationApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_platform_appsettings_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_refdata_appsettings_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_sensitivityflag
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_sensitivityflag ;

CREATE TABLE refdata_sensitivityflag (
  SensitiveFlagID SMALLINT NOT NULL AUTO_INCREMENT,
  SensitiveFlagDesc VARCHAR(30) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (SensitiveFlagID),
  CONSTRAINT FK_refdata_sensitivityflag_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table platform_dataattributes
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_dataattributes ;

CREATE TABLE platform_dataattributes (
  PlatformDataAttributesID SMALLINT NOT NULL AUTO_INCREMENT,
  DataAttributeName VARCHAR(50) NULL DEFAULT NULL,
  SensitivityFlagID SMALLINT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  PlatformDataAttributeGUID CHAR(38) NULL DEFAULT NULL,
  RegisteredApp CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (PlatformDataAttributesID),
  CONSTRAINT FK_platform_dataattributes_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_platformdataattributes_sensitivtyflag
    FOREIGN KEY (SensitivityFlagID)
    REFERENCES refdata_sensitivityflag (SensitiveFlagID),
  CONSTRAINT FK_platformdataattributes_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))


-- -----------------------------------------------------
-- Table platform_config_datagen
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_config_datagen ;

CREATE TABLE platform_config_datagen (
  DataGenConfigID SMALLINT NOT NULL AUTO_INCREMENT,
  DataTypeGenConfigName VARCHAR(25) NULL DEFAULT NULL,
  DataAttributeID SMALLINT NULL DEFAULT NULL,
  SpecialInstructions VARCHAR(99) NULL DEFAULT NULL,
  RunQuantity INT NULL DEFAULT NULL,
  MinuteInterval SMALLINT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  ApplicationID CHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (DataGenConfigID),
  CONSTRAINT FK_platform_datagenconfig_dataattributes
    FOREIGN KEY (DataAttributeID)
    REFERENCES platform_dataattributes (PlatformDataAttributesID),
  CONSTRAINT FK_platform_datagenconfig_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT platform_config_datagen_registeredapp
    FOREIGN KEY (ApplicationID)
    REFERENCES refdata_application (AppGUID))


-- -----------------------------------------------------
-- Table platform_datastructures
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_datastructures ;

CREATE TABLE platform_datastructures (
  PlatformDataStructuresID SMALLINT NOT NULL AUTO_INCREMENT,
  DataStructureName VARCHAR(50) NULL DEFAULT NULL,
  SensitivityFlagID SMALLINT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  PlatformDataStructuresGUID CHAR(38) NULL DEFAULT NULL,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (PlatformDataStructuresID),
  CONSTRAINT FK_platform_datastructures__registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_platform_datastructures_sensitivityflag
    FOREIGN KEY (SensitivityFlagID)
    REFERENCES refdata_sensitivityflag (SensitiveFlagID),
  CONSTRAINT FK_platform_datastructures_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table platform_datastructurestodataattributes
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_datastructurestodataattributes ;

CREATE TABLE platform_datastructurestodataattributes (
  PlatformDataStructuresToDataAttributesID SMALLINT NOT NULL AUTO_INCREMENT,
  PlatformDataStructuresID SMALLINT NULL DEFAULT NULL,
  CompositeDataStructureName VARCHAR(50) NULL DEFAULT NULL,
  SensitivityFlagID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  PlatformDataStructuresToDataAttributesGUID CHAR(38) NULL DEFAULT NULL,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PlatformDataAttributesID SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (PlatformDataStructuresToDataAttributesID),
  CONSTRAINT FK_platform_datastructurestodataattributes_dataattributes
    FOREIGN KEY (PlatformDataAttributesID)
    REFERENCES platform_dataattributes (PlatformDataAttributesID),
  CONSTRAINT FK_platform_datastructurestodataattributes_datastructure
    FOREIGN KEY (PlatformDataStructuresID)
    REFERENCES platform_datastructures (PlatformDataStructuresID),
  CONSTRAINT FK_platform_datastructurestodataattributes_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_platform_datastructurestodataattributes_sensitivityflag
    FOREIGN KEY (SensitivityFlagID)
    REFERENCES refdata_sensitivityflag (SensitiveFlagID),
  CONSTRAINT FK_platform_datastructurestodataattributes_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table platform_rulesets
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_rulesets ;

CREATE TABLE platform_rulesets (
  RuleID BIGINT NOT NULL AUTO_INCREMENT,
  RuleName VARCHAR(65) NULL DEFAULT NULL,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  ExpirationDate TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (RuleID),
  CONSTRAINT FK_platform_rulesets_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_operationtype
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_operationtype ;

CREATE TABLE refdata_operationtype (
  OperationTypeID VARCHAR(7) NOT NULL,
  OperationTypeName VARCHAR(60) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (OperationTypeID),
  CONSTRAINT FK_refdata_operationtype_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table platform_rulesetsdefinitions
-- -----------------------------------------------------
DROP TABLE IF EXISTS platform_rulesetsdefinitions ;

CREATE TABLE platform_rulesetsdefinitions (
  RulesetDefinitionsID CHAR(38) NOT NULL,
  RulesetDefinitionName VARCHAR(50) NULL DEFAULT NULL,
  RuleSetID BIGINT NULL DEFAULT NULL,
  StepOrderID SMALLINT NULL DEFAULT NULL,
  OperationTypeID VARCHAR(7) NULL DEFAULT NULL,
  RulesetDefValue CHAR(40) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  EffectiveDate TIMESTAMP NULL DEFAULT NULL,
  ApplicationID VARCHAR(38) NULL DEFAULT NULL,
  TermDate TIMESTAMP NULL DEFAULT NULL,
  DataAttributeID SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (RulesetDefinitionsID),
  CONSTRAINT FK_platform_rulesetsdefinitions_dataattributes
    FOREIGN KEY (DataAttributeID)
    REFERENCES platform_dataattributes (PlatformDataAttributesID),
  CONSTRAINT FK_platform_rulesetsdefinitions_operationtype
    FOREIGN KEY (OperationTypeID)
    REFERENCES refdata_operationtype (OperationTypeID),
  CONSTRAINT FK_platform_rulesetsdefinitions_registeredapp
    FOREIGN KEY (ApplicationID)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_platform_rulesetsdefinitions_ruleset
    FOREIGN KEY (RuleSetID)
    REFERENCES platform_rulesets (RuleID),
  CONSTRAINT FK_platform_rulesetsdefinitions_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_industrystd
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_industrystd ;

CREATE TABLE refdata_industrystd (
  IndustryStd VARCHAR(6) NOT NULL,
  IndustryStdDesc VARCHAR(30) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (IndustryStd),
  CONSTRAINT FK_refdata_industrystd_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_codeset
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_codeset ;

CREATE TABLE refdata_codeset (
  CodeSetsID BIGINT NOT NULL AUTO_INCREMENT,
  CodeSetName VARCHAR(50) NULL DEFAULT NULL,
  IndustryStd VARCHAR(6) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  CodesetGUID CHAR(38) NULL DEFAULT NULL,
  FieldMapping VARCHAR(20) NULL DEFAULT NULL,
  SensitivityFlagID SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (CodeSetsID),
  CONSTRAINT FK_refdata_codeset_industrystd
    FOREIGN KEY (IndustryStd)
    REFERENCES refdata_industrystd (IndustryStd),
  CONSTRAINT FK_refdata_codeset_sensitivityflag
    FOREIGN KEY (SensitivityFlagID)
    REFERENCES refdata_sensitivityflag (SensitiveFlagID),
  CONSTRAINT FK_refdata_codesets_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_codesetstructures
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_codesetstructures ;

CREATE TABLE refdata_codesetstructures (
  CodeSetStructuresID BIGINT NOT NULL AUTO_INCREMENT,
  CodeSetStructureName VARCHAR(50) NULL DEFAULT NULL,
  IndustryStd VARCHAR(6) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  CodesetStructureGUID CHAR(38) NULL DEFAULT NULL,
  Field1Value VARCHAR(75) NULL DEFAULT NULL,
  Field2Value VARCHAR(75) NULL DEFAULT NULL,
  Field3Value VARCHAR(75) NULL DEFAULT NULL,
  Field4Value VARCHAR(75) NULL DEFAULT NULL,
  Field5Value VARCHAR(75) NULL DEFAULT NULL,
  Field6Value VARCHAR(75) NULL DEFAULT NULL,
  Field7Value VARCHAR(75) NULL DEFAULT NULL,
  Field8Value VARCHAR(75) NULL DEFAULT NULL,
  Field9Value VARCHAR(75) NULL DEFAULT NULL,
  SensitivityFlagID SMALLINT NULL DEFAULT NULL,
  CodesetsID BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (CodeSetStructuresID),
  CONSTRAINT FK_refdata_codesetstructures_codesets
    FOREIGN KEY (CodesetsID)
    REFERENCES refdata_codeset (CodeSetsID),
  CONSTRAINT FK_refdata_codesetstructures_industrystd
    FOREIGN KEY (IndustryStd)
    REFERENCES refdata_industrystd (IndustryStd),
  CONSTRAINT FK_refdata_codesetstructures_sensitivityflag
    FOREIGN KEY (SensitivityFlagID)
    REFERENCES refdata_sensitivityflag (SensitiveFlagID),
  CONSTRAINT FK_refdata_codesetstructures_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_legalentity
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_legalentity ;

CREATE TABLE refdata_legalentity (
  LegalEntityGUID CHAR(38) NOT NULL,
  LocationName VARCHAR(50) NULL DEFAULT NULL,
  Address VARCHAR(75) NULL DEFAULT NULL,
  City VARCHAR(60) NULL DEFAULT NULL,
  StateID VARCHAR(2) NULL DEFAULT NULL,
  ZipCode VARCHAR(12) NULL DEFAULT NULL,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  LocationURL VARCHAR(99) NULL DEFAULT NULL,
  LocationPhone VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (LegalEntityGUID),
  CONSTRAINT FK_refdata_location_states
    FOREIGN KEY (StateID)
    REFERENCES refdata_usstates (StateID),
  CONSTRAINT FK_refdata_location_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_organization
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_organization ;

CREATE TABLE refdata_organization (
  OrganizationGUID CHAR(38) NOT NULL,
  OrganizationInternalCode VARCHAR(10) NULL DEFAULT NULL,
  OrganizationInternalID VARCHAR(10) NULL DEFAULT NULL,
  OrganizationName VARCHAR(50) NULL DEFAULT NULL,
  Address VARCHAR(75) NULL DEFAULT NULL,
  City VARCHAR(60) NULL DEFAULT NULL,
  StateID VARCHAR(2) NULL DEFAULT NULL,
  ZipCode VARCHAR(12) NULL DEFAULT NULL,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  LegalEntityGUID VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (OrganizationGUID),
  CONSTRAINT FK_refdata_organization_legalentity
    FOREIGN KEY (LegalEntityGUID)
    REFERENCES refdata_legalentity (LegalEntityGUID),
  CONSTRAINT FK_refdata_organization_states
    FOREIGN KEY (StateID)
    REFERENCES refdata_usstates (StateID),
  CONSTRAINT FK_refdata_organization_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_platformparams
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_platformparams ;

CREATE TABLE refdata_platformparams (
  PlatformParamsID SMALLINT NOT NULL AUTO_INCREMENT,
  PlatformParamValues VARCHAR(35) NULL DEFAULT NULL,
  PlatformParamDesc VARCHAR(70) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  PRIMARY KEY (PlatformParamsID),
  CONSTRAINT FK_refdata_platformparams_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))

-- -----------------------------------------------------
-- Table refdata_platformparamstodataattributes
-- -----------------------------------------------------
DROP TABLE IF EXISTS refdata_platformparamstodataattributes ;

CREATE TABLE refdata_platformparamstodataattributes (
  PlatformParamsToDataAttributeID AUTOINCREMENT start 1 end 1,
  PlatformParamsID SMALLINT NULL DEFAULT NULL,
  DataAttributeID SMALLINT NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  RegisteredApp VARCHAR(38) NULL DEFAULT NULL,
  PRIMARY KEY (PlatformParamsToDataAttributeID),
  CONSTRAINT FK_refdata_platformparamstodataattributes_dataattributes
    FOREIGN KEY (DataAttributeID)
    REFERENCES platform_dataattributes (PlatformDataAttributesID),
  CONSTRAINT FK_refdata_platformparamstodataattributes_platformparams
    FOREIGN KEY (PlatformParamsID)
    REFERENCES refdata_platformparams (PlatformParamsID),
  CONSTRAINT FK_refdata_platformparamstodataattributes_registeredapp
    FOREIGN KEY (RegisteredApp)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_refdata_platformparamstodataattributes_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID));


-- -----------------------------------------------------
-- Table terms_codesetstoapplication
-- -----------------------------------------------------
DROP TABLE IF EXISTS terms_codesetstoapplication ;

CREATE TABLE terms_codesetstoapplication (
  CodeSetToApplicationID BIGINT NOT NULL AUTO_INCREMENT,
  CodeSetsID BIGINT NOT NULL,
  Domain VARCHAR(50) NULL DEFAULT NULL,
  IndustryStd VARCHAR(6) NULL DEFAULT NULL,
  SpecificDetails VARCHAR(99) NULL DEFAULT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  OrganizationID VARCHAR(38) NULL DEFAULT NULL,
  ApplicationID VARCHAR(38) NULL DEFAULT NULL,
  VendorID INT NULL DEFAULT NULL,
  CodeValue VARCHAR(20) NULL DEFAULT NULL,
  CodeDesc VARCHAR(129) NULL DEFAULT NULL,
  SensitiveFlagID SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (CodeSetToApplicationID),
  CONSTRAINT FK_terms_codesetstoapplication_Application
    FOREIGN KEY (ApplicationID)
    REFERENCES refdata_application (AppGUID),
  CONSTRAINT FK_terms_codesetstoapplication_codeset
    FOREIGN KEY (CodeSetsID)
    REFERENCES refdata_codeset (CodeSetsID),
  CONSTRAINT FK_terms_codesetstoapplication_industrystd
    FOREIGN KEY (IndustryStd)
    REFERENCES refdata_industrystd (IndustryStd),
  CONSTRAINT FK_terms_codesetstoapplication_Org
    FOREIGN KEY (OrganizationID)
    REFERENCES refdata_organization (OrganizationGUID),
  CONSTRAINT FK_terms_codesetstoapplication_sensitiveflag
    FOREIGN KEY (SensitiveFlagID)
    REFERENCES refdata_sensitivityflag (SensitiveFlagID),
  CONSTRAINT FK_terms_codesetstoapplication_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID),
  CONSTRAINT FK_terms_codesetstoapplication_Vendor
    FOREIGN KEY (VendorID)
    REFERENCES refdata_vendor (VendorID))

-- -----------------------------------------------------
-- Table terms_codesetstoapplicationvalues
-- -----------------------------------------------------
DROP TABLE IF EXISTS terms_codesetstoapplicationvalues ;

CREATE TABLE terms_codesetstoapplicationvalues (
  CodeSetToApplicationValuesID BIGINT NOT NULL AUTO_INCREMENT,
  CodeSetToApplicationID BIGINT NULL DEFAULT NULL,
  CodeSetsID BIGINT NOT NULL,
  CreatedDate DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  StatusID SMALLINT NULL DEFAULT 1,
  CreatedUser VARCHAR(20) NULL DEFAULT NULL,
  TermValue VARCHAR(20) NULL DEFAULT NULL,
  TermValueLow VARCHAR(10) NULL DEFAULT NULL,
  TermValueHigh VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (CodeSetToApplicationValuesID),
  CONSTRAINT FK_terms_codesetstoapplicationvalues_codeset
    FOREIGN KEY (CodeSetsID)
    REFERENCES refdata_codeset (CodeSetsID),
  CONSTRAINT FK_terms_codesetstoapplicationvalues_codesettoapp
    FOREIGN KEY (CodeSetToApplicationID)
    REFERENCES terms_codesetstoapplication (CodeSetToApplicationID),
  CONSTRAINT FK_terms_codesetstoapplicationvalues_status
    FOREIGN KEY (StatusID)
    REFERENCES refdata_status (StatusID))
