-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for datasynthesis
DROP DATABASE IF EXISTS `datasynthesis`;
CREATE DATABASE IF NOT EXISTS `datasynthesis` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `datasynthesis`;

-- Dumping structure for table datasynthesis.auditing_dataplatform
DROP TABLE IF EXISTS `auditing_dataplatform`;
CREATE TABLE IF NOT EXISTS `auditing_dataplatform` (
  `DataPlatformID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DataProcessingDate` datetime(3) DEFAULT NULL,
  `CreatedByUser` varchar(20) DEFAULT NULL,
  `Organizaton` varchar(38) DEFAULT NULL,
  `Application` varchar(38) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `RecCount` int(11) DEFAULT NULL,
  `Component` varchar(20) DEFAULT NULL,
  `ActionName` varchar(20) DEFAULT NULL,
  `DurationToRun` int(11) DEFAULT NULL,
  `ActivityDetail` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`DataPlatformID`),
  KEY `FK_platform_dataplatform_status` (`StatusID`),
  KEY `IDX_platform_dataplatform` (`DataPlatformID`,`DataProcessingDate`,`CreatedByUser`,`Organizaton`,`Application`,`StatusID`,`CreatedDate`,`RecCount`,`Component`,`ActionName`,`DurationToRun`,`ActivityDetail`),
  CONSTRAINT `FK_platform_dataplatform_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.auditing_datarequest
DROP TABLE IF EXISTS `auditing_datarequest`;
CREATE TABLE IF NOT EXISTS `auditing_datarequest` (
  `DataRequestID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DataRequestDate` datetime(3) DEFAULT NULL,
  `CreatedByUser` varchar(20) DEFAULT NULL,
  `Organizaton` varchar(38) DEFAULT NULL,
  `Application` varchar(38) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `RecCount` int(11) DEFAULT NULL,
  `RecordDataRequest` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`DataRequestID`),
  KEY `FK_platform_datarequest_status` (`StatusID`),
  KEY `IDX_platform_datarequest` (`DataRequestID`,`DataRequestDate`,`CreatedByUser`,`Organizaton`,`Application`,`StatusID`,`CreatedDate`,`RecCount`,`RecordDataRequest`),
  CONSTRAINT `FK_platform_datarequest_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_ababanking
DROP TABLE IF EXISTS `dataexisting_ababanking`;
CREATE TABLE IF NOT EXISTS `dataexisting_ababanking` (
  `ABABankingID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RoutingNumber` varchar(9) DEFAULT NULL,
  `TelegraphicName` varchar(20) DEFAULT NULL,
  `CustomerName` varchar(36) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `StateCode` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(5) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`ABABankingID`),
  KEY `FK_dataexisting_ababanking_Status` (`StatusID`),
  KEY `FK_dataexisting_ababanking_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExisting_ABABanking` (`ABABankingID`,`RoutingNumber`,`TelegraphicName`,`CustomerName`,`City`,`State`,`ZipCode`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_ababanking_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_ababanking_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=10115 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_areacode
DROP TABLE IF EXISTS `dataexisting_areacode`;
CREATE TABLE IF NOT EXISTS `dataexisting_areacode` (
  `AreaCodeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AreaCodeValue` varchar(3) NOT NULL,
  `TimeZone` varchar(3) DEFAULT NULL,
  `StateCode` varchar(2) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`AreaCodeID`),
  UNIQUE KEY `IDX_UC_dataexisting_areacode` (`AreaCodeValue`,`TimeZone`,`StateCode`),
  KEY `FK_dataexisting_areacode_Status` (`StatusID`),
  KEY `FK_dataexisting_areacode_USStates` (`StateCode`),
  KEY `FK_dataexisting_areacode_registeredapp` (`RegisteredApp`),
  KEY `FK_dataexisting_areacode_timezones` (`TimeZone`),
  KEY `IDX_DataExisting_AreaCode` (`AreaCodeValue`,`TimeZone`,`StateCode`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_areacode_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_areacode_USStates` FOREIGN KEY (`StateCode`) REFERENCES `refdata_usstates` (`StateID`),
  CONSTRAINT `FK_dataexisting_areacode_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_dataexisting_areacode_timezones` FOREIGN KEY (`TimeZone`) REFERENCES `refdata_timezones` (`TimeZoneValue`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_areacodeintl
DROP TABLE IF EXISTS `dataexisting_areacodeintl`;
CREATE TABLE IF NOT EXISTS `dataexisting_areacodeintl` (
  `IDDCode` varchar(5) NOT NULL,
  `CountryID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`IDDCode`),
  KEY `FK_dataexisting_areacodeintl_Countries` (`CountryID`),
  KEY `FK_dataexisting_areacodeintl_Status` (`StatusID`),
  KEY `FK_dataexisting_areacodeintl_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExisting_AreaCodeIntl` (`IDDCode`,`CountryID`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_areacodeintl_Countries` FOREIGN KEY (`CountryID`) REFERENCES `refdata_countries` (`CountryID`),
  CONSTRAINT `FK_dataexisting_areacodeintl_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_areacodeintl_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_companies
DROP TABLE IF EXISTS `dataexisting_companies`;
CREATE TABLE IF NOT EXISTS `dataexisting_companies` (
  `CompaniesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(79) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`CompaniesID`),
  KEY `FK_dataexisting_companies_Status` (`StatusID`),
  KEY `FK_dataexisting_companies_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExisting_Companies` (`CompaniesID`,`CompanyName`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_companies_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_companies_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=948 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_namefirst
DROP TABLE IF EXISTS `dataexisting_namefirst`;
CREATE TABLE IF NOT EXISTS `dataexisting_namefirst` (
  `FirstNameID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(39) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`FirstNameID`),
  UNIQUE KEY `IDX_UC_dataexisting_namefirst` (`FirstName`,`Gender`,`RegisteredApp`),
  KEY `FK_dataexisting_namefirst_Status` (`StatusID`),
  KEY `FK_dataexisting_namefirst_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExistng_NameFirst` (`FirstNameID`,`FirstName`,`Gender`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_namefirst_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_namefirst_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=301552 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_namelast
DROP TABLE IF EXISTS `dataexisting_namelast`;
CREATE TABLE IF NOT EXISTS `dataexisting_namelast` (
  `LastNameID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(69) DEFAULT NULL,
  `StatusID` smallint(6) NOT NULL DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`LastNameID`),
  UNIQUE KEY `IDX_UC_DataExisting_NameLast` (`LastName`,`RegisteredApp`),
  KEY `FK_dataexisting_namelast_Status` (`StatusID`),
  KEY `FK_dataexisting_namelast_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExisting_NameLast` (`LastNameID`,`LastName`,`StatusID`,`CreatedDate`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_namelast_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_namelast_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=601224 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_upccodes
DROP TABLE IF EXISTS `dataexisting_upccodes`;
CREATE TABLE IF NOT EXISTS `dataexisting_upccodes` (
  `UPCCodeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UPCCodeName` varchar(15) DEFAULT NULL,
  `UPCProductName` varchar(150) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`UPCCodeID`),
  KEY `FK_dataexisting_upccodes_Status` (`StatusID`),
  KEY `FK_dataexisting_upccodes_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExisting_UPCCodes` (`UPCCodeID`,`UPCCodeName`,`UPCProductName`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_upccodes_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_upccodes_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=46000 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_zipcodeintl
DROP TABLE IF EXISTS `dataexisting_zipcodeintl`;
CREATE TABLE IF NOT EXISTS `dataexisting_zipcodeintl` (
  `ZipCodeIntnlID` int(11) NOT NULL AUTO_INCREMENT,
  `ZipCode` char(10) NOT NULL,
  `ZipCodeType` varchar(15) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `Country` smallint(6) DEFAULT NULL,
  `Lattitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `Location` varchar(99) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`ZipCodeIntnlID`),
  KEY `FK_dataexisting_zipcodeIntl_Countries` (`Country`),
  KEY `FK_dataexisting_zipcodeIntl_Status` (`StatusID`),
  KEY `FK_dataexisting_zipcodeintl_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataExisting_ZipcodeIntl` (`ZipCodeIntnlID`,`ZipCode`,`ZipCodeType`,`Country`,`City`,`Lattitude`,`Longitude`,`Location`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_zipcodeIntl_Countries` FOREIGN KEY (`Country`) REFERENCES `refdata_countries` (`CountryID`),
  CONSTRAINT `FK_dataexisting_zipcodeIntl_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_zipcodeintl_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.dataexisting_zipcodeus
DROP TABLE IF EXISTS `dataexisting_zipcodeus`;
CREATE TABLE IF NOT EXISTS `dataexisting_zipcodeus` (
  `ZipCodeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ZipCode` char(5) NOT NULL,
  `ZipCodeType` varchar(15) DEFAULT NULL,
  `City` varchar(75) DEFAULT NULL,
  `StateCode` varchar(2) DEFAULT NULL,
  `Lattitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `Lctn` varchar(99) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`ZipCodeID`),
  KEY `IDX_dataexisting_zipcodeus` (`ZipCodeID`,`ZipCode`,`ZipCodeType`,`City`,`State`,`Lattitude`,`Longitude`,`Location`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  KEY `FK_dataexisting_zipcodeUS_Status` (`StatusID`),
  KEY `FK_dataexisting_zipcodeus_registeredapp` (`RegisteredApp`),
  CONSTRAINT `FK_dataexisting_zipcodeUS_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_dataexisting_zipcodeus_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=41862 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_accountnumbers
DROP TABLE IF EXISTS `datagenerated_accountnumbers`;
CREATE TABLE IF NOT EXISTS `datagenerated_accountnumbers` (
  `AccountNumbersID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AccountNumberValue` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `CreatedUser` varchar(20) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` char(38) DEFAULT NULL,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`AccountNumbersID`),
  UNIQUE KEY `IDX_UC_datagenerated_accountnumbers` (`AccountNumberValue`,`RegisteredApp`,`DataGenTypeID`),
  KEY `FK_datagenerated_accountnumbers_status` (`StatusID`),
  KEY `FK_datagenerated_accountnumbers_registeredapp` (`RegisteredApp`),
  KEY `FK_datagenerated_accountnumbers_datagentype` (`DataGenTypeID`),
  KEY `IDX_DataGenerated_AccountNumbers` (`AccountNumbersID`,`AccountNumberValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`,`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_accountnumbers_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_accountnumbers_datagentype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_accountnumbers_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=15001 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_addresses
DROP TABLE IF EXISTS `datagenerated_addresses`;
CREATE TABLE IF NOT EXISTS `datagenerated_addresses` (
  `AddressID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AddressStreet` varchar(99) DEFAULT NULL,
  `AddressStreet2` varchar(59) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `IDX_UC_DataGenerated_Addresses` (`AddressStreet`,`AddressStreet2`,`RegisteredApp`,`DataGenTypeID`),
  KEY `FK_datagenerated_addresses_status` (`StatusID`),
  KEY `FK_datagenerated_addresses_registeredapp` (`RegisteredApp`),
  KEY `FK_datagenerated_addresses_datagenttype` (`DataGenTypeID`),
  KEY `IDX_datagenerated_addresses` (`AddressID`,`AddressStreet`,`AddressStreet2`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`,`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_addresses_datagenttype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_addresses_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_datagenerated_addresses_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=33110 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_bankaccount
DROP TABLE IF EXISTS `datagenerated_bankaccount`;
CREATE TABLE IF NOT EXISTS `datagenerated_bankaccount` (
  `BankAccountsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BankAccountValue` varchar(17) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`BankAccountsID`),
  UNIQUE KEY `IDX_UC_DataGenerated_BankAccounts` (`BankAccountValue`,`RegisteredApp`,`DataGenTypeID`),
  KEY `FK_datagenerated_bankaccount_Status` (`StatusID`),
  KEY `FK_datagenerated_bankaccount_registeredapp` (`RegisteredApp`),
  KEY `datagenerated_bankaccount__datagentype` (`DataGenTypeID`),
  KEY `IDX_DataGenerated_BankAccounts` (`BankAccountsID`,`BankAccountValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`,`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_bankaccount_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_bankaccount_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `datagenerated_bankaccount__datagentype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=25102 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_creditcard
DROP TABLE IF EXISTS `datagenerated_creditcard`;
CREATE TABLE IF NOT EXISTS `datagenerated_creditcard` (
  `CreditCardID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CreditCardNumber` varchar(20) DEFAULT NULL,
  `CreditCardName` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`CreditCardID`),
  UNIQUE KEY `IDX_UC_datagenerated_creditcard` (`CreditCardNumber`,`CreditCardName`,`RegisteredApp`,`DataGenTypeID`),
  KEY `FK_datagenerated_creditcard_Status` (`StatusID`),
  KEY `FK_datagenerated_creditcard_registeredapp` (`RegisteredApp`),
  KEY `datagenerated_creditcard__datagentype` (`DataGenTypeID`),
  KEY `IDX_DataGenerated_CreditCard` (`CreditCardID`,`CreditCardNumber`,`CreditCardName`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`,`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_creditcard_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_creditcard_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `datagenerated_creditcard__datagentype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=40001 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_dateofbirth
DROP TABLE IF EXISTS `datagenerated_dateofbirth`;
CREATE TABLE IF NOT EXISTS `datagenerated_dateofbirth` (
  `DateofBirthsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DateOfBirth` varchar(12) DEFAULT NULL,
  `DateOfBirthDate` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`DateofBirthsID`),
  UNIQUE KEY `IDX_UC_DataGenerated_DateOfBirths` (`DateOfBirth`,`DateOfBirthDate`,`RegisteredApp`),
  KEY `FK_datagenerated_dateofbirth_Status` (`StatusID`),
  KEY `FK_datagenerated_dateofbirth_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataGenerated_DateOfBirths` (`DateofBirthsID`,`DateOfBirth`,`DateOfBirthDate`,`Age`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_datagenerated_dateofbirth_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_dateofbirth_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=30000 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_driverslicenses
DROP TABLE IF EXISTS `datagenerated_driverslicenses`;
CREATE TABLE IF NOT EXISTS `datagenerated_driverslicenses` (
  `DriversLicensesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DLN` varchar(25) DEFAULT NULL,
  `StateCode` varchar(2) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`DriversLicensesID`),
  UNIQUE KEY `IDX_UC_DataGenerated_DriversLicenses` (`DLN`,`StateCode`,`DataGenTypeID`,`RegisteredApp`),
  KEY `FK_datagenerated_driverslicenses_Status` (`StatusID`),
  KEY `FK_datagenerated_driverslicenses_USStates` (`StateCode`),
  KEY `FK_datagenerated_driverslicenses_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataGenerated_DriversLicenses` (`DriversLicensesID`,`CreatedDate`,`DLN`,`StateCode`,`StatusID`,`DataGenTypeID`,`CreatedUser`,`RegisteredApp`),
  KEY `FK_datagenerated_driverslicenses_datagentype` (`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_driverslicenses_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_driverslicenses_USStates` FOREIGN KEY (`StateCode`) REFERENCES `refdata_usstates` (`StateID`),
  CONSTRAINT `FK_datagenerated_driverslicenses_datagentype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_driverslicenses_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=255001 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_ein
DROP TABLE IF EXISTS `datagenerated_ein`;
CREATE TABLE IF NOT EXISTS `datagenerated_ein` (
  `EINID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EINValue` varchar(10) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`EINID`),
  UNIQUE KEY `IDX_UC_DataGenerated_EIN` (`EINValue`,`RegisteredApp`),
  KEY `FK_datagenerated_ein_Status` (`StatusID`),
  KEY `FK_datagenerated_ein_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataGenerated_EIN` (`EINID`,`EINValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_datagenerated_ein_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_ein_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_phonenumber
DROP TABLE IF EXISTS `datagenerated_phonenumber`;
CREATE TABLE IF NOT EXISTS `datagenerated_phonenumber` (
  `PhoneNumberID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PhoneNumberValue` varchar(8) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`PhoneNumberID`),
  UNIQUE KEY `IDX_UC_DataGeneratedPhoneNumbers` (`PhoneNumberValue`,`RegisteredApp`),
  KEY `FK_datagenerated_phonenumber_registeredapp` (`RegisteredApp`),
  KEY `FK_datagenerated_phonenumbers_Status` (`StatusID`),
  KEY `IDX_PhoneNumbers` (`PhoneNumberID`,`PhoneNumberValue`,`RegisteredApp`,`CreatedUser`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_datagenerated_phonenumber_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_datagenerated_phonenumbers_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=74623 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_phonenumbersintl
DROP TABLE IF EXISTS `datagenerated_phonenumbersintl`;
CREATE TABLE IF NOT EXISTS `datagenerated_phonenumbersintl` (
  `PhoneNumberIntlID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PhoneNumberValue` varchar(12) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CountryId` smallint(6) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`PhoneNumberIntlID`),
  UNIQUE KEY `IDX_UC_datagenerated_phonenumbersintl` (`PhoneNumberValue`,`CountryId`,`RegisteredApp`),
  KEY `FK_datagenerated_phonenumbersintl_Country` (`CountryId`),
  KEY `FK_datagenerated_phonenumbersintl_Status` (`StatusID`),
  KEY `FK_datagenerated_phonenumbersintl_registeredapp` (`RegisteredApp`),
  KEY `IDX_PhoneNumbersIntl` (`PhoneNumberIntlID`,`PhoneNumberValue`,`CountryId`,`CreatedDate`,`CreatedUser`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_datagenerated_phonenumbersintl_Country` FOREIGN KEY (`CountryId`) REFERENCES `refdata_countries` (`CountryID`),
  CONSTRAINT `FK_datagenerated_phonenumbersintl_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_phonenumbersintl_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_socialsecuritynumber
DROP TABLE IF EXISTS `datagenerated_socialsecuritynumber`;
CREATE TABLE IF NOT EXISTS `datagenerated_socialsecuritynumber` (
  `SocialSecurityNumberID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SocialSecurityNumberValue` varchar(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  PRIMARY KEY (`SocialSecurityNumberID`),
  UNIQUE KEY `IDX_UC_DataGenerated_SocialSecurityNumbers` (`SocialSecurityNumberValue`,`RegisteredApp`),
  KEY `FK_datagenerated_socialsecuritynumber_Status` (`StatusID`),
  KEY `FK_datagenerated_socialsecuritynumber_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataGenerated_SocialSecurityNumber` (`SocialSecurityNumberID`,`SocialSecurityNumberValue`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`),
  CONSTRAINT `FK_datagenerated_socialsecuritynumber_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_socialsecuritynumber_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB AUTO_INCREMENT=78214 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datagenerated_useridentities
DROP TABLE IF EXISTS `datagenerated_useridentities`;
CREATE TABLE IF NOT EXISTS `datagenerated_useridentities` (
  `UserIdentitiesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserIdentityValue` varchar(20) DEFAULT NULL,
  `UserDomain` varchar(20) DEFAULT NULL,
  `AdditionalAttributes` varchar(40) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` char(38) DEFAULT NULL,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`UserIdentitiesID`),
  UNIQUE KEY `IDX_UC_DataGenerated_UserIdentities` (`UserIdentityValue`,`UserDomain`,`RegisteredApp`,`DataGenTypeID`),
  KEY `FK_datagenerated_useridentities_Status` (`StatusID`),
  KEY `FK_datagenerated_useridentities_registeredapp` (`RegisteredApp`),
  KEY `IDX_DataGenerated_Identities` (`UserIdentitiesID`,`UserIdentityValue`,`UserDomain`,`CreatedDate`,`StatusID`,`AdditionalAttributes`,`RegisteredApp`,`DataGenTypeID`),
  KEY `datagenerated_useridentities_datagentype` (`DataGenTypeID`),
  CONSTRAINT `FK_datagenerated_useridentities_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_datagenerated_useridentities_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `datagenerated_useridentities_datagentype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=25001 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datamodel_datatables
DROP TABLE IF EXISTS `datamodel_datatables`;
CREATE TABLE IF NOT EXISTS `datamodel_datatables` (
  `TableName` varchar(64) CHARACTER SET utf8mb3 NOT NULL,
  `TableInformation` varchar(249) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`TableName`),
  KEY `IDX_datamodel_datatables` (`TableName`,`TableInformation`,`StatusID`,`CreatedDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datamodel_domain
DROP TABLE IF EXISTS `datamodel_domain`;
CREATE TABLE IF NOT EXISTS `datamodel_domain` (
  `DomainName` varchar(64) CHARACTER SET utf8mb3 NOT NULL,
  `DomainInformation` varchar(249) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`DomainName`),
  KEY `IDX_datamodel_domain` (`DomainName`,`DomainInformation`,`StatusID`,`CreatedDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_address
DROP TABLE IF EXISTS `datastructure_address`;
CREATE TABLE IF NOT EXISTS `datastructure_address` (
  `CompleteAddressID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Address1` varchar(99) DEFAULT NULL,
  `City` varchar(70) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`CompleteAddressID`),
  UNIQUE KEY `IDX_UC_databuilt_address` (`Address1`,`City`,`StateID`,`ZipCode`,`RegisteredApp`),
  KEY `FK_databuilt_address_status` (`StatusID`),
  KEY `IDX_databuilt_completeaddress` (`CompleteAddressID`,`Address1`,`City`,`StateID`,`ZipCode`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  KEY `FK_databuilt_address_registeredapp` (`RegisteredApp`),
  CONSTRAINT `FK_databuilt_address_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_databuilt_address_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_bankaccount
DROP TABLE IF EXISTS `datastructure_bankaccount`;
CREATE TABLE IF NOT EXISTS `datastructure_bankaccount` (
  `DataBuiltBankAccountsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `BankAccountNumber` varchar(12) DEFAULT NULL,
  `BankAccountName` varchar(75) DEFAULT NULL,
  `BankRoutingID` varchar(9) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltBankAccountsID`),
  UNIQUE KEY `IDX_UC_databuilt_bankaccount` (`BankAccountNumber`,`BankRoutingID`,`RegisteredApp`),
  KEY `fk_databuilt_bankAccounts_status` (`StatusID`),
  KEY `IX_databuilt_bankAccounts` (`DataBuiltBankAccountsID`,`BankAccountName`,`BankAccountNumber`,`BankRoutingID`,`StatusID`,`CreatedDate`,`RegisteredApp`),
  KEY `FK_databuilt_bankaccount_registeredapp` (`RegisteredApp`),
  CONSTRAINT `FK_databuilt_bankaccount_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `fk_databuilt_bankAccounts_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_corporations
DROP TABLE IF EXISTS `datastructure_corporations`;
CREATE TABLE IF NOT EXISTS `datastructure_corporations` (
  `DataBuiltCorporationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CorporationName` varchar(99) DEFAULT NULL,
  `Address1` varchar(99) DEFAULT NULL,
  `City` varchar(70) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltCorporationID`),
  UNIQUE KEY `IDX_UC_databuilt_corporations` (`CorporationName`,`Address1`,`City`,`StateID`,`ZipCode`,`RegisteredApp`),
  KEY `FK_databuilt_corporations_status` (`StatusID`),
  KEY `FK_databuilt_corporations_resiteredapp` (`RegisteredApp`),
  KEY `IDX_databuilt_corporations` (`DataBuiltCorporationID`,`CorporationName`,`Address1`,`City`,`StateID`,`ZipCode`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_corporations_resiteredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_databuilt_corporations_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_names
DROP TABLE IF EXISTS `datastructure_names`;
CREATE TABLE IF NOT EXISTS `datastructure_names` (
  `DataBuiltNamesID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CompleteName` varchar(100) DEFAULT NULL,
  `Gender` varchar(1) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltNamesID`),
  KEY `FK_databuilt_completenames_status` (`StatusID`),
  KEY `IX_databuilt_names_databuiltnamesid` (`DataBuiltNamesID`,`CompleteName`,`Gender`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  KEY `FK_databuilt_names_registeredapp` (`RegisteredApp`),
  CONSTRAINT `FK_databuilt_completenames_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_databuilt_names_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_persondemographics
DROP TABLE IF EXISTS `datastructure_persondemographics`;
CREATE TABLE IF NOT EXISTS `datastructure_persondemographics` (
  `PersonDemographicsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DLN` varchar(25) DEFAULT NULL,
  `DLNState` varchar(2) DEFAULT NULL,
  `SSN` varchar(11) DEFAULT NULL,
  `DOBValue` varchar(12) DEFAULT NULL,
  `DOBDate` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`PersonDemographicsID`),
  UNIQUE KEY `IDX_UC_databuilt_persondemographics` (`DLN`,`DLNState`,`SSN`,`DOBDate`,`DOBValue`,`Age`,`RegisteredApp`),
  KEY `FK_databuilt_persondemographics_status` (`StatusID`),
  KEY `FK_databuilt_persondemographics_registeredapp` (`RegisteredApp`),
  KEY `IDX_dataabuilt_persondemographics` (`PersonDemographicsID`,`DLN`,`DLNState`,`SSN`,`DOBValue`,`DOBDate`,`Age`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_persondemographics_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_databuilt_persondemographics_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_phonenumbers
DROP TABLE IF EXISTS `datastructure_phonenumbers`;
CREATE TABLE IF NOT EXISTS `datastructure_phonenumbers` (
  `DataBuiltPhoneNumbersID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AreaCode` varchar(3) DEFAULT NULL,
  `PhoneNumber` varchar(8) DEFAULT NULL,
  `CompletePhoneNumber` varchar(14) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltPhoneNumbersID`),
  UNIQUE KEY `IDX_UC_databuilt_phonenumbers` (`AreaCode`,`PhoneNumber`,`RegisteredApp`),
  KEY `FK_databuilt_phonenumbers_status` (`StatusID`),
  KEY `FK_databuilt_phonenumbers_registeredapp` (`RegisteredApp`),
  KEY `IDX_databuilt_phonenumbers` (`DataBuiltPhoneNumbersID`,`AreaCode`,`PhoneNumber`,`CompletePhoneNumber`,`StatusID`,`CreatedDate`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_phonenumbers_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_databuilt_phonenumbers_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `IDX_databuilt_phonenumbers_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_phonenumbersintl
DROP TABLE IF EXISTS `datastructure_phonenumbersintl`;
CREATE TABLE IF NOT EXISTS `datastructure_phonenumbersintl` (
  `DataBuiltPhoneNumbersIntlID` bigint(20) NOT NULL AUTO_INCREMENT,
  `AreaCode` varchar(3) DEFAULT NULL,
  `PhoneNumber` varchar(8) DEFAULT NULL,
  `CompletePhoneNumber` varchar(14) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DataBuiltPhoneNumbersIntlID`),
  UNIQUE KEY `IDX_UC_databuilt_phonenumbersintl` (`AreaCode`,`PhoneNumber`,`RegisteredApp`),
  KEY `FK_databuilt_phonenumbersintl_registeredapp` (`RegisteredApp`),
  KEY `FK_databuilt_phonenumbersintl_status` (`StatusID`),
  KEY `IDX_databuilt_phonenumbersintl` (`DataBuiltPhoneNumbersIntlID`,`AreaCode`,`PhoneNumber`,`CompletePhoneNumber`,`StatusID`,`CreatedDate`,`RegisteredApp`),
  CONSTRAINT `FK_databuilt_phonenumbersintl_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_databuilt_phonenumbersintl_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `IDX_databuilt_phonenumbersintl_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.datastructure_products
DROP TABLE IF EXISTS `datastructure_products`;
CREATE TABLE IF NOT EXISTS `datastructure_products` (
  `DatabuiltProductsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ProductID` varchar(20) DEFAULT NULL,
  `ProductName` varchar(99) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`DatabuiltProductsID`),
  UNIQUE KEY `IDX_UC_databuilt_products` (`ProductID`,`ProductName`,`RegisteredApp`),
  KEY `FK_databuilt_products_status` (`StatusID`),
  KEY `IDX_databuilt_products` (`DatabuiltProductsID`,`ProductID`,`ProductName`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  KEY `FK_databuilt_products_regsiteredapp` (`RegisteredApp`),
  CONSTRAINT `FK_databuilt_products_regsiteredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_databuilt_products_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_application
DROP TABLE IF EXISTS `impl_application`;
CREATE TABLE IF NOT EXISTS `impl_application` (
  `AppGUID` char(38) NOT NULL,
  `ApplicationCustomCode` varchar(15) DEFAULT NULL,
  `ApplicationDesc` varchar(50) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `VendorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AppGUID`),
  KEY `FK_refdata_application_status` (`StatusID`),
  KEY `FK_refdata_application_vendors` (`VendorID`),
  KEY `IDX_RefData_Application` (`AppGUID`,`ApplicationCustomCode`,`ApplicationDesc`,`CreatedUser`,`CreatedDate`,`StatusID`,`VendorID`),
  CONSTRAINT `FK_refdata_application_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_refdata_application_vendors` FOREIGN KEY (`VendorID`) REFERENCES `refdata_vendor` (`VendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_codesets
DROP TABLE IF EXISTS `impl_codesets`;
CREATE TABLE IF NOT EXISTS `impl_codesets` (
  `ImplCodeSetID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodeSetsID` bigint(20) NOT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `OrganizationID` varchar(38) DEFAULT NULL,
  `ApplicationID` varchar(38) DEFAULT NULL,
  `IndustryStd` varchar(6) DEFAULT NULL,
  `FieldMapping` varchar(40) DEFAULT NULL,
  `SensitivityFlagID` smallint(6) DEFAULT NULL,
  `ExternalTableID` varchar(20) DEFAULT NULL,
  `ExternalNotes` varchar(149) DEFAULT NULL,
  `ExternalLink` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`ImplCodeSetID`),
  KEY `FK_implcodesets_Application` (`ApplicationID`),
  KEY `FK_implcodesets_Org` (`OrganizationID`),
  KEY `FK_implcodesets_codeset` (`CodeSetsID`),
  KEY `FK_implcodesets_industrystd` (`IndustryStd`),
  KEY `FK_implcodesets_sensitivityflag` (`SensitivityFlagID`),
  KEY `FK_implcodesets_status` (`StatusID`),
  KEY `IDX_ImplCodeSets` (`ImplCodeSetID`,`CodeSetsID`,`CreatedDate`,`OrganizationID`,`ApplicationID`,`IndustryStd`,`FieldMapping`,`SensitivityFlagID`,`ExternalTableID`,`ExternalNotes`,`ExternalLink`,`StatusID`),
  CONSTRAINT `FK_implcodesets_Application` FOREIGN KEY (`ApplicationID`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_implcodesets_Org` FOREIGN KEY (`OrganizationID`) REFERENCES `impl_organization` (`OrganizationGUID`),
  CONSTRAINT `FK_implcodesets_codeset` FOREIGN KEY (`CodeSetsID`) REFERENCES `refdata_codeset` (`CodeSetsID`),
  CONSTRAINT `FK_implcodesets_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_implcodesets_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_implcodesets_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_codesetscrossmaps
DROP TABLE IF EXISTS `impl_codesetscrossmaps`;
CREATE TABLE IF NOT EXISTS `impl_codesetscrossmaps` (
  `CodeSetCrossMapID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodeSetsID` bigint(20) NOT NULL,
  `CodeSetToApplicationID` bigint(20) DEFAULT NULL,
  `TerminologyStdTo` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `TransformCodeValue` varchar(40) DEFAULT NULL,
  `TransformCodeDesc` varchar(129) DEFAULT NULL,
  PRIMARY KEY (`CodeSetCrossMapID`),
  KEY `FK_termscodesetscrossmap_codeset` (`CodeSetsID`),
  KEY `FK_termscodesetscrossmap_status` (`StatusID`),
  KEY `FK_termscodesetscrossmaps_termstd` (`TerminologyStdTo`),
  KEY `FK_terms_codesetscrossmap_codesettoapp` (`CodeSetToApplicationID`),
  CONSTRAINT `FK_terms_codesetscrossmap_codesettoapp` FOREIGN KEY (`CodeSetToApplicationID`) REFERENCES `impl_codesetstoapplication` (`CodeSetToApplicationID`),
  CONSTRAINT `FK_termscodesetscrossmap_codeset` FOREIGN KEY (`CodeSetsID`) REFERENCES `refdata_codeset` (`CodeSetsID`),
  CONSTRAINT `FK_termscodesetscrossmap_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_termscodesetscrossmaps_termstd` FOREIGN KEY (`TerminologyStdTo`) REFERENCES `refdata_terminologystd` (`TerminologyStdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_codesetstoapplication
DROP TABLE IF EXISTS `impl_codesetstoapplication`;
CREATE TABLE IF NOT EXISTS `impl_codesetstoapplication` (
  `CodeSetToApplicationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodeSetsID` bigint(20) NOT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `OrganizationID` varchar(38) DEFAULT NULL,
  `ApplicationID` varchar(38) DEFAULT NULL,
  `CodeValue` varchar(20) DEFAULT NULL,
  `CodeDesc` varchar(129) DEFAULT NULL,
  `FormalName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `CityStateZip` varchar(99) DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `OtherField1` varchar(49) DEFAULT NULL,
  `OtherField2` varchar(49) DEFAULT NULL,
  `TermLow` varchar(25) DEFAULT NULL,
  `TermHigh` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`CodeSetToApplicationID`),
  KEY `FK_terms_codesetstoapplication_Application` (`ApplicationID`),
  KEY `FK_terms_codesetstoapplication_Org` (`OrganizationID`),
  KEY `FK_terms_codesetstoapplication_status` (`StatusID`),
  KEY `FK_terms_codesetstoapplication_codeset` (`CodeSetsID`),
  KEY `IDX_Terms_CodeSetsToApplication` (`CodeSetToApplicationID`,`CodeSetsID`,`CodeValue`,`CodeDesc`,`CreatedDate`,`OrganizationID`,`ApplicationID`,`StatusID`,`FormalName`,`Address`,`CityStateZip`,`PhoneNumber`,`OtherField1`,`OtherField2`,`TermLow`,`TermHigh`),
  CONSTRAINT `FK_terms_codesetstoapplication_Application` FOREIGN KEY (`ApplicationID`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_terms_codesetstoapplication_Org` FOREIGN KEY (`OrganizationID`) REFERENCES `impl_organization` (`OrganizationGUID`),
  CONSTRAINT `FK_terms_codesetstoapplication_codeset` FOREIGN KEY (`CodeSetsID`) REFERENCES `refdata_codeset` (`CodeSetsID`),
  CONSTRAINT `FK_terms_codesetstoapplication_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_codesetstomsgtype
DROP TABLE IF EXISTS `impl_codesetstomsgtype`;
CREATE TABLE IF NOT EXISTS `impl_codesetstomsgtype` (
  `CodeSetToMsgTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodeSetsID` bigint(20) DEFAULT NULL,
  `MsgType` varchar(75) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `CreatedUser` varchar(20) DEFAULT NULL,
  `AppGUID` char(38) DEFAULT NULL,
  `OrgGUID` char(38) DEFAULT NULL,
  PRIMARY KEY (`CodeSetToMsgTypeID`),
  KEY `FK_refdata_codesetstomsgtype_codesets` (`CodeSetsID`),
  KEY `FK_refdata_codesetstomsgtype_status` (`StatusID`),
  KEY `IDX_RefData_CodeSetsToMsgType` (`CodeSetToMsgTypeID`,`CodeSetsID`,`MsgType`,`CreatedDate`,`StatusID`,`CreatedUser`,`AppGUID`,`OrgGUID`),
  KEY `FK_refdata_codesetstomsgtype_app` (`AppGUID`),
  KEY `FK_refdata_codesetstomsgtype_org` (`OrgGUID`),
  CONSTRAINT `FK_refdata_codesettomsgtype_app` FOREIGN KEY (`AppGUID`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_refdata_codesettomsgtype_codesets` FOREIGN KEY (`CodeSetsID`) REFERENCES `refdata_codeset` (`CodeSetsID`),
  CONSTRAINT `FK_refdata_codesettomsgtype_org` FOREIGN KEY (`OrgGUID`) REFERENCES `impl_organization` (`OrganizationGUID`),
  CONSTRAINT `FK_refdata_codesettomsgtype_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_legalentities
DROP TABLE IF EXISTS `impl_legalentities`;
CREATE TABLE IF NOT EXISTS `impl_legalentities` (
  `LegalEntityGUID` char(38) NOT NULL,
  `LocationName` varchar(50) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(60) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(12) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LocationURL` varchar(99) DEFAULT NULL,
  `LocationPhone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`LegalEntityGUID`),
  KEY `FK_refdata_location_states` (`StateID`),
  KEY `FK_refdata_location_status` (`StatusID`),
  KEY `IDX_RefData_LegalEntity2` (`LegalEntityGUID`,`LocationName`,`Address`,`City`,`StateID`,`ZipCode`,`CreatedUser`,`StatusID`,`CreatedDate`,`LocationURL`,`LocationPhone`),
  CONSTRAINT `FK_refdata_location_states` FOREIGN KEY (`StateID`) REFERENCES `refdata_usstates` (`StateID`),
  CONSTRAINT `FK_refdata_location_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_organization
DROP TABLE IF EXISTS `impl_organization`;
CREATE TABLE IF NOT EXISTS `impl_organization` (
  `OrganizationGUID` char(38) NOT NULL,
  `OrganizationInternalCode` varchar(10) DEFAULT NULL,
  `OrganizationInternalID` varchar(10) DEFAULT NULL,
  `OrganizationName` varchar(50) DEFAULT NULL,
  `Address` varchar(75) DEFAULT NULL,
  `City` varchar(60) DEFAULT NULL,
  `StateID` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(12) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LegalEntityGUID` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`OrganizationGUID`),
  KEY `FK_refdata_organization_status` (`StatusID`),
  KEY `FK_refdata_organization_states` (`StateID`),
  KEY `FK_refdata_organization_legalentity` (`LegalEntityGUID`),
  KEY `IDX_RefData_Organization` (`OrganizationGUID`,`OrganizationName`,`Address`,`City`,`StateID`,`ZipCode`,`CreatedDate`,`StatusID`,`CreatedUser`,`OrganizationInternalCode`,`OrganizationInternalID`,`LegalEntityGUID`),
  CONSTRAINT `FK_refdata_organization_legalentity` FOREIGN KEY (`LegalEntityGUID`) REFERENCES `impl_legalentities` (`LegalEntityGUID`),
  CONSTRAINT `FK_refdata_organization_states` FOREIGN KEY (`StateID`) REFERENCES `refdata_usstates` (`StateID`),
  CONSTRAINT `FK_refdata_organization_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_rulesets
DROP TABLE IF EXISTS `impl_rulesets`;
CREATE TABLE IF NOT EXISTS `impl_rulesets` (
  `RuleID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RuleName` varchar(65) DEFAULT NULL,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `ExpirationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`RuleID`),
  KEY `FK_platform_rulesets_status` (`StatusID`),
  KEY `IDX_Platform_RuleSets` (`RuleID`,`RuleName`,`CreatedUser`,`CreatedDate`,`ExpirationDate`,`StatusID`),
  CONSTRAINT `FK_platform_rulesets_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.impl_rulesetsdefinitions
DROP TABLE IF EXISTS `impl_rulesetsdefinitions`;
CREATE TABLE IF NOT EXISTS `impl_rulesetsdefinitions` (
  `RulesetDefinitionsID` char(38) NOT NULL,
  `RulesetDefinitionName` varchar(50) DEFAULT NULL,
  `RuleSetID` bigint(20) DEFAULT NULL,
  `StepOrderID` smallint(6) DEFAULT NULL,
  `OperationTypeID` varchar(7) DEFAULT NULL,
  `RulesetDefValue` char(40) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `EffectiveDate` timestamp NULL DEFAULT NULL,
  `ApplicationID` varchar(38) DEFAULT NULL,
  `TermDate` timestamp NULL DEFAULT NULL,
  `DataAttributeID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`RulesetDefinitionsID`),
  KEY `FK_platform_rulesetsdefinitions_operationtype` (`OperationTypeID`),
  KEY `FK_platform_rulesetsdefinitions_registeredapp` (`ApplicationID`),
  KEY `FK_platform_rulesetsdefinitions_ruleset` (`RuleSetID`),
  KEY `FK_platform_rulesetsdefinitions_status` (`StatusID`),
  KEY `FK_platform_rulesetsdefinitions_dataattributes` (`DataAttributeID`),
  KEY `IDX_Platform_RulesetsDefinitions` (`RulesetDefinitionsID`,`RuleSetID`,`RulesetDefinitionName`,`StepOrderID`,`OperationTypeID`,`RulesetDefValue`,`CreatedDate`,`EffectiveDate`,`StatusID`,`ApplicationID`,`TermDate`,`DataAttributeID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_dataattributes` FOREIGN KEY (`DataAttributeID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_operationtype` FOREIGN KEY (`OperationTypeID`) REFERENCES `refdata_operationtype` (`OperationTypeID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_registeredapp` FOREIGN KEY (`ApplicationID`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_ruleset` FOREIGN KEY (`RuleSetID`) REFERENCES `impl_rulesets` (`RuleID`),
  CONSTRAINT `FK_platform_rulesetsdefinitions_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.platform_appsettings_general
DROP TABLE IF EXISTS `platform_appsettings_general`;
CREATE TABLE IF NOT EXISTS `platform_appsettings_general` (
  `AppSettingsID` smallint(6) NOT NULL AUTO_INCREMENT,
  `AppSettingName` varchar(50) DEFAULT NULL,
  `AppSettingValue` varchar(199) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  `DefaultDataGenerationApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`AppSettingsID`),
  KEY `FK_platform_appsettings_general_datagenapp` (`DefaultDataGenerationApp`),
  KEY `FK_platform_appsettings_general_registeredapp` (`RegisteredApp`),
  KEY `FK_refdata_appsettings_general_status` (`StatusID`),
  KEY `IDX_PlatformData_AppSettings_General` (`AppSettingsID`,`AppSettingName`,`AppSettingValue`,`CreatedDate`,`StatusID`,`RegisteredApp`,`DefaultDataGenerationApp`),
  CONSTRAINT `FK_platform_appsettings_general_datagenapp` FOREIGN KEY (`DefaultDataGenerationApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_platform_appsettings_general_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_refdata_appsettings_general_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.platform_config_datagen
DROP TABLE IF EXISTS `platform_config_datagen`;
CREATE TABLE IF NOT EXISTS `platform_config_datagen` (
  `DataGenConfigID` smallint(6) NOT NULL AUTO_INCREMENT,
  `DataTypeGenConfigName` varchar(25) DEFAULT NULL,
  `DataAttributeID` smallint(6) DEFAULT NULL,
  `RunQuantity` int(11) DEFAULT NULL,
  `MinuteInterval` smallint(6) DEFAULT NULL,
  `DataGenTypeID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `ApplicationID` char(38) DEFAULT NULL,
  PRIMARY KEY (`DataGenConfigID`),
  KEY `FK_platform_datagenconfig_dataattributes` (`DataAttributeID`),
  KEY `FK_platform_datagenconfig_status` (`StatusID`),
  KEY `platform_config_datagen_registeredapp` (`ApplicationID`),
  KEY `IDX_PlatformConfigDataGen` (`DataGenConfigID`,`DataAttributeID`,`DataTypeGenConfigName`,`RunQuantity`,`MinuteInterval`,`CreatedDate`,`CreatedUser`,`StatusID`,`ApplicationID`),
  KEY `FK_platform_config_datagen_datagentype` (`DataGenTypeID`),
  CONSTRAINT `FK_platform_config_datagen_dataattributes` FOREIGN KEY (`DataAttributeID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_config_datagen_datagentype` FOREIGN KEY (`DataGenTypeID`) REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
  CONSTRAINT `FK_platform_config_datagen_registeredapp` FOREIGN KEY (`ApplicationID`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_platform_config_datagen_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.platform_dataattributes
DROP TABLE IF EXISTS `platform_dataattributes`;
CREATE TABLE IF NOT EXISTS `platform_dataattributes` (
  `PlatformDataAttributesID` smallint(6) NOT NULL AUTO_INCREMENT,
  `DataAttributeName` varchar(50) DEFAULT NULL,
  `SensitivityFlagID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `PlatformDataAttributeGUID` char(38) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  `Platformtablename` varchar(38) NULL DEFAULT NULL,
  PRIMARY KEY (`PlatformDataAttributesID`),
  KEY `FK_platformdataattributes_status` (`StatusID`),
  KEY `FK_platformdataattributes_sensitivtyflag` (`SensitivityFlagID`),
  KEY `FK_platform_dataattributes_registeredapp` (`RegisteredApp`),
  KEY `IDX_Platform_DataAttributes` (`PlatformDataAttributesID`,`DataAttributeName`,`SensitivityFlagID`,`CreatedDate`,`StatusID`,`CreatedUser`,`PlatformDataAttributeGUID`,`RegisteredApp`),
  CONSTRAINT `FK_platform_dataattributes_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_platformdataattributes_sensitivtyflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_platformdataattributes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.platform_datastructures
DROP TABLE IF EXISTS `platform_datastructures`;
CREATE TABLE IF NOT EXISTS `platform_datastructures` (
  `PlatformDataStructuresID` smallint(6) NOT NULL AUTO_INCREMENT,
  `DataStructureName` varchar(50) DEFAULT NULL,
  `SensitivityFlagID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `PlatformDataStructuresGUID` char(38) DEFAULT NULL,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`PlatformDataStructuresID`),
  KEY `FK_platform_datastructures_status` (`StatusID`),
  KEY `FK_platform_datastructures__registeredapp` (`RegisteredApp`),
  KEY `FK_platform_datastructures_sensitivityflag` (`SensitivityFlagID`),
  KEY `IDX_Platform_DataStructures` (`PlatformDataStructuresID`,`DataStructureName`,`SensitivityFlagID`,`CreatedDate`,`StatusID`,`CreatedUser`,`PlatformDataStructuresGUID`,`RegisteredApp`),
  CONSTRAINT `FK_platform_datastructures__registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_platform_datastructures_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_platform_datastructures_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.platform_datastructurestodataattributes
DROP TABLE IF EXISTS `platform_datastructurestodataattributes`;
CREATE TABLE IF NOT EXISTS `platform_datastructurestodataattributes` (
  `PlatformDataStructuresToDataAttributesID` smallint(6) NOT NULL AUTO_INCREMENT,
  `PlatformDataStructuresID` smallint(6) DEFAULT NULL,
  `CompositeDataStructureName` varchar(50) DEFAULT NULL,
  `SensitivityFlagID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `PlatformDataStructuresToDataAttributesGUID` char(38) DEFAULT NULL,
  `RegisteredApp` char(38) DEFAULT NULL,
  `PlatformDataAttributesID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`PlatformDataStructuresToDataAttributesID`),
  KEY `FK_platform_datastructurestodataattributes_dataattributes` (`PlatformDataAttributesID`),
  KEY `FK_platform_datastructurestodataattributes_datastructure` (`PlatformDataStructuresID`),
  KEY `FK_platform_datastructurestodataattributes_registeredapp` (`RegisteredApp`),
  KEY `FK_platform_datastructurestodataattributes_sensitivityflag` (`SensitivityFlagID`),
  KEY `FK_platform_datastructurestodataattributes_status` (`StatusID`),
  KEY `IDX_Platform_DataStructuresToDataAttributes` (`PlatformDataStructuresToDataAttributesID`,`PlatformDataStructuresToDataAttributesGUID`,`PlatformDataStructuresID`,`CompositeDataStructureName`,`SensitivityFlagID`,`CreatedDate`,`StatusID`,`CreatedUser`,`RegisteredApp`,`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_dataattributes` FOREIGN KEY (`PlatformDataAttributesID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_datastructure` FOREIGN KEY (`PlatformDataStructuresID`) REFERENCES `platform_datastructures` (`PlatformDataStructuresID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_platform_datastructurestodataattributes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_codeset
DROP TABLE IF EXISTS `refdata_codeset`;
CREATE TABLE IF NOT EXISTS `refdata_codeset` (
  `CodeSetsID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodeSetName` varchar(50) DEFAULT NULL,
  `IndustryStd` varchar(6) DEFAULT NULL,
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `CreatedUser` varchar(20) DEFAULT NULL,
  `CodesetGUID` char(38) DEFAULT NULL,
  `FieldMapping` varchar(40) DEFAULT NULL,
  `SensitivityFlagID` smallint(6) DEFAULT NULL,
  `ExternalTableID` varchar(20) DEFAULT NULL,
  `ExternalNotes` varchar(149) DEFAULT NULL,
  `ExternalLink` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`CodeSetsID`),
  KEY `FK_refdata_codesets_status` (`StatusID`),
  KEY `FK_refdata_codeset_industrystd` (`IndustryStd`),
  KEY `FK_refdata_codeset_sensitivityflag` (`SensitivityFlagID`),
  KEY `IDX_RefData_CodeSets` (`CodeSetsID`,`CodeSetName`,`IndustryStd`,`CreatedDate`,`StatusID`,`CreatedUser`,`CodesetGUID`,`FieldMapping`,`SensitivityFlagID`,`ExternalTableID`,`ExternalNotes`,`ExternalLink`),
  CONSTRAINT `FK_refdata_codeset_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_refdata_codeset_sensitivityflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_refdata_codesets_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_countries
DROP TABLE IF EXISTS `refdata_countries`;
CREATE TABLE IF NOT EXISTS `refdata_countries` (
  `CountryID` smallint(6) NOT NULL AUTO_INCREMENT,
  `IDD` varchar(5) DEFAULT NULL,
  `CountryName` varchar(59) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`CountryID`),
  KEY `FK_Countries_Status` (`StatusID`),
  KEY `IX_Countries` (`CountryID`,`IDD`,`CountryName`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_Countries_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_datagentypes
DROP TABLE IF EXISTS `refdata_datagentypes`;
CREATE TABLE IF NOT EXISTS `refdata_datagentypes` (
  `DataGenTypeID` smallint(6) NOT NULL AUTO_INCREMENT,
  `DataGenTypeDescription` varchar(65) DEFAULT NULL,
  `Definition` varchar(255) DEFAULT NULL,
  `DataAttributeID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DataGenTypeID`),
  KEY `FK_RefDataDataGenTypes_DataAttributes` (`DataAttributeID`),
  KEY `FK_RefDataDataGenTypes_Status` (`StatusID`),
  KEY `IDX_RefData_DataGenTypes` (`DataGenTypeID`,`DataGenTypeDescription`,`Definition`,`DataAttributeID`,`CreatedDate`,`StatusID`,`CreatedUser`),
  CONSTRAINT `FK_RefDataDataGenTypes_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`),
  CONSTRAINT `FK_RefDataDataGenTypes_dataattributes` FOREIGN KEY (`DataAttributeID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_industrystd
DROP TABLE IF EXISTS `refdata_industrystd`;
CREATE TABLE IF NOT EXISTS `refdata_industrystd` (
  `IndustryStd` varchar(6) NOT NULL,
  `IndustryStdDesc` varchar(30) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`IndustryStd`),
  KEY `FK_refdata_industrystd_status` (`StatusID`),
  KEY `IDX_IndustryStd` (`IndustryStd`,`IndustryStdDesc`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_refdata_industrystd_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_industrystd_datatypes
DROP TABLE IF EXISTS `refdata_industrystd_datatypes`;
CREATE TABLE IF NOT EXISTS `refdata_industrystd_datatypes` (
  `DataTypesToIndustryID` int(11) NOT NULL AUTO_INCREMENT,
  `IndustryStd` varchar(6) NOT NULL,
  `DataTypeName` varchar(10) DEFAULT NULL,
  `DataTypeNameDesc` varchar(75) DEFAULT NULL,
  `DataTypeSubFields` varchar(249) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`DataTypesToIndustryID`),
  KEY `IDX_IndustryStd_DataTypes` (`DataTypesToIndustryID`,`IndustryStd`,`DataTypeName`,`DataTypeNameDesc`,`DataTypeSubFields`,`CreatedDate`,`StatusID`),
  KEY `FK_refdata_industrystd_datatypes_industrystd` (`IndustryStd`),
  KEY `FK_refdata_industrystd_datatypes_status` (`StatusID`),
  CONSTRAINT `FK_refdata_industrystd_datatypes_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_refdata_industrystd_datatypes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_industrystd_fields
DROP TABLE IF EXISTS `refdata_industrystd_fields`;
CREATE TABLE IF NOT EXISTS `refdata_industrystd_fields` (
  `FieldsToIndustryID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageFieldNumber` varchar(14) DEFAULT NULL,
  `MessageFieldName` varchar(154) DEFAULT NULL,
  `FieldLength` varchar(10) DEFAULT NULL,
  `DataType` varchar(7) DEFAULT NULL,
  `MessageSegment` varchar(3) DEFAULT NULL,
  `SegmentFieldOrder` varchar(8) DEFAULT NULL,
  `Vrsn` varchar(7) DEFAULT NULL,
  `IndustryStd` varchar(7) DEFAULT NULL,
  `SensitivityFlagID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`FieldsToIndustryID`),
  KEY `IDX_IndustryStd_Fields` (`FieldsToIndustryID`,`MessageFieldNumber`,`MessageFieldName`,`FieldLength`,`DataType`,`MessageSegment`,`SegmentFieldOrder`,`Vrsn`,`IndustryStd`,`SensitivityFlagID`,`CreatedDate`,`StatusID`),
  KEY `FK_refdata_industrystd_fields_industrystd` (`IndustryStd`),
  KEY `FK_refdata_industrystd_fields_status` (`StatusID`),
  KEY `FK_refdata_industrystd_fields_sensitivtyflag` (`SensitivityFlagID`),
  CONSTRAINT `FK_refdata_industrystd_fields_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_refdata_industrystd_fields_sensitivtyflag` FOREIGN KEY (`SensitivityFlagID`) REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
  CONSTRAINT `FK_refdata_industrystd_fields_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_industrystd_segments
DROP TABLE IF EXISTS `refdata_industrystd_segments`;
CREATE TABLE IF NOT EXISTS `refdata_industrystd_segments` (
  `SegmentToIndustryID` int(11) NOT NULL AUTO_INCREMENT,
  `IndustryStd` varchar(6) NOT NULL,
  `IndustryStdDesc` varchar(30) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `SegmentName` varchar(10) DEFAULT NULL,
  `SegmentNameDesc` varchar(129) DEFAULT NULL,
  PRIMARY KEY (`SegmentToIndustryID`),
  KEY `FK_refdata_industrystd_segments_status` (`StatusID`),
  KEY `FK_refdata_industrystd_segments_industrystd` (`IndustryStd`),
  KEY `IDX_IndustryStd_Segments` (`SegmentToIndustryID`,`IndustryStd`,`IndustryStdDesc`,`CreatedDate`,`StatusID`,`SegmentName`,`SegmentNameDesc`),
  CONSTRAINT `FK_refdata_industrystd_segments_industrystd` FOREIGN KEY (`IndustryStd`) REFERENCES `refdata_industrystd` (`IndustryStd`),
  CONSTRAINT `FK_refdata_industrystd_segments_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_operationtype
DROP TABLE IF EXISTS `refdata_operationtype`;
CREATE TABLE IF NOT EXISTS `refdata_operationtype` (
  `OperationTypeID` varchar(7) NOT NULL,
  `OperationTypeName` varchar(60) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`OperationTypeID`),
  KEY `FK_refdata_operationtype_status` (`StatusID`),
  KEY `IDX_RefData_OperationType` (`OperationTypeID`,`OperationTypeName`,`StatusID`,`CreatedDate`),
  CONSTRAINT `FK_refdata_operationtype_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_platformparams
DROP TABLE IF EXISTS `refdata_platformparams`;
CREATE TABLE IF NOT EXISTS `refdata_platformparams` (
  `PlatformParamsID` smallint(6) NOT NULL AUTO_INCREMENT,
  `PlatformParamValues` varchar(35) DEFAULT NULL,
  `PlatformParamDesc` varchar(70) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`PlatformParamsID`),
  KEY `FK_refdata_platformparams_status` (`StatusID`),
  KEY `IDX_refdata_platformparams` (`PlatformParamsID`,`PlatformParamDesc`,`PlatformParamValues`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_refdata_platformparams_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_platformparamstodataattributes
DROP TABLE IF EXISTS `refdata_platformparamstodataattributes`;
CREATE TABLE IF NOT EXISTS `refdata_platformparamstodataattributes` (
  `PlatformParamsToDataAttributeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PlatformParamsID` smallint(6) DEFAULT NULL,
  `DataAttributeID` smallint(6) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `RegisteredApp` varchar(38) DEFAULT NULL,
  PRIMARY KEY (`PlatformParamsToDataAttributeID`),
  KEY `FK_refdata_platformparamstodataattributes_platformparams` (`PlatformParamsID`),
  KEY `FK_refdata_platformparamstodataattributes_dataattributes` (`DataAttributeID`),
  KEY `FK_refdata_platformparamstodataattributes_status` (`StatusID`),
  KEY `FK_refdata_platformparamstodataattributes_registeredapp` (`RegisteredApp`),
  KEY `IDX_refdata_platformparamstodataattributes` (`PlatformParamsToDataAttributeID`,`PlatformParamsID`,`DataAttributeID`,`CreatedDate`,`StatusID`,`RegisteredApp`),
  CONSTRAINT `FK_refdata_platformparamstodataattributes_dataattributes` FOREIGN KEY (`DataAttributeID`) REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
  CONSTRAINT `FK_refdata_platformparamstodataattributes_platformparams` FOREIGN KEY (`PlatformParamsID`) REFERENCES `refdata_platformparams` (`PlatformParamsID`),
  CONSTRAINT `FK_refdata_platformparamstodataattributes_registeredapp` FOREIGN KEY (`RegisteredApp`) REFERENCES `impl_application` (`AppGUID`),
  CONSTRAINT `FK_refdata_platformparamstodataattributes_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_sensitivityflag
DROP TABLE IF EXISTS `refdata_sensitivityflag`;
CREATE TABLE IF NOT EXISTS `refdata_sensitivityflag` (
  `SensitiveFlagID` smallint(6) NOT NULL AUTO_INCREMENT,
  `SensitiveFlagDesc` varchar(30) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`SensitiveFlagID`),
  KEY `FK_refdata_sensitivityflag_status` (`StatusID`),
  KEY `IDX_RefData_SensitivityFlag` (`SensitiveFlagID`,`SensitiveFlagDesc`,`StatusID`,`CreatedDate`),
  CONSTRAINT `FK_refdata_sensitivityflag_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_status
DROP TABLE IF EXISTS `refdata_status`;
CREATE TABLE IF NOT EXISTS `refdata_status` (
  `StatusID` smallint(6) NOT NULL AUTO_INCREMENT,
  `StatusDescription` varchar(45) NOT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `CreatedUser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StatusID`),
  KEY `IDX_RefData_Status` (`StatusID`,`StatusDescription`,`CreatedDate`,`CreatedUser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_terminologystd
DROP TABLE IF EXISTS `refdata_terminologystd`;
CREATE TABLE IF NOT EXISTS `refdata_terminologystd` (
  `TerminologyStdID` smallint(6) NOT NULL AUTO_INCREMENT,
  `TerminologyStd` varchar(25) NOT NULL,
  `TerminologyStdVersion` varchar(10) NOT NULL,
  `TerminologyStdDesc` varchar(129) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`TerminologyStdID`),
  KEY `FK_TerminologyStd_status` (`StatusID`),
  KEY `IDX_Refdata_TerminologyStd` (`TerminologyStdID`,`TerminologyStd`,`TerminologyStdVersion`,`TerminologyStdDesc`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_TerminologyStd_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_timezones
DROP TABLE IF EXISTS `refdata_timezones`;
CREATE TABLE IF NOT EXISTS `refdata_timezones` (
  `TimeZoneValue` varchar(3) NOT NULL,
  `TimeZoneDesc` varchar(25) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  PRIMARY KEY (`TimeZoneValue`),
  KEY `FK_TimeZones_Status` (`StatusID`),
  KEY `IDX_RefData_TimeZones` (`TimeZoneValue`,`TimeZoneDesc`,`CreatedDate`,`StatusID`),
  CONSTRAINT `FK_TimeZones_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_usstates
DROP TABLE IF EXISTS `refdata_usstates`;
CREATE TABLE IF NOT EXISTS `refdata_usstates` (
  `StateID` varchar(2) NOT NULL,
  `StateDescription` varchar(65) DEFAULT NULL,
  `Lattitude` varchar(12) DEFAULT NULL,
  `Longitude` varchar(12) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`StateID`),
  KEY `FK_USStates_Status` (`StatusID`),
  KEY `IDX_RefData_USStates` (`StateID`,`StateDescription`,`Lattitude`,`Longitude`,`CreatedDate`,`StatusID`,`CreatedUser`),
  CONSTRAINT `FK_USStates_Status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.refdata_vendor
DROP TABLE IF EXISTS `refdata_vendor`;
CREATE TABLE IF NOT EXISTS `refdata_vendor` (
  `VendorID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorName` varchar(50) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CreatedUser` varchar(20) DEFAULT NULL,
  `VendorGUID` char(38) DEFAULT NULL,
  PRIMARY KEY (`VendorID`),
  KEY `FK_refdata_vendors_status` (`StatusID`),
  KEY `IDX_RefData_Vendors` (`VendorID`,`VendorName`,`StatusID`,`VendorGUID`,`CreatedDate`,`CreatedUser`),
  CONSTRAINT `FK_refdata_vendors_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.terms_codeset_hl7v2
DROP TABLE IF EXISTS `terms_codeset_hl7v2`;
CREATE TABLE IF NOT EXISTS `terms_codeset_hl7v2` (
  `TermCodeSetID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CodeSetsID` bigint(20) NOT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `StatusID` smallint(6) DEFAULT 1,
  `CodeValue` varchar(20) DEFAULT NULL,
  `CodeDesc` varchar(129) DEFAULT NULL,
  PRIMARY KEY (`TermCodeSetID`),
  KEY `FK_termscodesetHL7v2_codeset` (`CodeSetsID`),
  KEY `FK_termscodesetHL7v2_status` (`StatusID`),
  KEY `IDX_Terms_CodeSetsHL7v2` (`TermCodeSetID`,`CreatedDate`,`StatusID`,`CodeValue`,`CodeDesc`),
  CONSTRAINT `FK_termscodesetHL7v2_codeset` FOREIGN KEY (`CodeSetsID`) REFERENCES `refdata_codeset` (`CodeSetsID`),
  CONSTRAINT `FK_termscodesetHL7v2_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table datasynthesis.terms_umls_mrconoso
DROP TABLE IF EXISTS `terms_umls_mrconoso`;
CREATE TABLE IF NOT EXISTS `terms_umls_mrconoso` (
  `CUI` char(8) CHARACTER SET utf8mb3 NOT NULL,
  `LAT` char(3) CHARACTER SET utf8mb3 NOT NULL,
  `TS` char(1) CHARACTER SET utf8mb3 NOT NULL,
  `LUI` varchar(10) CHARACTER SET utf8mb3 NOT NULL,
  `STT` varchar(3) CHARACTER SET utf8mb3 NOT NULL,
  `SUI` varchar(10) CHARACTER SET utf8mb3 NOT NULL,
  `ISPREF` char(1) CHARACTER SET utf8mb3 NOT NULL,
  `AUI` varchar(9) CHARACTER SET utf8mb3 NOT NULL,
  `SAUI` varchar(50) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SCUI` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SDUI` varchar(100) CHARACTER SET utf8mb3 DEFAULT NULL,
  `SAB` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `TTY` varchar(20) CHARACTER SET utf8mb3 NOT NULL,
  `CODE` varchar(100) CHARACTER SET utf8mb3 NOT NULL,
  `STR` varchar(3000) CHARACTER SET utf8mb3 NOT NULL,
  `SRL` varchar(25) NOT NULL,
  `SUPPRESS` char(1) CHARACTER SET utf8mb3 NOT NULL,
  `CVF` varchar(25) DEFAULT NULL,
  KEY `INDX_terms_umls_mrconoso` (`CUI`,`LAT`,`TS`,`LUI`,`STT`,`SUI`,`ISPREF`,`AUI`,`SAUI`,`SCUI`,`SDUI`,`SAB`,`TTY`,`CODE`,`SRL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for trigger datasynthesis.impl_application_uuid
DROP TRIGGER IF EXISTS `impl_application_uuid`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `impl_application_uuid`
    BEFORE INSERT ON `impl_application`
               FOR EACH ROW
BEGIN
    IF new.AppGUID IS NULL THEN
        SET new.AppGUID = UUID();
END IF;
        END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger datasynthesis.impl_legalentities_uuid
DROP TRIGGER IF EXISTS `impl_legalentities_uuid`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `impl_legalentities_uuid`
    BEFORE INSERT ON `impl_legalentities`
               FOR EACH ROW
BEGIN
    IF new.LegalEntityGUID IS NULL THEN
        SET new.LegalEntityGUID = UUID();
END IF;
        END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger datasynthesis.impl_organization_uuid
DROP TRIGGER IF EXISTS `impl_organization_uuid`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `impl_organization_uuid`
    BEFORE INSERT ON `impl_organization`
               FOR EACH ROW
BEGIN
    IF new.OrganizationGUID IS NULL THEN
        SET new.OrganizationGUID = UUID();
END IF;
        END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger datasynthesis.refdata_vendors_uuid
DROP TRIGGER IF EXISTS `refdata_vendors_uuid`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `refdata_vendors_uuid`
    BEFORE INSERT ON `refdata_vendor`
               FOR EACH ROW
BEGIN
    IF new.VendorGUID IS NULL THEN
        SET new.VendorGUID = UUID();
END IF;
        END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
