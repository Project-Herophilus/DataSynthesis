-- datasynthesis.datamodel_datatables definition

CREATE TABLE `datamodel_datatables` (
  `TableName` varchar(64) CHARACTER SET utf8 COLLATE utf8_tolower_ci NOT NULL,
  `TableInformation` varchar(249) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TableName`),
  KEY `IDX_datamodel_datatables` (`TableName`,`TableInformation`,`StatusID`,`CreatedDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_status definition

CREATE TABLE `refdata_status` (
  `StatusID` smallint NOT NULL AUTO_INCREMENT,
  `StatusDescription` varchar(45) NOT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedUser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StatusID`),
  KEY `IX_RefStatus` (`StatusID`,`StatusDescription`,`CreatedDate`,`CreatedUser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.auditing_datarequest definition

CREATE TABLE `auditing_datarequest` (
  `DataRequestID` bigint NOT NULL AUTO_INCREMENT,
  `DataRequestDate` datetime(3) DEFAULT NULL,
  `CreatedByUser` varchar(20) DEFAULT NULL,
  `Organizaton` varchar(38) DEFAULT NULL,
  `Application` varchar(38) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DataRequestID`),
  KEY `FK_platform_datarequest_status` (`StatusID`),
  KEY `IDX_platform_datarequest` (`DataRequestID`,`DataRequestDate`,`CreatedByUser`,`Organizaton`,`Application`,`StatusID`,`CreatedDate`) USING BTREE,
  CONSTRAINT `FK_platform_datarequest_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.databuilt_address definition

CREATE TABLE `databuilt_address` (
  `CompleteAddressID` bigint NOT NULL AUTO_INCREMENT,
  `Address1` varchar(99) DEFAULT NULL,
  `City` varchar(70) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`CompleteAddressID`),
  KEY `FK_databuilt_address_status` (`StatusID`),
  KEY `IDX_databuilt_completeaddress` (`CompleteAddressID`,`Address1`,`City`,`StateID`,`ZipCode`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_address_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.databuilt_bankaccount definition

CREATE TABLE `databuilt_bankaccount` (
  `DataBuiltBankAccountsID` bigint NOT NULL AUTO_INCREMENT,
  `BankAccountNumber` varchar(12) DEFAULT NULL,
  `BankAccountName` varchar(75) DEFAULT NULL,
  `BankRoutingID` varchar(9) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltBankAccountsID`),
  KEY `fk_databuilt_bankAccounts_status` (`StatusID`),
  KEY `IX_databuilt_bankAccounts` (`DataBuiltBankAccountsID`,`BankAccountName`,`BankAccountNumber`,`BankRoutingID`,`StatusID`,`CreatedDate`,`RegisteredApp`),
  CONSTRAINT `fk_databuilt_bankAccounts_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.databuilt_corporations definition

CREATE TABLE `databuilt_corporations` (
  `DataBuiltCorporationID` bigint NOT NULL AUTO_INCREMENT,
  `CorporationName` varchar(99) DEFAULT NULL,
  `Address1` varchar(99) DEFAULT NULL,
  `City` varchar(70) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltCorporationID`),
  KEY `FK_databuilt_corporations_status` (`StatusID`),
  KEY `IDX_databuilt_completeaddress` (`DataBuiltCorporationID`,`CorporationName`,`Address1`,`City`,`StateID`,`ZipCode`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_corporations_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.databuilt_names definition

CREATE TABLE `databuilt_names` (
  `DataBuiltNamesID` bigint NOT NULL AUTO_INCREMENT,
  `CompleteName` varchar(100) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltNamesID`),
  KEY `FK_databuilt_completenames_status` (`StatusID`),
  KEY `IX_databuilt_names_databuiltnamesid` (`DataBuiltNamesID`,`CompleteName`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_completenames_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.databuilt_phonenumbers definition

CREATE TABLE `databuilt_phonenumbers` (
  `DataBuiltPhoneNumbersID` bigint NOT NULL AUTO_INCREMENT,
  `AreaCode` varchar(3) DEFAULT NULL,
  `PhoneNumber` varchar(8) DEFAULT NULL,
  `CompletePhoneNumber` varchar(14) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltPhoneNumbersID`),
  KEY `FK_databuilt_phonenumbers_status` (`StatusID`),
  KEY `IX_databuilt_phonenumbers` (`DataBuiltPhoneNumbersID`,`AreaCode`,`PhoneNumber`,`CompletePhoneNumber`,`StatusID`,`CreatedDate`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_phonenumbers_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `IDX_databuilt_phonenumbers_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.databuilt_products definition

CREATE TABLE `databuilt_products` (
  `DatabuiltProductsID` bigint NOT NULL AUTO_INCREMENT,
  `ProductID` varchar(20) DEFAULT NULL,
  `ProductName` varchar(99) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DatabuiltProductsID`),
  KEY `FK_databuilt_products_status` (`StatusID`),
  KEY `IDX_databuilt_products` (`DatabuiltProductsID`,`ProductID`,`ProductName`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_products_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_ababanking definition

CREATE TABLE `dataexisting_ababanking` (
  `ABABankingID` bigint NOT NULL AUTO_INCREMENT,
  `RoutingNumber` varchar(9) DEFAULT NULL,
  `TelegraphicName` varchar(20) DEFAULT NULL,
  `CustomerName` varchar(36) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(5) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`ABABankingID`),
  KEY `FK_ABABanking_Status` (`StatusID`),
  KEY `IX_ABABanking` (`ABABankingID`,`RoutingNumber`,`TelegraphicName`,`CustomerName`,`City`,`State`,`ZipCode`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_ABABanking_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=10115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_companies definition

CREATE TABLE `dataexisting_companies` (
  `CompaniesID` bigint NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(79) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`CompaniesID`),
  KEY `FK_Companies_Status` (`StatusID`),
  KEY `IX_Companies` (`CompaniesID`,`CompanyName`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_Companies_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=948 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_namefirst definition

CREATE TABLE `dataexisting_namefirst` (
  `FirstNameID` bigint NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(39) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`FirstNameID`),
  UNIQUE KEY `IX_Unique_NameFirst` (`FirstName`,`RegisteredApp`),
  KEY `FK_NameFirst_Status` (`StatusID`),
  KEY `IX_NameFirst` (`FirstNameID`,`FirstName`,`Gender`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_NameFirst_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=301552 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_namelast definition

CREATE TABLE `dataexisting_namelast` (
  `LastNameID` bigint NOT NULL AUTO_INCREMENT,
  `LastName` varchar(69) DEFAULT NULL,
  `StatusID` smallint NOT NULL DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`LastNameID`),
  UNIQUE KEY `IX_Unique_NameLast` (`LastName`,`RegisteredApp`),
  KEY `FK_NameLast_Status` (`StatusID`),
  KEY `IX_NameLast` (`LastNameID`,`LastName`,`StatusID`,`CreatedDate`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_NameLast_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=601224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_upccodes definition

CREATE TABLE `dataexisting_upccodes` (
  `UPCCodeID` bigint NOT NULL AUTO_INCREMENT,
  `UPCCodeName` varchar(15) DEFAULT NULL,
  `UPCProductName` varchar(150) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`UPCCodeID`),
  KEY `FK_UPCCodes_Status` (`StatusID`),
  KEY `IX_UPCCodes` (`UPCCodeID`,`UPCCodeName`,`UPCProductName`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_UPCCodes_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=46529 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_zipcodeus definition

CREATE TABLE `dataexisting_zipcodeus` (
  `ZipCodeID` bigint NOT NULL AUTO_INCREMENT,
  `ZipCode` char(5) NOT NULL,
  `ZipCodeType` varchar(15) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `Lattitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `Location` varchar(99) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`ZipCodeID`),
  KEY `FK_ZipcodeUS_Status` (`StatusID`),
  KEY `IDX_dataexisting_zipcodeus` (`ZipCodeID`,`ZipCode`,`ZipCodeType`,`City`,`State`,`Lattitude`,`Longitude`,`Location`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_ZipcodeUS_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=41862 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_accountnumbers definition

CREATE TABLE `datagenerated_accountnumbers` (
  `AccountNumbersID` bigint NOT NULL AUTO_INCREMENT,
  `AccountNumberValue` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`AccountNumbersID`),
  UNIQUE KEY `IX_Unqiue_AccountNumbers` (`AccountNumberValue`,`RegisteredApp`),
  KEY `FK_datagenerated_accountnumbers_status` (`StatusID`),
  KEY `IX_AccountNumbers` (`AccountNumbersID`,`AccountNumberValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_AccountNumbers_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_accountnumbers` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_bankaccount definition

CREATE TABLE `datagenerated_bankaccount` (
  `BankAccountsID` bigint NOT NULL AUTO_INCREMENT,
  `BankAccountValue` varchar(17) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`BankAccountsID`),
  UNIQUE KEY `IX_Unqiue_BankAccounts` (`BankAccountValue`,`RegisteredApp`),
  KEY `FK_BankAccounts_Status` (`StatusID`),
  KEY `IX_BankAccounts` (`BankAccountsID`,`BankAccountValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_BankAccounts_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=74998 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_creditcard definition

CREATE TABLE `datagenerated_creditcard` (
  `CreditCardID` bigint NOT NULL AUTO_INCREMENT,
  `CreditCardNumber` varchar(20) DEFAULT NULL,
  `CreditCardName` varchar(10) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`CreditCardID`),
  KEY `FK_CreditCard_Status` (`StatusID`),
  KEY `IX_CreditCard` (`CreditCardID`,`CreditCardNumber`,`CreditCardName`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_CreditCard_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=75001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_dateofbirth definition

CREATE TABLE `datagenerated_dateofbirth` (
  `DateofBirthsID` bigint NOT NULL AUTO_INCREMENT,
  `DateOfBirth` varchar(12) DEFAULT NULL,
  `DateOfBirthDate` date DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`DateofBirthsID`),
  UNIQUE KEY `IX_Unique_DateOfBirths` (`DateOfBirth`,`DateOfBirthDate`,`RegisteredApp`),
  KEY `FK_DateOfBirths_Status` (`StatusID`),
  KEY `IX_DateOfBirths` (`DateofBirthsID`,`DateOfBirth`,`DateOfBirthDate`,`Age`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_DateOfBirths_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=30000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_ein definition

CREATE TABLE `datagenerated_ein` (
  `EINID` bigint NOT NULL AUTO_INCREMENT,
  `EINValue` varchar(10) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`EINID`),
  UNIQUE KEY `IX_Unique_EIN` (`EINValue`,`RegisteredApp`),
  KEY `FK_EIN_Status` (`StatusID`),
  KEY `IX_EIN` (`EINID`,`EINValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_EIN_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_phonenumber definition

CREATE TABLE `datagenerated_phonenumber` (
  `PhoneNumberID` bigint NOT NULL AUTO_INCREMENT,
  `PhoneNumberValue` varchar(8) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`PhoneNumberID`),
  UNIQUE KEY `IX_Unique_PhoneNumbers` (`PhoneNumberValue`,`RegisteredApp`),
  KEY `FK_PhoneNumbers_Status` (`StatusID`),
  KEY `IX_PhoneNumbers` (`PhoneNumberID`,`PhoneNumberValue`,`RegisteredApp`,`CreatedUser`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_PhoneNumbers_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=74623 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_socialsecuritynumber definition

CREATE TABLE `datagenerated_socialsecuritynumber` (
  `SocialSecurityNumberID` bigint NOT NULL AUTO_INCREMENT,
  `SocialSecurityNumberValue` varchar(11) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`SocialSecurityNumberID`),
  UNIQUE KEY `IX_Unique_SocialSecurityNumbers` (`SocialSecurityNumberValue`,`RegisteredApp`),
  KEY `FK_SocialSecurityNumber_Status` (`StatusID`),
  KEY `IX_SocialSecurityNumber` (`SocialSecurityNumberID`,`SocialSecurityNumberValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_SocialSecurityNumber_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=78214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_useridentities definition

CREATE TABLE `datagenerated_useridentities` (
  `UserIdentitiesID` bigint NOT NULL AUTO_INCREMENT,
  `UserIdentityValue` varchar(20) DEFAULT NULL,
  `UserDomain` varchar(20) DEFAULT NULL,
  `AdditionalAttributes` varchar(40) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`UserIdentitiesID`),
  UNIQUE KEY `IX_Unique_UserIdentities` (`UserIdentityValue`,`UserDomain`,`RegisteredApp`),
  KEY `FK_UserIdentities_Status` (`StatusID`),
  KEY `IX_UserIdentities` (`UserIdentitiesID`,`UserIdentityValue`,`UserDomain`,`CreatedDate`,`StatusID`,`AdditionalAttributes`,`RegisteredApp`),
  CONSTRAINT `FK_UserIdentities_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_rulesets definition

CREATE TABLE `platform_rulesets` (
  `RuleID` bigint NOT NULL AUTO_INCREMENT,
  `RuleName` varchar(65) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `ExpirationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RuleID`),
  KEY `IX_PlatformRuleSets` (`RuleID`,`RuleName`,`CreatedUser`,`CreatedDate`,`ExpirationDate`,`StatusID`),
  KEY `FK_platform_rulesets_status` (`StatusID`),
  CONSTRAINT `FK_platform_rulesets_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_rulesetsattributes definition

CREATE TABLE `platform_rulesetsattributes` (
  `RulesetAttributeID` bigint NOT NULL AUTO_INCREMENT,
  `RuleSetAttributeDesc` varchar(75) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  PRIMARY KEY (`RulesetAttributeID`),
  KEY `FK_platform_rulesetsattributes_status` (`StatusID`),
  KEY `IDX_PlatformRuleSetsAttributes` (`RuleSetAttributeDesc`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_platform_rulesetsattributes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_addressformattype definition

CREATE TABLE `refdata_addressformattype` (
  `AddressFormatTypeID` smallint NOT NULL AUTO_INCREMENT,
  `AddressFormatTypeDesc` varchar(35) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusId` smallint DEFAULT '1',
  PRIMARY KEY (`AddressFormatTypeID`),
  KEY `FK_AddressFormatType_Status` (`StatusId`),
  KEY `IDX_refdata_addressformattype_AddressFormatTypeID` (`AddressFormatTypeID`,`AddressFormatTypeDesc`,`CreatedDate`,`StatusId`),
  KEY `IX_AddressFormatType` (`AddressFormatTypeID`,`AddressFormatTypeDesc`,`CreatedDate`,`StatusId`),
  CONSTRAINT `FK_AddressFormatType_Status` FOREIGN KEY (`StatusId`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_countries definition

CREATE TABLE `refdata_countries` (
  `CountryID` smallint NOT NULL AUTO_INCREMENT,
  `IDD` varchar(5) DEFAULT NULL,
  `CountryName` varchar(59) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  PRIMARY KEY (`CountryID`),
  KEY `FK_Countries_Status` (`StatusID`),
  KEY `IX_Countries` (`CountryID`,`IDD`,`CountryName`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_Countries_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_industrystd definition

CREATE TABLE `refdata_industrystd` (
  `IndustryStd` varchar(6) NOT NULL,
  `IndustryStdDesc` varchar(30) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  PRIMARY KEY (`IndustryStd`),
  KEY `IX_IndustryStd` (`IndustryStd`,`IndustryStdDesc`,`CreatedDate`,`StatusID`),
  KEY `FK_refdata_industrystd_status` (`StatusID`),
  CONSTRAINT `FK_refdata_industrystd_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_operationtype definition

CREATE TABLE `refdata_operationtype` (
  `OperationTypeID` varchar(7) NOT NULL,
  `OperationTypeName` varchar(60) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  PRIMARY KEY (`OperationTypeID`),
  KEY `FK_refdata_operationtype_status` (`StatusID`),
  KEY `IX_OperationType` (`OperationTypeID`,`OperationTypeName`,`StatusID`,`CreatedDate`),
  CONSTRAINT `FK_refdata_operationtype_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_sensitivityflag definition

CREATE TABLE `refdata_sensitivityflag` (
  `SensitiveFlagID` smallint NOT NULL AUTO_INCREMENT,
  `SensitiveFlagDesc` varchar(30) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  PRIMARY KEY (`SensitiveFlagID`),
  KEY `IX_SensitivityFlag` (`SensitiveFlagID`,`SensitiveFlagDesc`,`StatusID`,`CreatedDate`),
  KEY `FK_refdata_sensitivityflag_status` (`StatusID`),
  CONSTRAINT `FK_refdata_sensitivityflag_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_timezones definition

CREATE TABLE `refdata_timezones` (
  `TimeZoneValue` varchar(3) NOT NULL,
  `TimeZoneDesc` varchar(25) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  PRIMARY KEY (`TimeZoneValue`),
  KEY `FK_TimeZones_Status` (`StatusID`),
  KEY `IX_TimeZones` (`TimeZoneValue`,`TimeZoneDesc`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_TimeZones_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_usstates definition

CREATE TABLE `refdata_usstates` (
  `StateID` varchar(2) NOT NULL,
  `StateDescription` varchar(65) DEFAULT NULL,
  `Lattitude` varchar(12) DEFAULT NULL,
  `Longitude` varchar(12) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StateID`),
  KEY `FK_USStates_Status` (`StatusID`),
  KEY `IX_USStates` (`StateID`,`StateDescription`,`Lattitude`,`Longitude`,`CreatedDate`,`StatusID`,`CreatedUser`),
  CONSTRAINT `FK_USStates_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_vendor definition

CREATE TABLE `refdata_vendor` (
  `VendorID` int NOT NULL AUTO_INCREMENT,
  `VendorName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `VendorGUID` char(38) DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  KEY `IX_RefData_Vendors` (`VendorID`,`VendorName`,`StatusID`,`VendorGUID`,`CreatedDate`,`CreatedUser`),
  KEY `FK_refdata_vendors_status` (`StatusID`),
  CONSTRAINT `FK_refdata_vendors_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_areacode definition

CREATE TABLE `dataexisting_areacode` (
  `AreaCodeID` bigint NOT NULL AUTO_INCREMENT,
  `AreaCodeValue` varchar(3) NOT NULL,
  `TimeZone` varchar(3) DEFAULT NULL,
  `StateCode` varchar(2) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`AreaCodeID`),
  KEY `FK_AreaCode_Status` (`StatusID`),
  KEY `FK_AreaCode_TimeZones` (`TimeZone`),
  KEY `FK_AreaCode_USStates` (`StateCode`),
  KEY `IX_AreaCode` (`AreaCodeValue`,`TimeZone`,`StateCode`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_AreaCode_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_AreaCode_TimeZones` FOREIGN KEY (`TimeZone`) REFERENCES `refdata_timezones` (`TimeZoneValue`),
  CONSTRAINT `FK_AreaCode_USStates` FOREIGN KEY (`StateCode`) REFERENCES `refdata_usstates` (`StateID`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_areacodeintl definition

CREATE TABLE `dataexisting_areacodeintl` (
  `IDDCode` varchar(5) NOT NULL,
  `CountryID` smallint DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`IDDCode`),
  KEY `FK_AreaCodeIntl_Countries` (`CountryID`),
  KEY `FK_AreaCodeIntl_Status` (`StatusID`),
  KEY `IX_AreaCodeIntl` (`IDDCode`,`CountryID`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_AreaCodeIntl_Countries` FOREIGN KEY (`CountryID`) REFERENCES `refdata_countries` (`CountryID`),
  CONSTRAINT `FK_AreaCodeIntl_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.dataexisting_zipcodeintl definition

CREATE TABLE `dataexisting_zipcodeintl` (
  `ZipCodeIntnlID` int NOT NULL AUTO_INCREMENT,
  `ZipCode` char(10) NOT NULL,
  `ZipCodeType` varchar(15) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `Country` smallint DEFAULT NULL,
  `Lattitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `Location` varchar(99) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`ZipCodeIntnlID`),
  KEY `FK_ZipcodeIntl_Countries` (`Country`),
  KEY `FK_ZipcodeIntl_Status` (`StatusID`),
  KEY `IX_ZipcodeIntl` (`ZipCodeIntnlID`,`ZipCode`,`ZipCodeType`,`Country`,`City`,`Lattitude`,`Longitude`,`Location`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_ZipcodeIntl_Countries` FOREIGN KEY (`Country`) REFERENCES `refdata_countries` (`CountryID`),
  CONSTRAINT `FK_ZipcodeIntl_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_addresses definition

CREATE TABLE `datagenerated_addresses` (
  `AddressID` bigint NOT NULL AUTO_INCREMENT,
  `AddressStreet` varchar(99) DEFAULT NULL,
  `AddressStreet2` varchar(59) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `AddressFormatTypeId` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `IX_Unique_Addresses` (`AddressStreet`,`AddressStreet2`,`RegisteredApp`),
  KEY `FK_Addresses_AddressFormatType` (`AddressFormatTypeId`),
  KEY `FK_datagenerated_addresses_status` (`StatusID`),
  KEY `IX_Addresses` (`AddressID`,`AddressStreet`,`AddressStreet2`,`AddressFormatTypeId`,`StatusID`,`CreatedDate`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_Addresses_AddressFormatType` FOREIGN KEY (`AddressFormatTypeId`) REFERENCES `refdata_addressformattype` (`AddressFormatTypeID`),
  CONSTRAINT `FK_datagenerated_addresses_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=33110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_driverslicenses definition

CREATE TABLE `datagenerated_driverslicenses` (
  `DriversLicensesID` bigint NOT NULL AUTO_INCREMENT,
  `DLN` varchar(25) DEFAULT NULL,
  `StateCode` varchar(2) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CompleteDriversLicenseNumber` varchar(30) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`DriversLicensesID`),
  UNIQUE KEY `IX_Unique_DriversLicenses` (`DLN`,`StateCode`,`CompleteDriversLicenseNumber`,`RegisteredApp`),
  KEY `FK_DriversLicenses_Status` (`StatusID`),
  KEY `FK_DriversLicenses_USStates` (`StateCode`),
  KEY `IX_DriversLicenses` (`DriversLicensesID`,`CreatedDate`,`DLN`,`StateCode`,`StatusID`,`CompleteDriversLicenseNumber`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_DriversLicenses_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_DriversLicenses_USStates` FOREIGN KEY (`StateCode`) REFERENCES `refdata_usstates` (`StateID`)
) ENGINE=InnoDB AUTO_INCREMENT=184000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.datagenerated_phonenumbersintl definition

CREATE TABLE `datagenerated_phonenumbersintl` (
  `PhoneNumberIntlID` bigint NOT NULL AUTO_INCREMENT,
  `PhoneNumberValue` varchar(12) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CountryId` smallint DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`PhoneNumberIntlID`),
  KEY `FK_PhoneNumbersIntl_Country` (`CountryId`),
  KEY `FK_PhoneNumbersIntl_Status` (`StatusID`),
  KEY `IX_PhoneNumbersIntl` (`PhoneNumberIntlID`,`PhoneNumberValue`,`CountryId`,`CreatedDate`,`CreatedUser`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_PhoneNumbersIntl_Country` FOREIGN KEY (`CountryId`) REFERENCES `refdata_countries` (`CountryID`),
  CONSTRAINT `FK_PhoneNumbersIntl_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_application definition

CREATE TABLE `refdata_application` (
  `AppGUID` char(38) NOT NULL,
  `ApplicationCustomCode` varchar(15) DEFAULT NULL,
  `ApplicationDesc` varchar(50) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `VendorID` int DEFAULT NULL,
  PRIMARY KEY (`AppGUID`),
  KEY `FK_refdata_application_status` (`StatusID`),
  KEY `FK_refdata_application_vendors` (`VendorID`),
  KEY `IX_RefData_Application` (`AppGUID`,`ApplicationCustomCode`,`ApplicationDesc`,`CreatedUser`,`CreatedDate`,`StatusID`,`VendorID`),
  CONSTRAINT `FK_refdata_application_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_refdata_application_vendors` FOREIGN KEY (`VendorID`) REFERENCES `refdata_vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_codeset definition

CREATE TABLE `refdata_codeset` (
  `CodeSetsID` bigint NOT NULL AUTO_INCREMENT,
  `CodeSetName` varchar(50) DEFAULT NULL,
  `IndustryStd` varchar(6) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `CodesetGUID` char(38) DEFAULT NULL,
  `FieldMapping` varchar(20) DEFAULT NULL,
  `SensitivityFlagID` smallint DEFAULT NULL,
  PRIMARY KEY (`CodeSetsID`),
  KEY `FK_refdata_codesets_status` (`StatusID`),
  KEY `FK_refdata_codeset_industrystd` (`IndustryStd`),
  KEY `IX_RefData_CodeSets` (`CodeSetsID`,`CodeSetName`,`IndustryStd`,`CreatedDate`,`StatusID`,`CreatedUser`,`CodesetGUID`,`FieldMapping`,`SensitivityFlagID`),
  KEY `FK_refdata_codeset_sensitivityflag` (`SensitivityFlagID`),
  CONSTRAINT `FK_refdata_codeset_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_refdata_codeset_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_refdata_codesets_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_legalentity definition

CREATE TABLE `refdata_legalentity` (
  `LegalEntityGUID` char(38) NOT NULL,
  `LocationName` varchar(50) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(60) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(12) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LocationURL` varchar(99) DEFAULT NULL,
  `LocationPhone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`LegalEntityGUID`),
  KEY `FK_refdata_location_states` (`StateID`),
  KEY `FK_refdata_location_status` (`StatusID`),
  CONSTRAINT `FK_refdata_location_states` FOREIGN KEY (`StateID`) REFERENCES `refdata_usstates` (`StateID`),
  CONSTRAINT `FK_refdata_location_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.refdata_organization definition

CREATE TABLE `refdata_organization` (
  `OrganizationGUID` char(38) NOT NULL,
  `OrganizationInternalCode` varchar(10) DEFAULT NULL,
  `OrganizationInternalID` varchar(10) DEFAULT NULL,
  `OrganizationName` varchar(50) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(60) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(12) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LegalEntityGUID` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`OrganizationGUID`),
  KEY `FK_refdata_organization_status` (`StatusID`),
  KEY `FK_refdata_organization_states` (`StateID`),
  KEY `IX_RefData_Organization` (`OrganizationGUID`,`OrganizationName`,`Address`,`City`,`StateID`,`ZipCode`,`CreatedDate`,`StatusID`,`CreatedUser`,`OrganizationInternalCode`,`OrganizationInternalID`,`LegalEntityGUID`),
  KEY `FK_refdata_organization_legalentity` (`LegalEntityGUID`),
  CONSTRAINT `FK_refdata_organization_legalentity` FOREIGN KEY (`LegalEntityGUID`) REFERENCES `refdata_legalentity` (`LegalEntityGUID`),
  CONSTRAINT `FK_refdata_organization_states` FOREIGN KEY (`StateID`) REFERENCES `refdata_usstates` (`StateID`),
  CONSTRAINT `FK_refdata_organization_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.terms_codesetstoapplication definition

CREATE TABLE `terms_codesetstoapplication` (
  `CodeSetToApplicationID` bigint NOT NULL AUTO_INCREMENT,
  `CodeSetsID` bigint NOT NULL,
  `Domain` varchar(50) DEFAULT NULL,
  `IndustryStd` varchar(6) DEFAULT NULL,
  `SpecificDetails` varchar(99) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `OrganizationID` varchar(38) DEFAULT NULL,
  `ApplicationID` varchar(38) DEFAULT NULL,
  `VendorID` int DEFAULT NULL,
  `CodeValue` varchar(20) DEFAULT NULL,
  `CodeDesc` varchar(129) DEFAULT NULL,
  `SensitiveFlagID` smallint DEFAULT NULL,
  PRIMARY KEY (`CodeSetToApplicationID`),
  KEY `FK_terms_codesetstoapplication_Application` (`ApplicationID`),
  KEY `FK_terms_codesetstoapplication_Org` (`OrganizationID`),
  KEY `FK_terms_codesetstoapplication_industrystd` (`IndustryStd`),
  KEY `FK_terms_codesetstoapplication_status` (`StatusID`),
  KEY `terms_codesetstoapplication_Vendor` (`VendorID`),
  KEY `terms_codesetstoapplication_codeset` (`CodeSetsID`),
  KEY `IX_Terms_CodeSetsToApplication` (`CodeSetToApplicationID`,`CodeSetsID`,`Domain`,`IndustryStd`,`SpecificDetails`,`CreatedDate`,`CreatedUser`,`OrganizationID`,`ApplicationID`,`StatusID`,`VendorID`,`SensitiveFlagID`),
  KEY `FK_terms_codesetstoapplication_sensitiveflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_terms_codesetstoapplication_Application` FOREIGN KEY (`ApplicationID`) REFERENCES `refdata_application` (`AppGUID`),
  CONSTRAINT `FK_terms_codesetstoapplication_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_terms_codesetstoapplication_Org` FOREIGN KEY (`OrganizationID`) REFERENCES `refdata_organization` (`OrganizationGUID`),
  CONSTRAINT `FK_terms_codesetstoapplication_sensitiveflag` FOREIGN KEY (`SensitiveFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_terms_codesetstoapplication_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `terms_codesetstoapplication_codeset` FOREIGN KEY (`CodeSetsID`) REFERENCES `refdata_codeset` (`CodeSetsID`),
  CONSTRAINT `terms_codesetstoapplication_Vendor` FOREIGN KEY (`VendorID`) REFERENCES `refdata_vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_appsetting definition

CREATE TABLE `platform_appsetting` (
  `AppSettingsID` smallint NOT NULL AUTO_INCREMENT,
  `AppSettingName` varchar(50) DEFAULT NULL,
  `AppSettingValue` varchar(199) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`AppSettingsID`),
  KEY `FK_platform_appsettings_registeredapp` (`RegisteredApp`),
  KEY `FK_refdata_appsettings_status` (`StatusID`),
  KEY `IX_RefDataAppSettings` (`AppSettingsID`,`AppSettingName`,`AppSettingValue`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_platform_appsettings_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `refdata_organization` (`OrganizationGUID`),
  CONSTRAINT `FK_refdata_appsettings_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_dataattributes definition

CREATE TABLE `platform_dataattributes` (
  `PlatformDataAttributesID` smallint NOT NULL AUTO_INCREMENT,
  `DataAttributeName` varchar(50) DEFAULT NULL,
  `SensitivityFlagID` smallint DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `PlatformDataAttributeGUID` char(38) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`PlatformDataAttributesID`),
  KEY `IX_PlatformDataAttributes` (`PlatformDataAttributesID`,`DataAttributeName`,`SensitivityFlagID`,`CreatedDate`,`StatusID`,`CreatedUser`,`PlatformDataAttributeGUID`,`RegisteredApp`),
  KEY `FK_platformdataattributes_status` (`StatusID`),
  KEY `FK_platformdataattributes_sensitivtyflag` (`SensitivityFlagID`),
  KEY `FK_platform_dataattributes_registeredapp` (`RegisteredApp`),
  CONSTRAINT `FK_platform_dataattributes_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `refdata_application` (`AppGUID`),
  CONSTRAINT `FK_platformdataattributes_sensitivtyflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_platformdataattributes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_datastructures definition

CREATE TABLE `platform_datastructures` (
  `PlatformDataStructuresID` smallint NOT NULL AUTO_INCREMENT,
  `DataStructureName` varchar(50) DEFAULT NULL,
  `SensitivityFlagID` smallint DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `PlatformDataStructuresGUID` char(38) DEFAULT NULL,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`PlatformDataStructuresID`),
  KEY `IX_PlatformDataStructures` (`PlatformDataStructuresID`,`DataStructureName`,`SensitivityFlagID`,`CreatedDate`,`StatusID`,`CreatedUser`,`PlatformDataStructuresGUID`,`RegisteredApp`),
  KEY `FK_platform_datastructures_status` (`StatusID`),
  KEY `FK_platform_datastructures__registeredapp` (`RegisteredApp`),
  KEY `FK_platform_datastructures_sensitivityflag` (`SensitivityFlagID`),
  CONSTRAINT `FK_platform_datastructures__registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `refdata_application` (`AppGUID`),
  CONSTRAINT `FK_platform_datastructures_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_platform_datastructures_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_datastructurestodataattributes definition

CREATE TABLE `platform_datastructurestodataattributes` (
  `PlatformDataStructuresToDataAttributesID` smallint NOT NULL AUTO_INCREMENT,
  `PlatformDataStructuresID` smallint DEFAULT NULL,
  `CompositeDataStructureName` varchar(50) DEFAULT NULL,
  `SensitivityFlagID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `PlatformDataStructuresToDataAttributesGUID` char(38) DEFAULT NULL,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  `PlatformDataAttributesID` smallint DEFAULT NULL,
  PRIMARY KEY (`PlatformDataStructuresToDataAttributesID`),
  KEY `FK_platform_datastructurestodataattributes_dataattributes` (`PlatformDataAttributesID`),
  KEY `FK_platform_datastructurestodataattributes_datastructure` (`PlatformDataStructuresID`),
  KEY `FK_platform_datastructurestodataattributes_registeredapp` (`RegisteredApp`),
  KEY `FK_platform_datastructurestodataattributes_sensitivityflag` (`SensitivityFlagID`),
  KEY `FK_platform_datastructurestodataattributes_status` (`StatusID`),
  KEY `IX_PlatformDataStructuresToDataAttributes` (`PlatformDataStructuresToDataAttributesID`,`PlatformDataStructuresToDataAttributesGUID`,`PlatformDataStructuresID`,`CompositeDataStructureName`,`SensitivityFlagID`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`,`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_dataattributes` FOREIGN KEY (`PlatformDataAttributesID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_datastructure` FOREIGN KEY (`PlatformDataStructuresID`) REFERENCES `platform_datastructures` (`PlatformDataStructuresID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `refdata_application` (`AppGUID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_rulesetsdefinitions definition

CREATE TABLE `platform_rulesetsdefinitions` (
  `RulesetDefinitionsID` char(38) NOT NULL,
  `RulesetDefinitionName` varchar(50) DEFAULT NULL,
  `RuleSetID` bigint DEFAULT NULL,
  `StepOrderID` smallint DEFAULT NULL,
  `OperationTypeID` varchar(7) DEFAULT NULL,
  `RulesetDefValue` char(40) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `EffectiveDate` timestamp NULL DEFAULT NULL,
  `ApplicationID` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`RulesetDefinitionsID`),
  KEY `FK_platform_rulesetsdefinitions_operationtype` (`OperationTypeID`),
  KEY `FK_platform_rulesetsdefinitions_registeredapp` (`ApplicationID`),
  KEY `FK_platform_rulesetsdefinitions_ruleset` (`RuleSetID`),
  KEY `FK_platform_rulesetsdefinitions_status` (`StatusID`),
  KEY `IX_PlatformRulesetsDefinitions` (`RulesetDefinitionsID`,`RuleSetID`,`RulesetDefinitionName`,`StepOrderID`,`OperationTypeID`,`RulesetDefValue`,`CreatedDate`,`EffectiveDate`,`StatusID`,`ApplicationID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_operationtype` FOREIGN KEY (`OperationTypeID`) REFERENCES `refdata_operationtype` (`OperationTypeID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_registeredapp` FOREIGN KEY (`ApplicationID`) REFERENCES `refdata_application` (`AppGUID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_ruleset` FOREIGN KEY (`RuleSetID`) REFERENCES `platform_rulesets` (`RuleID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.auditing_datarequestdetail definition

CREATE TABLE `auditing_datarequestdetail` (
  `DataRequestDetailID` bigint NOT NULL AUTO_INCREMENT,
  `DataRequestID` bigint DEFAULT NULL,
  `DataAttributeID` smallint DEFAULT NULL,
  `RecCount` bigint DEFAULT NULL,
  `RecordFormatDetails` varchar(75) DEFAULT NULL,
  `StatusID` smallint DEFAULT '1',
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`DataRequestDetailID`),
  KEY `FK_platform_datarequestdetail` (`StatusID`),
  KEY `FK_platform_datarequestdetail_dataattributes` (`DataAttributeID`),
  KEY `FK_platform_datarequestdetail_datarequest` (`DataRequestID`),
  KEY `IDX_platform_datarequestdetail` (`DataRequestDetailID`,`DataRequestID`,`DataAttributeID`,`RecCount`,`RecordFormatDetails`,`StatusID`,`CreatedDate`),
  CONSTRAINT `FK_platform_datarequestdetail` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_platform_datarequestdetail_dataattributes` FOREIGN KEY (`DataAttributeID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_datarequestdetail_datarequest` FOREIGN KEY (`DataRequestID`) REFERENCES `auditing_datarequest` (`DataRequestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- datasynthesis.platform_config_datagen definition

CREATE TABLE `platform_config_datagen` (
  `DataGenConfigID` smallint NOT NULL AUTO_INCREMENT,
  `DataTypeGenConfigName` varchar(25) DEFAULT NULL,
  `DataAttributeID` smallint DEFAULT NULL,
  `SpecialInstructions` varchar(99) DEFAULT NULL,
  `RunQuantity` int DEFAULT NULL,
  `MinuteInterval` smallint DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusID` smallint DEFAULT '1',
  `CreatedUser` varchar(20) DEFAULT NULL,
  `ApplicationID` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataGenConfigID`),
  KEY `FK_platform_datagenconfig_dataattributes` (`DataAttributeID`),
  KEY `FK_platform_datagenconfig_registeredapp` (`ApplicationID`),
  KEY `FK_platform_datagenconfig_status` (`StatusID`),
  KEY `IX_PlatformDataGenConfig` (`DataGenConfigID`,`DataAttributeID`,`DataTypeGenConfigName`,`RunQuantity`,`MinuteInterval`,`SpecialInstructions`,`CreatedDate`,`CreatedUser`,`StatusID`,`ApplicationID`),
  CONSTRAINT `FK_platform_datagenconfig_dataattributes` FOREIGN KEY (`DataAttributeID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_datagenconfig_registeredapp` FOREIGN KEY (`ApplicationID`) REFERENCES `refdata_application` (`AppGUID`),
  CONSTRAINT `FK_platform_datagenconfig_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;