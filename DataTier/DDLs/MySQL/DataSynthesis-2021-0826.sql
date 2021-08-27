
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema datasynthesis
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `datasynthesis`;
CREATE SCHEMA IF NOT EXISTS `datasynthesis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `datasynthesis` ;

-- -----------------------------------------------------
-- Table `refdata_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_status` ;

CREATE TABLE IF NOT EXISTS `refdata_status` (
                                                `StatusID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                `StatusDescription` VARCHAR(45) NOT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IDX_RefData_Status` ON `refdata_status` (`StatusID` ASC, `StatusDescription` ASC, `CreatedDate` ASC, `CreatedUser` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `auditing_dataplatform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auditing_dataplatform` ;

CREATE TABLE IF NOT EXISTS `auditing_dataplatform` (
                                                       `DataPlatformID` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `DataProcessingDate` DATETIME(3) NULL DEFAULT NULL,
    `CreatedByUser` VARCHAR(20) NULL DEFAULT NULL,
    `Organizaton` VARCHAR(38) NULL DEFAULT NULL,
    `Application` VARCHAR(38) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `RecCount` INT NULL DEFAULT NULL,
    `Component` VARCHAR(20) NULL DEFAULT NULL,
    `ActionName` VARCHAR(20) NULL DEFAULT NULL,
    `DurationToRun` INT NULL DEFAULT NULL,
    `ActivityDetail` VARCHAR(75) NULL DEFAULT NULL,
    PRIMARY KEY (`DataPlatformID`),
    CONSTRAINT `FK_platform_dataplatform_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_dataplatform_status` ON `auditing_dataplatform` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_platform_dataplatform` ON `auditing_dataplatform` (`DataPlatformID` ASC, `DataProcessingDate` ASC, `CreatedByUser` ASC, `Organizaton` ASC, `Application` ASC, `StatusID` ASC, `CreatedDate` ASC, `RecCount` ASC, `Component` ASC, `ActionName` ASC, `DurationToRun` ASC, `ActivityDetail` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `auditing_datarequest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `auditing_datarequest` ;

CREATE TABLE IF NOT EXISTS `auditing_datarequest` (
                                                      `DataRequestID` BIGINT NOT NULL AUTO_INCREMENT,
                                                      `DataRequestDate` DATETIME(3) NULL DEFAULT NULL,
    `CreatedByUser` VARCHAR(20) NULL DEFAULT NULL,
    `Organizaton` VARCHAR(38) NULL DEFAULT NULL,
    `Application` VARCHAR(38) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `RecCount` INT NULL DEFAULT NULL,
    `RecordDataRequest` VARCHAR(400) NULL DEFAULT NULL,
    PRIMARY KEY (`DataRequestID`),
    CONSTRAINT `FK_platform_datarequest_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_datarequest_status` ON `auditing_datarequest` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_platform_datarequest` ON `auditing_datarequest` (`DataRequestID` ASC, `DataRequestDate` ASC, `CreatedByUser` ASC, `Organizaton` ASC, `Application` ASC, `StatusID` ASC, `CreatedDate` ASC, `RecCount` ASC, `RecordDataRequest` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_vendor` ;

CREATE TABLE IF NOT EXISTS `refdata_vendor` (
                                                `VendorID` INT NOT NULL AUTO_INCREMENT,
                                                `VendorName` VARCHAR(50) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `VendorGUID` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`VendorID`),
    CONSTRAINT `FK_refdata_vendors_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_vendors_status` ON `refdata_vendor` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_Vendors` ON `refdata_vendor` (`VendorID` ASC, `VendorName` ASC, `StatusID` ASC, `VendorGUID` ASC, `CreatedDate` ASC, `CreatedUser` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_application` ;

CREATE TABLE IF NOT EXISTS `impl_application` (
    `AppGUID` CHAR(38) NOT NULL,
    `ApplicationCustomCode` VARCHAR(15) NULL DEFAULT NULL,
    `ApplicationDesc` VARCHAR(50) NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `VendorID` INT NULL DEFAULT NULL,
    PRIMARY KEY (`AppGUID`),
    CONSTRAINT `FK_refdata_application_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_refdata_application_vendors`
    FOREIGN KEY (`VendorID`)
    REFERENCES `refdata_vendor` (`VendorID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_application_status` ON `impl_application` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_application_vendors` ON `impl_application` (`VendorID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_Application` ON `impl_application` (`AppGUID` ASC, `ApplicationCustomCode` ASC, `ApplicationDesc` ASC, `CreatedUser` ASC, `CreatedDate` ASC, `StatusID` ASC, `VendorID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_ababanking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_ababanking` ;

CREATE TABLE IF NOT EXISTS `dataexisting_ababanking` (
                                                         `ABABankingID` BIGINT NOT NULL AUTO_INCREMENT,
                                                         `RoutingNumber` VARCHAR(9) NULL DEFAULT NULL,
    `TelegraphicName` VARCHAR(20) NULL DEFAULT NULL,
    `CustomerName` VARCHAR(36) NULL DEFAULT NULL,
    `City` VARCHAR(20) NULL DEFAULT NULL,
    `State` VARCHAR(2) NULL DEFAULT NULL,
    `ZipCode` VARCHAR(5) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`ABABankingID`),
    CONSTRAINT `FK_dataexisting_ababanking_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_ababanking_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_dataexisting_ababanking_Status` ON `dataexisting_ababanking` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_ababanking_registeredapp` ON `dataexisting_ababanking` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_ABABanking` ON `dataexisting_ababanking` (`ABABankingID` ASC, `RoutingNumber` ASC, `TelegraphicName` ASC, `CustomerName` ASC, `City` ASC, `State` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_timezones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_timezones` ;

CREATE TABLE IF NOT EXISTS `refdata_timezones` (
    `TimeZoneValue` VARCHAR(3) NOT NULL,
    `TimeZoneDesc` VARCHAR(25) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`TimeZoneValue`),
    CONSTRAINT `FK_TimeZones_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_TimeZones_Status` ON `refdata_timezones` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_TimeZones` ON `refdata_timezones` (`TimeZoneValue` ASC, `TimeZoneDesc` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_usstates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_usstates` ;

CREATE TABLE IF NOT EXISTS `refdata_usstates` (
    `StateID` VARCHAR(2) NOT NULL,
    `StateDescription` VARCHAR(65) NULL DEFAULT NULL,
    `Lattitude` VARCHAR(12) NULL DEFAULT NULL,
    `Longitude` VARCHAR(12) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`StateID`),
    CONSTRAINT `FK_USStates_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_USStates_Status` ON `refdata_usstates` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_USStates` ON `refdata_usstates` (`StateID` ASC, `StateDescription` ASC, `Lattitude` ASC, `Longitude` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_areacode`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_areacode` ;

CREATE TABLE IF NOT EXISTS `dataexisting_areacode` (
                                                       `AreaCodeID` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `AreaCodeValue` VARCHAR(3) NOT NULL,
    `TimeZone` VARCHAR(3) NULL DEFAULT NULL,
    `StateCode` VARCHAR(2) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`AreaCodeID`),
    CONSTRAINT `FK_dataexisting_areacode_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_areacode_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_dataexisting_areacode_timezones`
    FOREIGN KEY (`TimeZone`)
    REFERENCES `refdata_timezones` (`TimeZoneValue`),
    CONSTRAINT `FK_dataexisting_areacode_USStates`
    FOREIGN KEY (`StateCode`)
    REFERENCES `refdata_usstates` (`StateID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_dataexisting_areacode` ON `dataexisting_areacode` (`AreaCodeValue` ASC, `TimeZone` ASC, `StateCode` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_areacode_Status` ON `dataexisting_areacode` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_areacode_USStates` ON `dataexisting_areacode` (`StateCode` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_areacode_registeredapp` ON `dataexisting_areacode` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_areacode_timezones` ON `dataexisting_areacode` (`TimeZone` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_AreaCode` ON `dataexisting_areacode` (`AreaCodeValue` ASC, `TimeZone` ASC, `StateCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_countries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_countries` ;

CREATE TABLE IF NOT EXISTS `refdata_countries` (
                                                   `CountryID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                   `IDD` VARCHAR(5) NULL DEFAULT NULL,
    `CountryName` VARCHAR(59) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`CountryID`),
    CONSTRAINT `FK_Countries_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_Countries_Status` ON `refdata_countries` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IX_Countries` ON `refdata_countries` (`CountryID` ASC, `IDD` ASC, `CountryName` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_areacodeintl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_areacodeintl` ;

CREATE TABLE IF NOT EXISTS `dataexisting_areacodeintl` (
    `IDDCode` VARCHAR(5) NOT NULL,
    `CountryID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`IDDCode`),
    CONSTRAINT `FK_dataexisting_areacodeintl_Countries`
    FOREIGN KEY (`CountryID`)
    REFERENCES `refdata_countries` (`CountryID`),
    CONSTRAINT `FK_dataexisting_areacodeintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_areacodeintl_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_dataexisting_areacodeintl_Countries` ON `dataexisting_areacodeintl` (`CountryID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_areacodeintl_Status` ON `dataexisting_areacodeintl` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_areacodeintl_registeredapp` ON `dataexisting_areacodeintl` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_AreaCodeIntl` ON `dataexisting_areacodeintl` (`IDDCode` ASC, `CountryID` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_companies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_companies` ;

CREATE TABLE IF NOT EXISTS `dataexisting_companies` (
                                                        `CompaniesID` BIGINT NOT NULL AUTO_INCREMENT,
                                                        `CompanyName` VARCHAR(79) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`CompaniesID`),
    CONSTRAINT `FK_dataexisting_companies_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_companies_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_dataexisting_companies_Status` ON `dataexisting_companies` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_companies_registeredapp` ON `dataexisting_companies` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_Companies` ON `dataexisting_companies` (`CompaniesID` ASC, `CompanyName` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_namefirst`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_namefirst` ;

CREATE TABLE IF NOT EXISTS `dataexisting_namefirst` (
                                                        `FirstNameID` BIGINT NOT NULL AUTO_INCREMENT,
                                                        `FirstName` VARCHAR(39) NULL DEFAULT NULL,
    `Gender` VARCHAR(1) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`FirstNameID`),
    CONSTRAINT `FK_dataexisting_namefirst_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_namefirst_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_dataexisting_namefirst` ON `dataexisting_namefirst` (`FirstName` ASC, `Gender` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_namefirst_Status` ON `dataexisting_namefirst` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_namefirst_registeredapp` ON `dataexisting_namefirst` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExistng_NameFirst` ON `dataexisting_namefirst` (`FirstNameID` ASC, `FirstName` ASC, `Gender` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_namelast`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_namelast` ;

CREATE TABLE IF NOT EXISTS `dataexisting_namelast` (
                                                       `LastNameID` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `LastName` VARCHAR(69) NULL DEFAULT NULL,
    `StatusID` SMALLINT NOT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`LastNameID`),
    CONSTRAINT `FK_dataexisting_namelast_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_namelast_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataExisting_NameLast` ON `dataexisting_namelast` (`LastName` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_namelast_Status` ON `dataexisting_namelast` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_namelast_registeredapp` ON `dataexisting_namelast` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_NameLast` ON `dataexisting_namelast` (`LastNameID` ASC, `LastName` ASC, `StatusID` ASC, `CreatedDate` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_upccodes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_upccodes` ;

CREATE TABLE IF NOT EXISTS `dataexisting_upccodes` (
                                                       `UPCCodeID` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `UPCCodeName` VARCHAR(15) NULL DEFAULT NULL,
    `UPCProductName` VARCHAR(150) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`UPCCodeID`),
    CONSTRAINT `FK_dataexisting_upccodes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_upccodes_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_dataexisting_upccodes_Status` ON `dataexisting_upccodes` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_upccodes_registeredapp` ON `dataexisting_upccodes` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_UPCCodes` ON `dataexisting_upccodes` (`UPCCodeID` ASC, `UPCCodeName` ASC, `UPCProductName` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_zipcodeintl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_zipcodeintl` ;

CREATE TABLE IF NOT EXISTS `dataexisting_zipcodeintl` (
                                                          `ZipCodeIntnlID` INT NOT NULL AUTO_INCREMENT,
                                                          `ZipCode` CHAR(10) NOT NULL,
    `ZipCodeType` VARCHAR(15) NULL DEFAULT NULL,
    `City` VARCHAR(75) NULL DEFAULT NULL,
    `Country` SMALLINT NULL DEFAULT NULL,
    `Lattitude` VARCHAR(10) NULL DEFAULT NULL,
    `Longitude` VARCHAR(10) NULL DEFAULT NULL,
    `Location` VARCHAR(99) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`ZipCodeIntnlID`),
    CONSTRAINT `FK_dataexisting_zipcodeIntl_Countries`
    FOREIGN KEY (`Country`)
    REFERENCES `refdata_countries` (`CountryID`),
    CONSTRAINT `FK_dataexisting_zipcodeintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_zipcodeIntl_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_dataexisting_zipcodeIntl_Countries` ON `dataexisting_zipcodeintl` (`Country` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_zipcodeIntl_Status` ON `dataexisting_zipcodeintl` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_zipcodeintl_registeredapp` ON `dataexisting_zipcodeintl` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataExisting_ZipcodeIntl` ON `dataexisting_zipcodeintl` (`ZipCodeIntnlID` ASC, `ZipCode` ASC, `ZipCodeType` ASC, `Country` ASC, `City` ASC, `Lattitude` ASC, `Longitude` ASC, `Location` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `dataexisting_zipcodeus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dataexisting_zipcodeus` ;

CREATE TABLE IF NOT EXISTS `dataexisting_zipcodeus` (
                                                        `ZipCodeID` BIGINT NOT NULL AUTO_INCREMENT,
                                                        `ZipCode` CHAR(5) NOT NULL,
    `ZipCodeType` VARCHAR(15) NULL DEFAULT NULL,
    `City` VARCHAR(75) NULL DEFAULT NULL,
    `State` VARCHAR(2) NULL DEFAULT NULL,
    `Lattitude` VARCHAR(10) NULL DEFAULT NULL,
    `Longitude` VARCHAR(10) NULL DEFAULT NULL,
    `Location` VARCHAR(99) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`ZipCodeID`),
    CONSTRAINT `FK_dataexisting_zipcodeus_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_zipcodeUS_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IDX_dataexisting_zipcodeus` ON `dataexisting_zipcodeus` (`ZipCodeID` ASC, `ZipCode` ASC, `ZipCodeType` ASC, `City` ASC, `State` ASC, `Lattitude` ASC, `Longitude` ASC, `Location` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_zipcodeUS_Status` ON `dataexisting_zipcodeus` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_dataexisting_zipcodeus_registeredapp` ON `dataexisting_zipcodeus` (`RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_sensitivityflag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_sensitivityflag` ;

CREATE TABLE IF NOT EXISTS `refdata_sensitivityflag` (
                                                         `SensitiveFlagID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                         `SensitiveFlagDesc` VARCHAR(30) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`SensitiveFlagID`),
    CONSTRAINT `FK_refdata_sensitivityflag_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_sensitivityflag_status` ON `refdata_sensitivityflag` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_SensitivityFlag` ON `refdata_sensitivityflag` (`SensitiveFlagID` ASC, `SensitiveFlagDesc` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `platform_dataattributes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_dataattributes` ;

CREATE TABLE IF NOT EXISTS `platform_dataattributes` (
                                                         `PlatformDataAttributesID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                         `DataAttributeName` VARCHAR(50) NULL DEFAULT NULL,
    `SensitivityFlagID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `PlatformDataAttributeGUID` CHAR(38) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_dataattributes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_platformdataattributes_sensitivtyflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_platformdataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platformdataattributes_status` ON `platform_dataattributes` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_platformdataattributes_sensitivtyflag` ON `platform_dataattributes` (`SensitivityFlagID` ASC) VISIBLE;

CREATE INDEX `FK_platform_dataattributes_registeredapp` ON `platform_dataattributes` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_Platform_DataAttributes` ON `platform_dataattributes` (`PlatformDataAttributesID` ASC, `DataAttributeName` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `PlatformDataAttributeGUID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_datagentypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_datagentypes` ;

CREATE TABLE IF NOT EXISTS `refdata_datagentypes` (
                                                      `DataGenTypeID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                      `DataGenTypeDescription` VARCHAR(65) NULL DEFAULT NULL,
    `Definition` VARCHAR(255) NULL DEFAULT NULL,
    `DataAttributeID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`DataGenTypeID`),
    CONSTRAINT `FK_RefDataDataGenTypes_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_RefDataDataGenTypes_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_RefDataDataGenTypes_DataAttributes` ON `refdata_datagentypes` (`DataAttributeID` ASC) VISIBLE;

CREATE INDEX `FK_RefDataDataGenTypes_Status` ON `refdata_datagentypes` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_DataGenTypes` ON `refdata_datagentypes` (`DataGenTypeID` ASC, `DataGenTypeDescription` ASC, `Definition` ASC, `DataAttributeID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_accountnumbers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_accountnumbers` ;

CREATE TABLE IF NOT EXISTS `datagenerated_accountnumbers` (
                                                              `AccountNumbersID` BIGINT NOT NULL AUTO_INCREMENT,
                                                              `AccountNumberValue` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`AccountNumbersID`),
    CONSTRAINT `FK_datagenerated_accountnumbers_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_accountnumbers_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_accountnumbers_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_datagenerated_accountnumbers` ON `datagenerated_accountnumbers` (`AccountNumberValue` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_accountnumbers_status` ON `datagenerated_accountnumbers` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_accountnumbers_registeredapp` ON `datagenerated_accountnumbers` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_accountnumbers_datagentype` ON `datagenerated_accountnumbers` (`DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_AccountNumbers` ON `datagenerated_accountnumbers` (`AccountNumbersID` ASC, `AccountNumberValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_addresses` ;

CREATE TABLE IF NOT EXISTS `datagenerated_addresses` (
                                                         `AddressID` BIGINT NOT NULL AUTO_INCREMENT,
                                                         `AddressStreet` VARCHAR(99) NULL DEFAULT NULL,
    `AddressStreet2` VARCHAR(59) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`AddressID`),
    CONSTRAINT `FK_datagenerated_addresses_datagenttype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_addresses_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_addresses_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_Addresses` ON `datagenerated_addresses` (`AddressStreet` ASC, `AddressStreet2` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_addresses_status` ON `datagenerated_addresses` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_addresses_registeredapp` ON `datagenerated_addresses` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_addresses_datagenttype` ON `datagenerated_addresses` (`DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `IDX_datagenerated_addresses` ON `datagenerated_addresses` (`AddressID` ASC, `AddressStreet` ASC, `AddressStreet2` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_bankaccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_bankaccount` ;

CREATE TABLE IF NOT EXISTS `datagenerated_bankaccount` (
                                                           `BankAccountsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                           `BankAccountValue` VARCHAR(17) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`BankAccountsID`),
    CONSTRAINT `datagenerated_bankaccount__datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_bankaccount_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_bankaccount_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_BankAccounts` ON `datagenerated_bankaccount` (`BankAccountValue` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_bankaccount_Status` ON `datagenerated_bankaccount` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_bankaccount_registeredapp` ON `datagenerated_bankaccount` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `datagenerated_bankaccount__datagentype` ON `datagenerated_bankaccount` (`DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_BankAccounts` ON `datagenerated_bankaccount` (`BankAccountsID` ASC, `BankAccountValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_creditcard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_creditcard` ;

CREATE TABLE IF NOT EXISTS `datagenerated_creditcard` (
                                                          `CreditCardID` BIGINT NOT NULL AUTO_INCREMENT,
                                                          `CreditCardNumber` VARCHAR(20) NULL DEFAULT NULL,
    `CreditCardName` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`CreditCardID`),
    CONSTRAINT `datagenerated_creditcard__datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_creditcard_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_creditcard_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_datagenerated_creditcard` ON `datagenerated_creditcard` (`CreditCardNumber` ASC, `CreditCardName` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_creditcard_Status` ON `datagenerated_creditcard` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_creditcard_registeredapp` ON `datagenerated_creditcard` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `datagenerated_creditcard__datagentype` ON `datagenerated_creditcard` (`DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_CreditCard` ON `datagenerated_creditcard` (`CreditCardID` ASC, `CreditCardNumber` ASC, `CreditCardName` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_dateofbirth`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_dateofbirth` ;

CREATE TABLE IF NOT EXISTS `datagenerated_dateofbirth` (
                                                           `DateofBirthsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                           `DateOfBirth` VARCHAR(12) NULL DEFAULT NULL,
    `DateOfBirthDate` DATE NULL DEFAULT NULL,
    `Age` INT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DateofBirthsID`),
    CONSTRAINT `FK_datagenerated_dateofbirth_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_dateofbirth_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_DateOfBirths` ON `datagenerated_dateofbirth` (`DateOfBirth` ASC, `DateOfBirthDate` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_dateofbirth_Status` ON `datagenerated_dateofbirth` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_dateofbirth_registeredapp` ON `datagenerated_dateofbirth` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_DateOfBirths` ON `datagenerated_dateofbirth` (`DateofBirthsID` ASC, `DateOfBirth` ASC, `DateOfBirthDate` ASC, `Age` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_driverslicenses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_driverslicenses` ;

CREATE TABLE IF NOT EXISTS `datagenerated_driverslicenses` (
                                                               `DriversLicensesID` BIGINT NOT NULL AUTO_INCREMENT,
                                                               `DLN` VARCHAR(25) NULL DEFAULT NULL,
    `StateCode` VARCHAR(2) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DriversLicensesID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_USStates`
    FOREIGN KEY (`StateCode`)
    REFERENCES `refdata_usstates` (`StateID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_DriversLicenses` ON `datagenerated_driverslicenses` (`DLN` ASC, `StateCode` ASC, `DataGenTypeID` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_driverslicenses_Status` ON `datagenerated_driverslicenses` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_driverslicenses_USStates` ON `datagenerated_driverslicenses` (`StateCode` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_driverslicenses_registeredapp` ON `datagenerated_driverslicenses` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_DriversLicenses` ON `datagenerated_driverslicenses` (`DriversLicensesID` ASC, `CreatedDate` ASC, `DLN` ASC, `StateCode` ASC, `StatusID` ASC, `DataGenTypeID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_driverslicenses_datagentype` ON `datagenerated_driverslicenses` (`DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_ein`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_ein` ;

CREATE TABLE IF NOT EXISTS `datagenerated_ein` (
                                                   `EINID` BIGINT NOT NULL AUTO_INCREMENT,
                                                   `EINValue` VARCHAR(10) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`EINID`),
    CONSTRAINT `FK_datagenerated_ein_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_ein_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_EIN` ON `datagenerated_ein` (`EINValue` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_ein_Status` ON `datagenerated_ein` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_ein_registeredapp` ON `datagenerated_ein` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_EIN` ON `datagenerated_ein` (`EINID` ASC, `EINValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_phonenumber`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_phonenumber` ;

CREATE TABLE IF NOT EXISTS `datagenerated_phonenumber` (
                                                           `PhoneNumberID` BIGINT NOT NULL AUTO_INCREMENT,
                                                           `PhoneNumberValue` VARCHAR(8) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PhoneNumberID`),
    CONSTRAINT `FK_datagenerated_phonenumber_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_phonenumbers_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGeneratedPhoneNumbers` ON `datagenerated_phonenumber` (`PhoneNumberValue` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_phonenumber_registeredapp` ON `datagenerated_phonenumber` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_phonenumbers_Status` ON `datagenerated_phonenumber` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_PhoneNumbers` ON `datagenerated_phonenumber` (`PhoneNumberID` ASC, `PhoneNumberValue` ASC, `RegisteredApp` ASC, `CreatedUser` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_phonenumbersintl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_phonenumbersintl` ;

CREATE TABLE IF NOT EXISTS `datagenerated_phonenumbersintl` (
                                                                `PhoneNumberIntlID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                `PhoneNumberValue` VARCHAR(12) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CountryId` SMALLINT NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PhoneNumberIntlID`),
    CONSTRAINT `FK_datagenerated_phonenumbersintl_Country`
    FOREIGN KEY (`CountryId`)
    REFERENCES `refdata_countries` (`CountryID`),
    CONSTRAINT `FK_datagenerated_phonenumbersintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_phonenumbersintl_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_datagenerated_phonenumbersintl` ON `datagenerated_phonenumbersintl` (`PhoneNumberValue` ASC, `CountryId` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_phonenumbersintl_Country` ON `datagenerated_phonenumbersintl` (`CountryId` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_phonenumbersintl_Status` ON `datagenerated_phonenumbersintl` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_phonenumbersintl_registeredapp` ON `datagenerated_phonenumbersintl` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_PhoneNumbersIntl` ON `datagenerated_phonenumbersintl` (`PhoneNumberIntlID` ASC, `PhoneNumberValue` ASC, `CountryId` ASC, `CreatedDate` ASC, `CreatedUser` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_socialsecuritynumber`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_socialsecuritynumber` ;

CREATE TABLE IF NOT EXISTS `datagenerated_socialsecuritynumber` (
                                                                    `SocialSecurityNumberID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                    `SocialSecurityNumberValue` VARCHAR(11) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`SocialSecurityNumberID`),
    CONSTRAINT `FK_datagenerated_socialsecuritynumber_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_socialsecuritynumber_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_SocialSecurityNumbers` ON `datagenerated_socialsecuritynumber` (`SocialSecurityNumberValue` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_socialsecuritynumber_Status` ON `datagenerated_socialsecuritynumber` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_socialsecuritynumber_registeredapp` ON `datagenerated_socialsecuritynumber` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_SocialSecurityNumber` ON `datagenerated_socialsecuritynumber` (`SocialSecurityNumberID` ASC, `SocialSecurityNumberValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datagenerated_useridentities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datagenerated_useridentities` ;

CREATE TABLE IF NOT EXISTS `datagenerated_useridentities` (
                                                              `UserIdentitiesID` BIGINT NOT NULL AUTO_INCREMENT,
                                                              `UserIdentityValue` VARCHAR(20) NULL DEFAULT NULL,
    `UserDomain` VARCHAR(20) NULL DEFAULT NULL,
    `AdditionalAttributes` VARCHAR(40) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`UserIdentitiesID`),
    CONSTRAINT `datagenerated_useridentities_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_useridentities_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_useridentities_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_DataGenerated_UserIdentities` ON `datagenerated_useridentities` (`UserIdentityValue` ASC, `UserDomain` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_useridentities_Status` ON `datagenerated_useridentities` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_datagenerated_useridentities_registeredapp` ON `datagenerated_useridentities` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_DataGenerated_Identities` ON `datagenerated_useridentities` (`UserIdentitiesID` ASC, `UserIdentityValue` ASC, `UserDomain` ASC, `CreatedDate` ASC, `StatusID` ASC, `AdditionalAttributes` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE;

CREATE INDEX `datagenerated_useridentities_datagentype` ON `datagenerated_useridentities` (`DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datamodel_datatables`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamodel_datatables` ;

CREATE TABLE IF NOT EXISTS `datamodel_datatables` (
    `TableName` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
    `TableInformation` VARCHAR(249) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`TableName`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IDX_datamodel_datatables` ON `datamodel_datatables` (`TableName` ASC, `TableInformation` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datamodel_domain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datamodel_domain` ;

CREATE TABLE IF NOT EXISTS `datamodel_domain` (
    `DomainName` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
    `DomainInformation` VARCHAR(249) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`DomainName`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IDX_datamodel_domain` ON `datamodel_domain` (`DomainName` ASC, `DomainInformation` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_address` ;

CREATE TABLE IF NOT EXISTS `datastructure_address` (
                                                       `CompleteAddressID` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `Address1` VARCHAR(99) NULL DEFAULT NULL,
    `City` VARCHAR(70) NULL DEFAULT NULL,
    `StateID` VARCHAR(2) NULL DEFAULT NULL,
    `ZipCode` VARCHAR(10) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`CompleteAddressID`),
    CONSTRAINT `FK_databuilt_address_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_address_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_address` ON `datastructure_address` (`Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_address_status` ON `datastructure_address` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_databuilt_completeaddress` ON `datastructure_address` (`CompleteAddressID` ASC, `Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_address_registeredapp` ON `datastructure_address` (`RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_bankaccount`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_bankaccount` ;

CREATE TABLE IF NOT EXISTS `datastructure_bankaccount` (
                                                           `DataBuiltBankAccountsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                           `BankAccountNumber` VARCHAR(12) NULL DEFAULT NULL,
    `BankAccountName` VARCHAR(75) NULL DEFAULT NULL,
    `BankRoutingID` VARCHAR(9) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltBankAccountsID`),
    CONSTRAINT `FK_databuilt_bankaccount_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `fk_databuilt_bankAccounts_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_bankaccount` ON `datastructure_bankaccount` (`BankAccountNumber` ASC, `BankRoutingID` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `fk_databuilt_bankAccounts_status` ON `datastructure_bankaccount` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IX_databuilt_bankAccounts` ON `datastructure_bankaccount` (`DataBuiltBankAccountsID` ASC, `BankAccountName` ASC, `BankAccountNumber` ASC, `BankRoutingID` ASC, `StatusID` ASC, `CreatedDate` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_bankaccount_registeredapp` ON `datastructure_bankaccount` (`RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_corporations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_corporations` ;

CREATE TABLE IF NOT EXISTS `datastructure_corporations` (
                                                            `DataBuiltCorporationID` BIGINT NOT NULL AUTO_INCREMENT,
                                                            `CorporationName` VARCHAR(99) NULL DEFAULT NULL,
    `Address1` VARCHAR(99) NULL DEFAULT NULL,
    `City` VARCHAR(70) NULL DEFAULT NULL,
    `StateID` VARCHAR(2) NULL DEFAULT NULL,
    `ZipCode` VARCHAR(10) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltCorporationID`),
    CONSTRAINT `FK_databuilt_corporations_resiteredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_corporations_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_corporations` ON `datastructure_corporations` (`CorporationName` ASC, `Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_corporations_status` ON `datastructure_corporations` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_corporations_resiteredapp` ON `datastructure_corporations` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_databuilt_corporations` ON `datastructure_corporations` (`DataBuiltCorporationID` ASC, `CorporationName` ASC, `Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_names`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_names` ;

CREATE TABLE IF NOT EXISTS `datastructure_names` (
                                                     `DataBuiltNamesID` BIGINT NOT NULL AUTO_INCREMENT,
                                                     `CompleteName` VARCHAR(100) NULL DEFAULT NULL,
    `Gender` VARCHAR(1) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltNamesID`),
    CONSTRAINT `FK_databuilt_completenames_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_databuilt_names_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_databuilt_completenames_status` ON `datastructure_names` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IX_databuilt_names_databuiltnamesid` ON `datastructure_names` (`DataBuiltNamesID` ASC, `CompleteName` ASC, `Gender` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_names_registeredapp` ON `datastructure_names` (`RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_persondemographics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_persondemographics` ;

CREATE TABLE IF NOT EXISTS `datastructure_persondemographics` (
                                                                  `PersonDemographicsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                  `DLN` VARCHAR(25) NULL DEFAULT NULL,
    `DLNState` VARCHAR(2) NULL DEFAULT NULL,
    `SSN` VARCHAR(11) NULL DEFAULT NULL,
    `DOBValue` VARCHAR(12) NULL DEFAULT NULL,
    `DOBDate` DATE NULL DEFAULT NULL,
    `Age` INT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PersonDemographicsID`),
    CONSTRAINT `FK_databuilt_persondemographics_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_persondemographics_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_persondemographics` ON `datastructure_persondemographics` (`DLN` ASC, `DLNState` ASC, `SSN` ASC, `DOBDate` ASC, `DOBValue` ASC, `Age` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_persondemographics_status` ON `datastructure_persondemographics` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_persondemographics_registeredapp` ON `datastructure_persondemographics` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_dataabuilt_persondemographics` ON `datastructure_persondemographics` (`PersonDemographicsID` ASC, `DLN` ASC, `DLNState` ASC, `SSN` ASC, `DOBValue` ASC, `DOBDate` ASC, `Age` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_phonenumbers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_phonenumbers` ;

CREATE TABLE IF NOT EXISTS `datastructure_phonenumbers` (
                                                            `DataBuiltPhoneNumbersID` BIGINT NOT NULL AUTO_INCREMENT,
                                                            `AreaCode` VARCHAR(3) NULL DEFAULT NULL,
    `PhoneNumber` VARCHAR(8) NULL DEFAULT NULL,
    `CompletePhoneNumber` VARCHAR(14) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltPhoneNumbersID`),
    CONSTRAINT `FK_databuilt_phonenumbers_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_phonenumbers_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `IDX_databuilt_phonenumbers_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_phonenumbers` ON `datastructure_phonenumbers` (`AreaCode` ASC, `PhoneNumber` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_phonenumbers_status` ON `datastructure_phonenumbers` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_phonenumbers_registeredapp` ON `datastructure_phonenumbers` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_databuilt_phonenumbers` ON `datastructure_phonenumbers` (`DataBuiltPhoneNumbersID` ASC, `AreaCode` ASC, `PhoneNumber` ASC, `CompletePhoneNumber` ASC, `StatusID` ASC, `CreatedDate` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_phonenumbersintl`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_phonenumbersintl` ;

CREATE TABLE IF NOT EXISTS `datastructure_phonenumbersintl` (
                                                                `DataBuiltPhoneNumbersIntlID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                `AreaCode` VARCHAR(3) NULL DEFAULT NULL,
    `PhoneNumber` VARCHAR(8) NULL DEFAULT NULL,
    `CompletePhoneNumber` VARCHAR(14) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltPhoneNumbersIntlID`),
    CONSTRAINT `FK_databuilt_phonenumbersintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_phonenumbersintl_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `IDX_databuilt_phonenumbersintl_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_phonenumbersintl` ON `datastructure_phonenumbersintl` (`AreaCode` ASC, `PhoneNumber` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_phonenumbersintl_registeredapp` ON `datastructure_phonenumbersintl` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_phonenumbersintl_status` ON `datastructure_phonenumbersintl` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_databuilt_phonenumbersintl` ON `datastructure_phonenumbersintl` (`DataBuiltPhoneNumbersIntlID` ASC, `AreaCode` ASC, `PhoneNumber` ASC, `CompletePhoneNumber` ASC, `StatusID` ASC, `CreatedDate` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `datastructure_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `datastructure_products` ;

CREATE TABLE IF NOT EXISTS `datastructure_products` (
                                                        `DatabuiltProductsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                        `ProductID` VARCHAR(20) NULL DEFAULT NULL,
    `ProductName` VARCHAR(99) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DatabuiltProductsID`),
    CONSTRAINT `FK_databuilt_products_regsiteredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_products_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE UNIQUE INDEX `IDX_UC_databuilt_products` ON `datastructure_products` (`ProductID` ASC, `ProductName` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_products_status` ON `datastructure_products` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_databuilt_products` ON `datastructure_products` (`DatabuiltProductsID` ASC, `ProductID` ASC, `ProductName` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_databuilt_products_regsiteredapp` ON `datastructure_products` (`RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_industrystd`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_industrystd` ;

CREATE TABLE IF NOT EXISTS `refdata_industrystd` (
    `IndustryStd` VARCHAR(6) NOT NULL,
    `IndustryStdDesc` VARCHAR(30) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`IndustryStd`),
    CONSTRAINT `FK_refdata_industrystd_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_industrystd_status` ON `refdata_industrystd` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_IndustryStd` ON `refdata_industrystd` (`IndustryStd` ASC, `IndustryStdDesc` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_codeset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_codeset` ;

CREATE TABLE IF NOT EXISTS `refdata_codeset` (
                                                 `CodeSetsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                 `CodeSetName` VARCHAR(50) NULL DEFAULT NULL,
    `IndustryStd` VARCHAR(6) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `CodesetGUID` CHAR(38) NULL DEFAULT NULL,
    `FieldMapping` VARCHAR(40) CHARACTER SET 'latin1' NULL DEFAULT NULL,
    `SensitivityFlagID` SMALLINT NULL DEFAULT NULL,
    `ExternalTableID` VARCHAR(20) NULL DEFAULT NULL,
    `ExternalNotes` VARCHAR(149) NULL DEFAULT NULL,
    `ExternalLink` VARCHAR(99) NULL DEFAULT NULL,
    PRIMARY KEY (`CodeSetsID`),
    CONSTRAINT `FK_refdata_codeset_industrystd`
    FOREIGN KEY (`IndustryStd`)
    REFERENCES `refdata_industrystd` (`IndustryStd`),
    CONSTRAINT `FK_refdata_codeset_sensitivityflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_refdata_codesets_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_codesets_status` ON `refdata_codeset` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_codeset_industrystd` ON `refdata_codeset` (`IndustryStd` ASC) VISIBLE;

CREATE INDEX `FK_refdata_codeset_sensitivityflag` ON `refdata_codeset` (`SensitivityFlagID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_CodeSets` ON `refdata_codeset` (`CodeSetsID` ASC, `CodeSetName` ASC, `IndustryStd` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `CodesetGUID` ASC, `FieldMapping` ASC, `SensitivityFlagID` ASC, `ExternalTableID` ASC, `ExternalNotes` ASC, `ExternalLink` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_legalentities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_legalentities` ;

CREATE TABLE IF NOT EXISTS `impl_legalentities` (
    `LegalEntityGUID` CHAR(38) NOT NULL,
    `LocationName` VARCHAR(50) NULL DEFAULT NULL,
    `Address` VARCHAR(75) NULL DEFAULT NULL,
    `City` VARCHAR(60) NULL DEFAULT NULL,
    `StateID` VARCHAR(2) NULL DEFAULT NULL,
    `ZipCode` VARCHAR(12) NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `LocationURL` VARCHAR(99) NULL DEFAULT NULL,
    `LocationPhone` VARCHAR(12) NULL DEFAULT NULL,
    PRIMARY KEY (`LegalEntityGUID`),
    CONSTRAINT `FK_refdata_location_states`
    FOREIGN KEY (`StateID`)
    REFERENCES `refdata_usstates` (`StateID`),
    CONSTRAINT `FK_refdata_location_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_location_states` ON `impl_legalentities` (`StateID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_location_status` ON `impl_legalentities` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_LegalEntity2` ON `impl_legalentities` (`LegalEntityGUID` ASC, `LocationName` ASC, `Address` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedUser` ASC, `StatusID` ASC, `CreatedDate` ASC, `LocationURL` ASC, `LocationPhone` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_organization` ;

CREATE TABLE IF NOT EXISTS `impl_organization` (
    `OrganizationGUID` CHAR(38) NOT NULL,
    `OrganizationInternalCode` VARCHAR(10) NULL DEFAULT NULL,
    `OrganizationInternalID` VARCHAR(10) NULL DEFAULT NULL,
    `OrganizationName` VARCHAR(50) NULL DEFAULT NULL,
    `Address` VARCHAR(75) NULL DEFAULT NULL,
    `City` VARCHAR(60) NULL DEFAULT NULL,
    `StateID` VARCHAR(2) NULL DEFAULT NULL,
    `ZipCode` VARCHAR(12) NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `LegalEntityGUID` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`OrganizationGUID`),
    CONSTRAINT `FK_refdata_organization_legalentity`
    FOREIGN KEY (`LegalEntityGUID`)
    REFERENCES `impl_legalentities` (`LegalEntityGUID`),
    CONSTRAINT `FK_refdata_organization_states`
    FOREIGN KEY (`StateID`)
    REFERENCES `refdata_usstates` (`StateID`),
    CONSTRAINT `FK_refdata_organization_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_organization_status` ON `impl_organization` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_organization_states` ON `impl_organization` (`StateID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_organization_legalentity` ON `impl_organization` (`LegalEntityGUID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_Organization` ON `impl_organization` (`OrganizationGUID` ASC, `OrganizationName` ASC, `Address` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `OrganizationInternalCode` ASC, `OrganizationInternalID` ASC, `LegalEntityGUID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_codesetstoapplication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_codesetstoapplication` ;

CREATE TABLE IF NOT EXISTS `impl_codesetstoapplication` (
                                                            `CodeSetToApplicationID` BIGINT NOT NULL AUTO_INCREMENT,
                                                            `CodeSetsID` BIGINT NOT NULL,
                                                            `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
                                                            `StatusID` SMALLINT NULL DEFAULT '1',
                                                            `OrganizationID` VARCHAR(38) NULL DEFAULT NULL,
    `ApplicationID` VARCHAR(38) NULL DEFAULT NULL,
    `CodeValue` VARCHAR(20) NULL DEFAULT NULL,
    `CodeDesc` VARCHAR(129) NULL DEFAULT NULL,
    `FormalName` VARCHAR(45) NULL DEFAULT NULL,
    `Address` VARCHAR(45) NULL DEFAULT NULL,
    `CityStateZip` VARCHAR(99) NULL DEFAULT NULL,
    `PhoneNumber` VARCHAR(20) NULL DEFAULT NULL,
    `OtherField1` VARCHAR(49) NULL DEFAULT NULL,
    `OtherField2` VARCHAR(49) NULL DEFAULT NULL,
    `TermLow` VARCHAR(25) NULL DEFAULT NULL,
    `TermHigh` VARCHAR(25) NULL DEFAULT NULL,
    PRIMARY KEY (`CodeSetToApplicationID`),
    CONSTRAINT `FK_terms_codesetstoapplication_Application`
    FOREIGN KEY (`ApplicationID`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_terms_codesetstoapplication_codeset`
    FOREIGN KEY (`CodeSetsID`)
    REFERENCES `refdata_codeset` (`CodeSetsID`),
    CONSTRAINT `FK_terms_codesetstoapplication_Org`
    FOREIGN KEY (`OrganizationID`)
    REFERENCES `impl_organization` (`OrganizationGUID`),
    CONSTRAINT `FK_terms_codesetstoapplication_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_terms_codesetstoapplication_Application` ON `impl_codesetstoapplication` (`ApplicationID` ASC) VISIBLE;

CREATE INDEX `FK_terms_codesetstoapplication_Org` ON `impl_codesetstoapplication` (`OrganizationID` ASC) VISIBLE;

CREATE INDEX `FK_terms_codesetstoapplication_status` ON `impl_codesetstoapplication` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_terms_codesetstoapplication_codeset` ON `impl_codesetstoapplication` (`CodeSetsID` ASC) VISIBLE;

CREATE INDEX `IDX_Terms_CodeSetsToApplication` ON `impl_codesetstoapplication` (`CodeSetToApplicationID` ASC, `CodeSetsID` ASC, `CodeValue` ASC, `CodeDesc` ASC, `CreatedDate` ASC, `OrganizationID` ASC, `ApplicationID` ASC, `StatusID` ASC, `FormalName` ASC, `Address` ASC, `CityStateZip` ASC, `PhoneNumber` ASC, `OtherField1` ASC, `OtherField2` ASC, `TermLow` ASC, `TermHigh` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_terminologystd`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_terminologystd` ;

CREATE TABLE IF NOT EXISTS `refdata_terminologystd` (
                                                        `TerminologyStdID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                        `TerminologyStd` VARCHAR(25) NOT NULL,
    `TerminologyStdVersion` VARCHAR(10) NOT NULL,
    `TerminologyStdDesc` VARCHAR(129) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`TerminologyStdID`),
    CONSTRAINT `FK_TerminologyStd_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_TerminologyStd_status` ON `refdata_terminologystd` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_Refdata_TerminologyStd` ON `refdata_terminologystd` (`TerminologyStdID` ASC, `TerminologyStd` ASC, `TerminologyStdVersion` ASC, `TerminologyStdDesc` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_codesetscrossmaps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_codesetscrossmaps` ;

CREATE TABLE IF NOT EXISTS `impl_codesetscrossmaps` (
                                                        `CodeSetCrossMapID` BIGINT NOT NULL AUTO_INCREMENT,
                                                        `CodeSetsID` BIGINT NOT NULL,
                                                        `CodeSetToApplicationID` BIGINT NULL DEFAULT NULL,
                                                        `TerminologyStdTo` SMALLINT NULL DEFAULT NULL,
                                                        `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
                                                        `StatusID` SMALLINT NULL DEFAULT '1',
                                                        `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `TransformCodeValue` VARCHAR(40) NULL DEFAULT NULL,
    `TransformCodeDesc` VARCHAR(129) NULL DEFAULT NULL,
    PRIMARY KEY (`CodeSetCrossMapID`),
    CONSTRAINT `FK_terms_codesetscrossmap_codesettoapp`
    FOREIGN KEY (`CodeSetToApplicationID`)
    REFERENCES `impl_codesetstoapplication` (`CodeSetToApplicationID`),
    CONSTRAINT `FK_termscodesetscrossmap_codeset`
    FOREIGN KEY (`CodeSetsID`)
    REFERENCES `refdata_codeset` (`CodeSetsID`),
    CONSTRAINT `FK_termscodesetscrossmap_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_termscodesetscrossmaps_termstd`
    FOREIGN KEY (`TerminologyStdTo`)
    REFERENCES `refdata_terminologystd` (`TerminologyStdID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FK_termscodesetscrossmap_codeset` ON `impl_codesetscrossmaps` (`CodeSetsID` ASC) VISIBLE;

CREATE INDEX `FK_termscodesetscrossmap_status` ON `impl_codesetscrossmaps` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_termscodesetscrossmaps_termstd` ON `impl_codesetscrossmaps` (`TerminologyStdTo` ASC) VISIBLE;

CREATE INDEX `FK_terms_codesetscrossmap_codesettoapp` ON `impl_codesetscrossmaps` (`CodeSetToApplicationID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_codesettomsgtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_codesetstomsgtype` ;

CREATE TABLE IF NOT EXISTS `impl_codesetstomsgtype` (
                                                       `CodeSetToMsgTypeID` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `CodeSetsID` BIGINT NULL DEFAULT NULL,
                                                       `MsgType` VARCHAR(75) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `AppGUID` CHAR(38) NULL DEFAULT NULL,
    `OrgGUID` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`CodeSetToMsgTypeID`),
    CONSTRAINT `FK_refdata_codesettomsgtype_app`
    FOREIGN KEY (`AppGUID`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_refdata_codesettomsgtype_codesets`
    FOREIGN KEY (`CodeSetsID`)
    REFERENCES `refdata_codeset` (`CodeSetsID`),
    CONSTRAINT `FK_refdata_codesettomsgtype_org`
    FOREIGN KEY (`OrgGUID`)
    REFERENCES `impl_organization` (`OrganizationGUID`),
    CONSTRAINT `FK_refdata_codesettomsgtype_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_codesetstomsgtype_codesets` ON `impl_codesetstomsgtype` (`CodeSetsID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_codesetstomsgtype_status` ON `impl_codesetstomsgtype` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_CodeSetsToMsgType` ON `impl_codesetstomsgtype` (`CodeSetToMsgTypeID` ASC, `CodeSetsID` ASC, `MsgType` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `AppGUID` ASC, `OrgGUID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_codesetstomsgtype_app` ON `impl_codesetstomsgtype` (`AppGUID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_codesetstomsgtype_org` ON `impl_codesetstomsgtype` (`OrgGUID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_rulesets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_rulesets` ;

CREATE TABLE IF NOT EXISTS `impl_rulesets` (
                                               `RuleID` BIGINT NOT NULL AUTO_INCREMENT,
                                               `RuleName` VARCHAR(65) NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `ExpirationDate` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`RuleID`),
    CONSTRAINT `FK_platform_rulesets_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_rulesets_status` ON `impl_rulesets` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_Platform_RuleSets` ON `impl_rulesets` (`RuleID` ASC, `RuleName` ASC, `CreatedUser` ASC, `CreatedDate` ASC, `ExpirationDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_operationtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_operationtype` ;

CREATE TABLE IF NOT EXISTS `refdata_operationtype` (
    `OperationTypeID` VARCHAR(7) NOT NULL,
    `OperationTypeName` VARCHAR(60) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`OperationTypeID`),
    CONSTRAINT `FK_refdata_operationtype_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_operationtype_status` ON `refdata_operationtype` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_RefData_OperationType` ON `refdata_operationtype` (`OperationTypeID` ASC, `OperationTypeName` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `impl_rulesetsdefinitions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `impl_rulesetsdefinitions` ;

CREATE TABLE IF NOT EXISTS `impl_rulesetsdefinitions` (
    `RulesetDefinitionsID` CHAR(38) NOT NULL,
    `RulesetDefinitionName` VARCHAR(50) NULL DEFAULT NULL,
    `RuleSetID` BIGINT NULL DEFAULT NULL,
    `StepOrderID` SMALLINT NULL DEFAULT NULL,
    `OperationTypeID` VARCHAR(7) NULL DEFAULT NULL,
    `RulesetDefValue` CHAR(40) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `EffectiveDate` TIMESTAMP NULL DEFAULT NULL,
    `ApplicationID` VARCHAR(38) NULL DEFAULT NULL,
    `TermDate` TIMESTAMP NULL DEFAULT NULL,
    `DataAttributeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`RulesetDefinitionsID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_operationtype`
    FOREIGN KEY (`OperationTypeID`)
    REFERENCES `refdata_operationtype` (`OperationTypeID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_registeredapp`
    FOREIGN KEY (`ApplicationID`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_ruleset`
    FOREIGN KEY (`RuleSetID`)
    REFERENCES `impl_rulesets` (`RuleID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_rulesetsdefinitions_operationtype` ON `impl_rulesetsdefinitions` (`OperationTypeID` ASC) VISIBLE;

CREATE INDEX `FK_platform_rulesetsdefinitions_registeredapp` ON `impl_rulesetsdefinitions` (`ApplicationID` ASC) VISIBLE;

CREATE INDEX `FK_platform_rulesetsdefinitions_ruleset` ON `impl_rulesetsdefinitions` (`RuleSetID` ASC) VISIBLE;

CREATE INDEX `FK_platform_rulesetsdefinitions_status` ON `impl_rulesetsdefinitions` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_platform_rulesetsdefinitions_dataattributes` ON `impl_rulesetsdefinitions` (`DataAttributeID` ASC) VISIBLE;

CREATE INDEX `IDX_Platform_RulesetsDefinitions` ON `impl_rulesetsdefinitions` (`RulesetDefinitionsID` ASC, `RuleSetID` ASC, `RulesetDefinitionName` ASC, `StepOrderID` ASC, `OperationTypeID` ASC, `RulesetDefValue` ASC, `CreatedDate` ASC, `EffectiveDate` ASC, `StatusID` ASC, `ApplicationID` ASC, `TermDate` ASC, `DataAttributeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `platform_appsettings_general`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_appsettings_general` ;

CREATE TABLE IF NOT EXISTS `platform_appsettings_general` (
                                                              `AppSettingsID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                              `AppSettingName` VARCHAR(50) NULL DEFAULT NULL,
    `AppSettingValue` VARCHAR(199) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    `DefaultDataGenerationApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`AppSettingsID`),
    CONSTRAINT `FK_platform_appsettings_general_datagenapp`
    FOREIGN KEY (`DefaultDataGenerationApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_platform_appsettings_general_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_refdata_appsettings_general_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_appsettings_general_datagenapp` ON `platform_appsettings_general` (`DefaultDataGenerationApp` ASC) VISIBLE;

CREATE INDEX `FK_platform_appsettings_general_registeredapp` ON `platform_appsettings_general` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_refdata_appsettings_general_status` ON `platform_appsettings_general` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_PlatformData_AppSettings_General` ON `platform_appsettings_general` (`AppSettingsID` ASC, `AppSettingName` ASC, `AppSettingValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC, `DefaultDataGenerationApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `platform_config_datagen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_config_datagen` ;

CREATE TABLE IF NOT EXISTS `platform_config_datagen` (
                                                         `DataGenConfigID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                         `DataTypeGenConfigName` VARCHAR(25) NULL DEFAULT NULL,
    `DataAttributeID` SMALLINT NULL DEFAULT NULL,
    `RunQuantity` INT NULL DEFAULT NULL,
    `MinuteInterval` SMALLINT NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `ApplicationID` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataGenConfigID`),
    CONSTRAINT `FK_platform_config_datagen_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_config_datagen_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_platform_config_datagen_registeredapp`
    FOREIGN KEY (`ApplicationID`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_platform_config_datagen_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_datagenconfig_dataattributes` ON `platform_config_datagen` (`DataAttributeID` ASC) VISIBLE;

CREATE INDEX `FK_platform_datagenconfig_status` ON `platform_config_datagen` (`StatusID` ASC) VISIBLE;

CREATE INDEX `platform_config_datagen_registeredapp` ON `platform_config_datagen` (`ApplicationID` ASC) VISIBLE;

CREATE INDEX `IDX_PlatformConfigDataGen` ON `platform_config_datagen` (`DataGenConfigID` ASC, `DataAttributeID` ASC, `DataTypeGenConfigName` ASC, `RunQuantity` ASC, `MinuteInterval` ASC, `CreatedDate` ASC, `CreatedUser` ASC, `StatusID` ASC, `ApplicationID` ASC) VISIBLE;

CREATE INDEX `FK_platform_config_datagen_datagentype` ON `platform_config_datagen` (`DataGenTypeID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `platform_datastructures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_datastructures` ;

CREATE TABLE IF NOT EXISTS `platform_datastructures` (
                                                         `PlatformDataStructuresID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                         `DataStructureName` VARCHAR(50) NULL DEFAULT NULL,
    `SensitivityFlagID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `PlatformDataStructuresGUID` CHAR(38) NULL DEFAULT NULL,
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PlatformDataStructuresID`),
    CONSTRAINT `FK_platform_datastructures__registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_platform_datastructures_sensitivityflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_platform_datastructures_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_datastructures_status` ON `platform_datastructures` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_platform_datastructures__registeredapp` ON `platform_datastructures` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_platform_datastructures_sensitivityflag` ON `platform_datastructures` (`SensitivityFlagID` ASC) VISIBLE;

CREATE INDEX `IDX_Platform_DataStructures` ON `platform_datastructures` (`PlatformDataStructuresID` ASC, `DataStructureName` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `PlatformDataStructuresGUID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `platform_datastructurestodataattributes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `platform_datastructurestodataattributes` ;

CREATE TABLE IF NOT EXISTS `platform_datastructurestodataattributes` (
                                                                         `PlatformDataStructuresToDataAttributesID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                         `PlatformDataStructuresID` SMALLINT NULL DEFAULT NULL,
                                                                         `CompositeDataStructureName` VARCHAR(50) NULL DEFAULT NULL,
    `SensitivityFlagID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `PlatformDataStructuresToDataAttributesGUID` CHAR(38) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `PlatformDataAttributesID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`PlatformDataStructuresToDataAttributesID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_dataattributes`
    FOREIGN KEY (`PlatformDataAttributesID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_datastructure`
    FOREIGN KEY (`PlatformDataStructuresID`)
    REFERENCES `platform_datastructures` (`PlatformDataStructuresID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_sensitivityflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_platform_datastructurestodataattributes_dataattributes` ON `platform_datastructurestodataattributes` (`PlatformDataAttributesID` ASC) VISIBLE;

CREATE INDEX `FK_platform_datastructurestodataattributes_datastructure` ON `platform_datastructurestodataattributes` (`PlatformDataStructuresID` ASC) VISIBLE;

CREATE INDEX `FK_platform_datastructurestodataattributes_registeredapp` ON `platform_datastructurestodataattributes` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `FK_platform_datastructurestodataattributes_sensitivityflag` ON `platform_datastructurestodataattributes` (`SensitivityFlagID` ASC) VISIBLE;

CREATE INDEX `FK_platform_datastructurestodataattributes_status` ON `platform_datastructurestodataattributes` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_Platform_DataStructuresToDataAttributes` ON `platform_datastructurestodataattributes` (`PlatformDataStructuresToDataAttributesID` ASC, `PlatformDataStructuresToDataAttributesGUID` ASC, `PlatformDataStructuresID` ASC, `CompositeDataStructureName` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `PlatformDataAttributesID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_industrystd_datatypes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_industrystd_datatypes` ;

CREATE TABLE IF NOT EXISTS `refdata_industrystd_datatypes` (
                                                               `DataTypesToIndustryID` INT NOT NULL AUTO_INCREMENT,
                                                               `IndustryStd` VARCHAR(6) NOT NULL,
    `DataTypeName` VARCHAR(10) NULL DEFAULT NULL,
    `DataTypeNameDesc` VARCHAR(75) NULL DEFAULT NULL,
    `DataTypeSubFields` VARCHAR(249) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`DataTypesToIndustryID`),
    CONSTRAINT `FK_refdata_industrystd_datatypes_industrystd`
    FOREIGN KEY (`IndustryStd`)
    REFERENCES `refdata_industrystd` (`IndustryStd`),
    CONSTRAINT `FK_refdata_industrystd_datatypes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IDX_IndustryStd_DataTypes` ON `refdata_industrystd_datatypes` (`DataTypesToIndustryID` ASC, `IndustryStd` ASC, `DataTypeName` ASC, `DataTypeNameDesc` ASC, `DataTypeSubFields` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_industrystd_datatypes_industrystd` ON `refdata_industrystd_datatypes` (`IndustryStd` ASC) VISIBLE;

CREATE INDEX `FK_refdata_industrystd_datatypes_status` ON `refdata_industrystd_datatypes` (`StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_industrystd_fields`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_industrystd_fields` ;

CREATE TABLE IF NOT EXISTS `refdata_industrystd_fields` (
                                                            `FieldsToIndustryID` INT NOT NULL AUTO_INCREMENT,
                                                            `MessageFieldNumber` VARCHAR(14) NULL DEFAULT NULL,
    `MessageFieldName` VARCHAR(154) NULL DEFAULT NULL,
    `FieldLength` VARCHAR(10) NULL DEFAULT NULL,
    `DataType` VARCHAR(7) NULL DEFAULT NULL,
    `MessageSegment` VARCHAR(3) NULL DEFAULT NULL,
    `SegmentFieldOrder` VARCHAR(8) NULL DEFAULT NULL,
    `Vrsn` VARCHAR(7) NULL DEFAULT NULL,
    `IndustryStd` VARCHAR(7) NULL DEFAULT NULL,
    `SensitivityFlagID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`FieldsToIndustryID`),
    CONSTRAINT `FK_refdata_industrystd_fields_industrystd`
    FOREIGN KEY (`IndustryStd`)
    REFERENCES `refdata_industrystd` (`IndustryStd`),
    CONSTRAINT `FK_refdata_industrystd_fields_sensitivtyflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_refdata_industrystd_fields_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `IDX_IndustryStd_Fields` ON `refdata_industrystd_fields` (`FieldsToIndustryID` ASC, `MessageFieldNumber` ASC, `MessageFieldName` ASC, `FieldLength` ASC, `DataType` ASC, `MessageSegment` ASC, `SegmentFieldOrder` ASC, `Vrsn` ASC, `IndustryStd` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_industrystd_fields_industrystd` ON `refdata_industrystd_fields` (`IndustryStd` ASC) VISIBLE;

CREATE INDEX `FK_refdata_industrystd_fields_status` ON `refdata_industrystd_fields` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_industrystd_fields_sensitivtyflag` ON `refdata_industrystd_fields` (`SensitivityFlagID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_industrystd_segments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_industrystd_segments` ;

CREATE TABLE IF NOT EXISTS `refdata_industrystd_segments` (
                                                              `SegmentToIndustryID` INT NOT NULL AUTO_INCREMENT,
                                                              `IndustryStd` VARCHAR(6) NOT NULL,
    `IndustryStdDesc` VARCHAR(30) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `SegmentName` VARCHAR(10) NULL DEFAULT NULL,
    `SegmentNameDesc` VARCHAR(129) NULL DEFAULT NULL,
    PRIMARY KEY (`SegmentToIndustryID`),
    CONSTRAINT `FK_refdata_industrystd_segments_industrystd`
    FOREIGN KEY (`IndustryStd`)
    REFERENCES `refdata_industrystd` (`IndustryStd`),
    CONSTRAINT `FK_refdata_industrystd_segments_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_industrystd_segments_status` ON `refdata_industrystd_segments` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_industrystd_segments_industrystd` ON `refdata_industrystd_segments` (`IndustryStd` ASC) VISIBLE;

CREATE INDEX `IDX_IndustryStd_Segments` ON `refdata_industrystd_segments` (`SegmentToIndustryID` ASC, `IndustryStd` ASC, `IndustryStdDesc` ASC, `CreatedDate` ASC, `StatusID` ASC, `SegmentName` ASC, `SegmentNameDesc` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_platformparams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_platformparams` ;

CREATE TABLE IF NOT EXISTS `refdata_platformparams` (
                                                        `PlatformParamsID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                        `PlatformParamValues` VARCHAR(35) NULL DEFAULT NULL,
    `PlatformParamDesc` VARCHAR(70) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`PlatformParamsID`),
    CONSTRAINT `FK_refdata_platformparams_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_platformparams_status` ON `refdata_platformparams` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_refdata_platformparams` ON `refdata_platformparams` (`PlatformParamsID` ASC, `PlatformParamDesc` ASC, `PlatformParamValues` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `refdata_platformparamstodataattributes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `refdata_platformparamstodataattributes` ;

CREATE TABLE IF NOT EXISTS `refdata_platformparamstodataattributes` (
                                                                        `PlatformParamsToDataAttributeID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                        `PlatformParamsID` SMALLINT NULL DEFAULT NULL,
                                                                        `DataAttributeID` SMALLINT NULL DEFAULT NULL,
                                                                        `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
                                                                        `StatusID` SMALLINT NULL DEFAULT '1',
                                                                        `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PlatformParamsToDataAttributeID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_platformparams`
    FOREIGN KEY (`PlatformParamsID`)
    REFERENCES `refdata_platformparams` (`PlatformParamsID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `impl_application` (`AppGUID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = latin1;

CREATE INDEX `FK_refdata_platformparamstodataattributes_platformparams` ON `refdata_platformparamstodataattributes` (`PlatformParamsID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_platformparamstodataattributes_dataattributes` ON `refdata_platformparamstodataattributes` (`DataAttributeID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_platformparamstodataattributes_status` ON `refdata_platformparamstodataattributes` (`StatusID` ASC) VISIBLE;

CREATE INDEX `FK_refdata_platformparamstodataattributes_registeredapp` ON `refdata_platformparamstodataattributes` (`RegisteredApp` ASC) VISIBLE;

CREATE INDEX `IDX_refdata_platformparamstodataattributes` ON `refdata_platformparamstodataattributes` (`PlatformParamsToDataAttributeID` ASC, `PlatformParamsID` ASC, `DataAttributeID` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `terms_codeset_HL7v2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `terms_codeset_HL7v2` ;

CREATE TABLE IF NOT EXISTS `terms_codeset_HL7v2` (
                                                     `TermCodeSetID` BIGINT NOT NULL AUTO_INCREMENT,
                                                     `CodeSetsID` BIGINT NOT NULL,
                                                     `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
                                                     `StatusID` SMALLINT NULL DEFAULT '1',
                                                     `CodeValue` VARCHAR(20) NULL DEFAULT NULL,
    `CodeDesc` VARCHAR(129) NULL DEFAULT NULL,
    PRIMARY KEY (`TermCodeSetID`),
    CONSTRAINT `FK_termscodesetHL7v2_codeset`
    FOREIGN KEY (`CodeSetsID`)
    REFERENCES `refdata_codeset` (`CodeSetsID`),
    CONSTRAINT `FK_termscodesetHL7v2_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `FK_termscodesetHL7v2_codeset` ON `terms_codeset_HL7v2` (`CodeSetsID` ASC) VISIBLE;

CREATE INDEX `FK_termscodesetHL7v2_status` ON `terms_codeset_HL7v2` (`StatusID` ASC) VISIBLE;

CREATE INDEX `IDX_Terms_CodeSetsHL7v2` ON `terms_codeset_HL7v2` (`TermCodeSetID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CodeValue` ASC, `CodeDesc` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `terms_umls_mrconoso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `terms_umls_mrconoso` ;

CREATE TABLE IF NOT EXISTS `terms_umls_mrconoso` (
    `CUI` CHAR(8) CHARACTER SET 'utf8' NOT NULL,
    `LAT` CHAR(3) CHARACTER SET 'utf8' NOT NULL,
    `TS` CHAR(1) CHARACTER SET 'utf8' NOT NULL,
    `LUI` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
    `STT` VARCHAR(3) CHARACTER SET 'utf8' NOT NULL,
    `SUI` VARCHAR(10) CHARACTER SET 'utf8' NOT NULL,
    `ISPREF` CHAR(1) CHARACTER SET 'utf8' NOT NULL,
    `AUI` VARCHAR(9) CHARACTER SET 'utf8' NOT NULL,
    `SAUI` VARCHAR(50) CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `SCUI` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `SDUI` VARCHAR(100) CHARACTER SET 'utf8' NULL DEFAULT NULL,
    `SAB` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
    `TTY` VARCHAR(20) CHARACTER SET 'utf8' NOT NULL,
    `CODE` VARCHAR(100) CHARACTER SET 'utf8' NOT NULL,
    `STR` VARCHAR(3000) CHARACTER SET 'utf8' NOT NULL,
    `SRL` VARCHAR(25) NOT NULL,
    `SUPPRESS` CHAR(1) CHARACTER SET 'utf8' NOT NULL,
    `CVF` VARCHAR(25) NULL DEFAULT NULL)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `INDX_terms_umls_mrconoso` ON `terms_umls_mrconoso` (`CUI` ASC, `LAT` ASC, `TS` ASC, `LUI` ASC, `STT` ASC, `SUI` ASC, `ISPREF` ASC, `AUI` ASC, `SAUI` ASC, `SCUI` ASC, `SDUI` ASC, `SAB` ASC, `TTY` ASC, `CODE` ASC, `SRL` ASC) VISIBLE;


        DELIMITER $$

DROP TRIGGER IF EXISTS `refdata_vendors_uuid` $$
CREATE
    TRIGGER `refdata_vendors_uuid`
    BEFORE INSERT ON `refdata_vendor`
               FOR EACH ROW
BEGIN
    IF new.VendorGUID IS NULL THEN
        SET new.VendorGUID = UUID();
END IF;
        END$$

DROP TRIGGER IF EXISTS `impl_application_uuid` $$
CREATE
    TRIGGER `impl_application_uuid`
    BEFORE INSERT ON `impl_application`
               FOR EACH ROW
BEGIN
    IF new.AppGUID IS NULL THEN
        SET new.AppGUID = UUID();
END IF;
        END$$

DROP TRIGGER IF EXISTS `impl_legalentities_uuid` $$
CREATE
    TRIGGER `impl_legalentities_uuid`
    BEFORE INSERT ON `impl_legalentities`
               FOR EACH ROW
BEGIN
    IF new.LegalEntityGUID IS NULL THEN
        SET new.LegalEntityGUID = UUID();
END IF;
        END$$


DROP TRIGGER IF EXISTS `impl_organization_uuid` $$
CREATE
    TRIGGER `impl_organization_uuid`
    BEFORE INSERT ON `impl_organization`
               FOR EACH ROW
BEGIN
    IF new.OrganizationGUID IS NULL THEN
        SET new.OrganizationGUID = UUID();
END IF;
        END$$

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
