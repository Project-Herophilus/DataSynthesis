-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `datasynthesis`;
CREATE SCHEMA IF NOT EXISTS `datasynthesis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `datasynthesis` ;

-- -----------------------------------------------------
-- Table `refdata_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_status` (
                                                                `StatusID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                `StatusDescription` VARCHAR(45) NOT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`StatusID`),
    INDEX `IDX_RefData_Status` (`StatusID` ASC, `StatusDescription` ASC, `CreatedDate` ASC, `CreatedUser` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auditing_dataplatform`
-- -----------------------------------------------------
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
    INDEX `FK_platform_dataplatform_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_platform_dataplatform` (`DataPlatformID` ASC, `DataProcessingDate` ASC, `CreatedByUser` ASC, `Organizaton` ASC, `Application` ASC, `StatusID` ASC, `CreatedDate` ASC, `RecCount` ASC, `Component` ASC, `ActionName` ASC, `DurationToRun` ASC, `ActivityDetail` ASC) VISIBLE,
    CONSTRAINT `FK_platform_dataplatform_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `auditing_datarequest`
-- -----------------------------------------------------
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
    INDEX `FK_platform_datarequest_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_platform_datarequest` (`DataRequestID` ASC, `DataRequestDate` ASC, `CreatedByUser` ASC, `Organizaton` ASC, `Application` ASC, `StatusID` ASC, `CreatedDate` ASC, `RecCount` ASC, `RecordDataRequest` ASC) VISIBLE,
    CONSTRAINT `FK_platform_datarequest_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_vendor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_vendor` (
                                                                `VendorID` INT NOT NULL AUTO_INCREMENT,
                                                                `VendorName` VARCHAR(50) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `VendorGUID` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`VendorID`),
    INDEX `FK_refdata_vendors_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_Vendors` (`VendorID` ASC, `VendorName` ASC, `StatusID` ASC, `VendorGUID` ASC, `CreatedDate` ASC, `CreatedUser` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_vendors_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_application` (
    `AppGUID` CHAR(38) NOT NULL,
    `ApplicationCustomCode` VARCHAR(15) NULL DEFAULT NULL,
    `ApplicationDesc` VARCHAR(50) NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `VendorID` INT NULL DEFAULT NULL,
    PRIMARY KEY (`AppGUID`),
    INDEX `FK_refdata_application_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_application_vendors` (`VendorID` ASC) VISIBLE,
    INDEX `IDX_RefData_Application` (`AppGUID` ASC, `ApplicationCustomCode` ASC, `ApplicationDesc` ASC, `CreatedUser` ASC, `CreatedDate` ASC, `StatusID` ASC, `VendorID` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_application_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_refdata_application_vendors`
    FOREIGN KEY (`VendorID`)
    REFERENCES `refdata_vendor` (`VendorID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_ababanking`
-- -----------------------------------------------------
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
    INDEX `FK_dataexisting_ababanking_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_ababanking_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExisting_ABABanking` (`ABABankingID` ASC, `RoutingNumber` ASC, `TelegraphicName` ASC, `CustomerName` ASC, `City` ASC, `State` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_ababanking_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_ababanking_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_timezones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_timezones` (
    `TimeZoneValue` VARCHAR(3) NOT NULL,
    `TimeZoneDesc` VARCHAR(25) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`TimeZoneValue`),
    INDEX `FK_TimeZones_Status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_TimeZones` (`TimeZoneValue` ASC, `TimeZoneDesc` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_TimeZones_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_usstates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_usstates` (
    `StateID` VARCHAR(2) NOT NULL,
    `StateDescription` VARCHAR(65) NULL DEFAULT NULL,
    `Lattitude` VARCHAR(12) NULL DEFAULT NULL,
    `Longitude` VARCHAR(12) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`StateID`),
    INDEX `FK_USStates_Status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_USStates` (`StateID` ASC, `StateDescription` ASC, `Lattitude` ASC, `Longitude` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC) VISIBLE,
    CONSTRAINT `FK_USStates_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `platform_dataattributes`
-- -----------------------------------------------------
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
    INDEX `FK_platformdataattributes_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_platformdataattributes_sensitivtyflag` (`SensitivityFlagID` ASC) VISIBLE,
    INDEX `FK_platform_dataattributes_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_Platform_DataAttributes` (`PlatformDataAttributesID` ASC, `DataAttributeName` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `PlatformDataAttributeGUID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_platform_dataattributes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_platformdataattributes_sensitivtyflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_platformdataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `dataexisting_areacode`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_dataexisting_areacode` (`AreaCodeValue` ASC, `TimeZone` ASC, `StateCode` ASC) VISIBLE,
    INDEX `FK_dataexisting_areacode_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_areacode_USStates` (`StateCode` ASC) VISIBLE,
    INDEX `FK_dataexisting_areacode_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_dataexisting_areacode_timezones` (`TimeZone` ASC) VISIBLE,
    INDEX `IDX_DataExisting_AreaCode` (`AreaCodeValue` ASC, `TimeZone` ASC, `StateCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_areacode_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
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
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_countries` (
                                                                   `CountryID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                   `IDD` VARCHAR(5) NULL DEFAULT NULL,
    `CountryName` VARCHAR(59) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`CountryID`),
    INDEX `FK_Countries_Status` (`StatusID` ASC) VISIBLE,
    INDEX `IX_Countries` (`CountryID` ASC, `IDD` ASC, `CountryName` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_Countries_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_areacodeintl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dataexisting_areacodeintl` (
    `IDDCode` VARCHAR(5) NOT NULL,
    `CountryID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`IDDCode`),
    INDEX `FK_dataexisting_areacodeintl_Countries` (`CountryID` ASC) VISIBLE,
    INDEX `FK_dataexisting_areacodeintl_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_areacodeintl_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExisting_AreaCodeIntl` (`IDDCode` ASC, `CountryID` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_areacodeintl_Countries`
    FOREIGN KEY (`CountryID`)
    REFERENCES `refdata_countries` (`CountryID`),
    CONSTRAINT `FK_dataexisting_areacodeintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_areacodeintl_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_companies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dataexisting_companies` (
                                                                        `CompaniesID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                        `CompanyName` VARCHAR(79) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`CompaniesID`),
    INDEX `FK_dataexisting_companies_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_companies_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExisting_Companies` (`CompaniesID` ASC, `CompanyName` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_companies_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_companies_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_namefirst`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dataexisting_namefirst` (
                                                                        `FirstNameID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                        `FirstName` VARCHAR(39) NULL DEFAULT NULL,
    `Gender` VARCHAR(1) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`FirstNameID`),
    UNIQUE INDEX `IDX_UC_dataexisting_namefirst` (`FirstName` ASC, `Gender` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_dataexisting_namefirst_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_namefirst_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExistng_NameFirst` (`FirstNameID` ASC, `FirstName` ASC, `Gender` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_namefirst_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_namefirst_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_namelast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dataexisting_namelast` (
                                                                       `LastNameID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                       `LastName` VARCHAR(69) NULL DEFAULT NULL,
    `StatusID` SMALLINT NOT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`LastNameID`),
    UNIQUE INDEX `IDX_UC_DataExisting_NameLast` (`LastName` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_dataexisting_namelast_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_namelast_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExisting_NameLast` (`LastNameID` ASC, `LastName` ASC, `StatusID` ASC, `CreatedDate` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_namelast_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_namelast_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_upccodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dataexisting_upccodes` (
                                                                       `UPCCodeID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                       `UPCCodeName` VARCHAR(15) NULL DEFAULT NULL,
    `UPCProductName` VARCHAR(150) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`UPCCodeID`),
    INDEX `FK_dataexisting_upccodes_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_upccodes_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExisting_UPCCodes` (`UPCCodeID` ASC, `UPCCodeName` ASC, `UPCProductName` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_upccodes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_upccodes_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_zipcodeintl`
-- -----------------------------------------------------
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
    INDEX `FK_dataexisting_zipcodeIntl_Countries` (`Country` ASC) VISIBLE,
    INDEX `FK_dataexisting_zipcodeIntl_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_zipcodeintl_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataExisting_ZipcodeIntl` (`ZipCodeIntnlID` ASC, `ZipCode` ASC, `ZipCodeType` ASC, `Country` ASC, `City` ASC, `Lattitude` ASC, `Longitude` ASC, `Location` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_zipcodeIntl_Countries`
    FOREIGN KEY (`Country`)
    REFERENCES `refdata_countries` (`CountryID`),
    CONSTRAINT `FK_dataexisting_zipcodeintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_zipcodeIntl_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dataexisting_zipcodeus`
-- -----------------------------------------------------
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
    INDEX `IDX_dataexisting_zipcodeus` (`ZipCodeID` ASC, `ZipCode` ASC, `ZipCodeType` ASC, `City` ASC, `State` ASC, `Lattitude` ASC, `Longitude` ASC, `Location` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_dataexisting_zipcodeUS_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_dataexisting_zipcodeus_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_dataexisting_zipcodeus_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_dataexisting_zipcodeUS_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_datagentypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_datagentypes` (
                                                                      `DataGenTypeID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                      `DataGenTypeDescription` VARCHAR(65) NULL DEFAULT NULL,
    `Definition` VARCHAR(255) NULL DEFAULT NULL,
    `DataAttributeID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`DataGenTypeID`),
    INDEX `FK_RefDataDataGenTypes_DataAttributes` (`DataAttributeID` ASC) VISIBLE,
    INDEX `FK_RefDataDataGenTypes_Status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_DataGenTypes` (`DataGenTypeID` ASC, `DataGenTypeDescription` ASC, `Definition` ASC, `DataAttributeID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC) VISIBLE,
    CONSTRAINT `FK_RefDataDataGenTypes_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_RefDataDataGenTypes_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_accountnumbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datagenerated_accountnumbers` (
                                                                              `AccountNumbersID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                              `AccountNumberValue` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`AccountNumbersID`),
    UNIQUE INDEX `IDX_UC_datagenerated_accountnumbers` (`AccountNumberValue` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    INDEX `FK_datagenerated_accountnumbers_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_accountnumbers_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_accountnumbers_datagentype` (`DataGenTypeID` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_AccountNumbers` (`AccountNumbersID` ASC, `AccountNumberValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_accountnumbers_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_accountnumbers_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_accountnumbers_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_addresses`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_DataGenerated_Addresses` (`AddressStreet` ASC, `AddressStreet2` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    INDEX `FK_datagenerated_addresses_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_addresses_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_addresses_datagenttype` (`DataGenTypeID` ASC) VISIBLE,
    INDEX `IDX_datagenerated_addresses` (`AddressID` ASC, `AddressStreet` ASC, `AddressStreet2` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_addresses_datagenttype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_addresses_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_addresses_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_bankaccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datagenerated_bankaccount` (
                                                                           `BankAccountsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                           `BankAccountValue` VARCHAR(17) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    `DataGenTypeID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`BankAccountsID`),
    UNIQUE INDEX `IDX_UC_DataGenerated_BankAccounts` (`BankAccountValue` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    INDEX `FK_datagenerated_bankaccount_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_bankaccount_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `datagenerated_bankaccount__datagentype` (`DataGenTypeID` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_BankAccounts` (`BankAccountsID` ASC, `BankAccountValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `datagenerated_bankaccount__datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_bankaccount_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_bankaccount_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_creditcard`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_datagenerated_creditcard` (`CreditCardNumber` ASC, `CreditCardName` ASC,`RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    INDEX `FK_datagenerated_creditcard_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_creditcard_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `datagenerated_creditcard__datagentype` (`DataGenTypeID` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_CreditCard` (`CreditCardID` ASC, `CreditCardNumber` ASC, `CreditCardName` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `datagenerated_creditcard__datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_creditcard_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_creditcard_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_dateofbirth`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_DataGenerated_DateOfBirths` (`DateOfBirth` ASC, `DateOfBirthDate` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_dateofbirth_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_dateofbirth_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_DateOfBirths` (`DateofBirthsID` ASC, `DateOfBirth` ASC, `DateOfBirthDate` ASC, `Age` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_dateofbirth_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_dateofbirth_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_driverslicenses`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_DataGenerated_DriversLicenses` (`DLN` ASC, `StateCode` ASC, `DataGenTypeID` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_driverslicenses_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_driverslicenses_USStates` (`StateCode` ASC) VISIBLE,
    INDEX `FK_datagenerated_driverslicenses_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_DriversLicenses` (`DriversLicensesID` ASC, `CreatedDate` ASC, `DLN` ASC, `StateCode` ASC, `StatusID` ASC, `DataGenTypeID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_driverslicenses_datagentype` (`DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_driverslicenses_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_datagenerated_driverslicenses_USStates`
    FOREIGN KEY (`StateCode`)
    REFERENCES `refdata_usstates` (`StateID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_ein`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datagenerated_ein` (
                                                                   `EINID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                   `EINValue` VARCHAR(10) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`EINID`),
    UNIQUE INDEX `IDX_UC_DataGenerated_EIN` (`EINValue` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_ein_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_ein_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_EIN` (`EINID` ASC, `EINValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_ein_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_ein_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_phonenumber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datagenerated_phonenumber` (
                                                                           `PhoneNumberID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                           `PhoneNumberValue` VARCHAR(8) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PhoneNumberID`),
    UNIQUE INDEX `IDX_UC_DataGeneratedPhoneNumbers` (`PhoneNumberValue` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_phonenumber_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_phonenumbers_Status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_PhoneNumbers` (`PhoneNumberID` ASC, `PhoneNumberValue` ASC, `RegisteredApp` ASC, `CreatedUser` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_phonenumber_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_phonenumbers_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_phonenumbersintl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datagenerated_phonenumbersintl` (
                                                                                `PhoneNumberIntlID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                                `PhoneNumberValue` VARCHAR(12) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CountryId` SMALLINT NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PhoneNumberIntlID`),
    UNIQUE INDEX `IDX_UC_datagenerated_phonenumbersintl` (`PhoneNumberValue` ASC, `CountryId` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_phonenumbersintl_Country` (`CountryId` ASC) VISIBLE,
    INDEX `FK_datagenerated_phonenumbersintl_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_phonenumbersintl_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_PhoneNumbersIntl` (`PhoneNumberIntlID` ASC, `PhoneNumberValue` ASC, `CountryId` ASC, `CreatedDate` ASC, `CreatedUser` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_phonenumbersintl_Country`
    FOREIGN KEY (`CountryId`)
    REFERENCES `refdata_countries` (`CountryID`),
    CONSTRAINT `FK_datagenerated_phonenumbersintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_phonenumbersintl_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_socialsecuritynumber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datagenerated_socialsecuritynumber` (
                                                                                    `SocialSecurityNumberID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                                    `SocialSecurityNumberValue` VARCHAR(11) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `RegisteredApp` CHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`SocialSecurityNumberID`),
    UNIQUE INDEX `IDX_UC_DataGenerated_SocialSecurityNumbers` (`SocialSecurityNumberValue` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_datagenerated_socialsecuritynumber_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_socialsecuritynumber_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_SocialSecurityNumber` (`SocialSecurityNumberID` ASC, `SocialSecurityNumberValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_datagenerated_socialsecuritynumber_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_socialsecuritynumber_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datagenerated_useridentities`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_DataGenerated_UserIdentities` (`UserIdentityValue` ASC, `UserDomain` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    INDEX `FK_datagenerated_useridentities_Status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_datagenerated_useridentities_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_DataGenerated_Identities` (`UserIdentitiesID` ASC, `UserIdentityValue` ASC, `UserDomain` ASC, `CreatedDate` ASC, `StatusID` ASC, `AdditionalAttributes` ASC, `RegisteredApp` ASC, `DataGenTypeID` ASC) VISIBLE,
    INDEX `datagenerated_useridentities_datagentype` (`DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `datagenerated_useridentities_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_datagenerated_useridentities_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_datagenerated_useridentities_Status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datamodel_datatables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datamodel_datatables` (
    `TableName` VARCHAR(64) CHARACTER SET 'utf8' NOT NULL,
    `TableInformation` VARCHAR(249) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`TableName`),
    INDEX `IDX_datamodel_datatables` (`TableName` ASC, `TableInformation` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_address`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_databuilt_address` (`Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_address_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_databuilt_completeaddress` (`CompleteAddressID` ASC, `Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_address_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_address_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_address_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_bankaccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datastructure_bankaccount` (
                                                                           `DataBuiltBankAccountsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                           `BankAccountNumber` VARCHAR(12) NULL DEFAULT NULL,
    `BankAccountName` VARCHAR(75) NULL DEFAULT NULL,
    `BankRoutingID` VARCHAR(9) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltBankAccountsID`),
    UNIQUE INDEX `IDX_UC_databuilt_bankaccount` (`BankAccountNumber` ASC, `BankRoutingID` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `fk_databuilt_bankAccounts_status` (`StatusID` ASC) VISIBLE,
    INDEX `IX_databuilt_bankAccounts` (`DataBuiltBankAccountsID` ASC, `BankAccountName` ASC, `BankAccountNumber` ASC, `BankRoutingID` ASC, `StatusID` ASC, `CreatedDate` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_bankaccount_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_bankaccount_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `fk_databuilt_bankAccounts_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_corporations`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_databuilt_corporations` (`CorporationName` ASC, `Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_corporations_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_databuilt_corporations_resiteredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_databuilt_corporations` (`DataBuiltCorporationID` ASC, `CorporationName` ASC, `Address1` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_corporations_resiteredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_corporations_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_names`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datastructure_names` (
                                                                     `DataBuiltNamesID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                     `CompleteName` VARCHAR(100) NULL DEFAULT NULL,
    `Gender` VARCHAR(1) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltNamesID`),
    INDEX `FK_databuilt_completenames_status` (`StatusID` ASC) VISIBLE,
    INDEX `IX_databuilt_names_databuiltnamesid` (`DataBuiltNamesID` ASC, `CompleteName` ASC, `Gender` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_names_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_completenames_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `FK_databuilt_names_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_persondemographics`
-- -----------------------------------------------------
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
    UNIQUE INDEX `IDX_UC_databuilt_persondemographics` (`DLN` ASC, `DLNState` ASC, `SSN` ASC, `DOBDate` ASC, `DOBValue` ASC, `Age` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_persondemographics_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_databuilt_persondemographics_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_dataabuilt_persondemographics` (`PersonDemographicsID` ASC, `DLN` ASC, `DLNState` ASC, `SSN` ASC, `DOBValue` ASC, `DOBDate` ASC, `Age` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_persondemographics_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_persondemographics_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_phonenumbers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datastructure_phonenumbers` (
                                                                            `DataBuiltPhoneNumbersID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                            `AreaCode` VARCHAR(3) NULL DEFAULT NULL,
    `PhoneNumber` VARCHAR(8) NULL DEFAULT NULL,
    `CompletePhoneNumber` VARCHAR(14) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltPhoneNumbersID`),
    UNIQUE INDEX `IDX_UC_databuilt_phonenumbers` (`AreaCode` ASC, `PhoneNumber` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_phonenumbers_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_databuilt_phonenumbers_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_databuilt_phonenumbers` (`DataBuiltPhoneNumbersID` ASC, `AreaCode` ASC, `PhoneNumber` ASC, `CompletePhoneNumber` ASC, `StatusID` ASC, `CreatedDate` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_phonenumbers_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_phonenumbers_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `IDX_databuilt_phonenumbers_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_phonenumbersintl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datastructure_phonenumbersintl` (
                                                                                `DataBuiltPhoneNumbersIntlID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                                `AreaCode` VARCHAR(3) NULL DEFAULT NULL,
    `PhoneNumber` VARCHAR(8) NULL DEFAULT NULL,
    `CompletePhoneNumber` VARCHAR(14) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DataBuiltPhoneNumbersIntlID`),
    UNIQUE INDEX `IDX_UC_databuilt_phonenumbersintl` (`AreaCode` ASC, `PhoneNumber` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_phonenumbersintl_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_phonenumbersintl_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_databuilt_phonenumbersintl` (`DataBuiltPhoneNumbersIntlID` ASC, `AreaCode` ASC, `PhoneNumber` ASC, `CompletePhoneNumber` ASC, `StatusID` ASC, `CreatedDate` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_phonenumbersintl_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_phonenumbersintl_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`),
    CONSTRAINT `IDX_databuilt_phonenumbersintl_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `datastructure_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `datastructure_products` (
                                                                        `DatabuiltProductsID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                        `ProductID` VARCHAR(20) NULL DEFAULT NULL,
    `ProductName` VARCHAR(99) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`DatabuiltProductsID`),
    UNIQUE INDEX `IDX_UC_databuilt_products` (`ProductID` ASC, `ProductName` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_products_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_databuilt_products` (`DatabuiltProductsID` ASC, `ProductID` ASC, `ProductName` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    INDEX `FK_databuilt_products_regsiteredapp` (`RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_databuilt_products_regsiteredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_databuilt_products_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_sensitivityflag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_sensitivityflag` (
                                                                         `SensitiveFlagID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                         `SensitiveFlagDesc` VARCHAR(30) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`SensitiveFlagID`),
    INDEX `FK_refdata_sensitivityflag_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_SensitivityFlag` (`SensitiveFlagID` ASC, `SensitiveFlagDesc` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_sensitivityflag_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_appsettings_dataattributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platform_appsettings_dataattributes` (
                                                                                     `AppSettingsDataAttributeID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                                     `PlatformDataAttributeID` SMALLINT NULL DEFAULT NULL,
                                                                                     `ServiceClassName` VARCHAR(75) NULL DEFAULT NULL,
    `CodeBaseLang` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `MaxTableTransactionCount` BIGINT NULL DEFAULT NULL,
    `CurrentTableTransactionCount` BIGINT NULL DEFAULT NULL,
    `CurrentTableTransactionCounRunDateTime` DATETIME NULL DEFAULT NULL,
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`AppSettingsDataAttributeID`),
    INDEX `FK_platform_appsettings_dataattributes_dataattributes` (`PlatformDataAttributeID` ASC) VISIBLE,
    INDEX `FK_platform_appsettings_dataattributes_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_refdata_appsettings_dataattributes_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_PlatformData_AppSettings_DataAttributes` (`AppSettingsDataAttributeID` ASC, `PlatformDataAttributeID` ASC, `ServiceClassName` ASC, `CreatedDate` ASC, `StatusID` ASC, `MaxTableTransactionCount` ASC, `CurrentTableTransactionCount` ASC, `CurrentTableTransactionCounRunDateTime` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_platform_appsettings_dataattributes_dataattributes`
    FOREIGN KEY (`PlatformDataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_refdata_appsettings_dataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_appsettings_general`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platform_appsettings_general` (
                                                                              `AppSettingsID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                              `AppSettingName` VARCHAR(50) NULL DEFAULT NULL,
    `AppSettingValue` VARCHAR(199) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    `DefaultDataGenerationApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`AppSettingsID`),
    INDEX `FK_platform_appsettings_general_datagenapp` (`DefaultDataGenerationApp` ASC) VISIBLE,
    INDEX `FK_platform_appsettings_general_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_refdata_appsettings_general_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_PlatformData_AppSettings_General` (`AppSettingsID` ASC, `AppSettingName` ASC, `AppSettingValue` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC, `DefaultDataGenerationApp` ASC) VISIBLE,
    CONSTRAINT `FK_platform_appsettings_general_datagenapp`
    FOREIGN KEY (`DefaultDataGenerationApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_platform_appsettings_general_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_refdata_appsettings_general_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_config_datagen`
-- -----------------------------------------------------
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
    INDEX `FK_platform_datagenconfig_dataattributes` (`DataAttributeID` ASC) VISIBLE,
    INDEX `FK_platform_datagenconfig_status` (`StatusID` ASC) VISIBLE,
    INDEX `platform_config_datagen_registeredapp` (`ApplicationID` ASC) VISIBLE,
    INDEX `IDX_PlatformConfigDataGen` (`DataGenConfigID` ASC, `DataAttributeID` ASC, `DataTypeGenConfigName` ASC, `RunQuantity` ASC, `MinuteInterval` ASC, `CreatedDate` ASC, `CreatedUser` ASC, `StatusID` ASC, `ApplicationID` ASC) VISIBLE,
    INDEX `FK_platform_config_datagen_datagentype` (`DataGenTypeID` ASC) VISIBLE,
    CONSTRAINT `FK_platform_config_datagen_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_config_datagen_datagentype`
    FOREIGN KEY (`DataGenTypeID`)
    REFERENCES `refdata_datagentypes` (`DataGenTypeID`),
    CONSTRAINT `FK_platform_config_datagen_registeredapp`
    FOREIGN KEY (`ApplicationID`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_platform_config_datagen_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_datastructures`
-- -----------------------------------------------------
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
    INDEX `FK_platform_datastructures_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_platform_datastructures__registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_platform_datastructures_sensitivityflag` (`SensitivityFlagID` ASC) VISIBLE,
    INDEX `IDX_Platform_DataStructures` (`PlatformDataStructuresID` ASC, `DataStructureName` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `PlatformDataStructuresGUID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_platform_datastructures__registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_platform_datastructures_sensitivityflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_platform_datastructures_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_datastructurestodataattributes`
-- -----------------------------------------------------
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
    INDEX `FK_platform_datastructurestodataattributes_dataattributes` (`PlatformDataAttributesID` ASC) VISIBLE,
    INDEX `FK_platform_datastructurestodataattributes_datastructure` (`PlatformDataStructuresID` ASC) VISIBLE,
    INDEX `FK_platform_datastructurestodataattributes_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `FK_platform_datastructurestodataattributes_sensitivityflag` (`SensitivityFlagID` ASC) VISIBLE,
    INDEX `FK_platform_datastructurestodataattributes_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_Platform_DataStructuresToDataAttributes` (`PlatformDataStructuresToDataAttributesID` ASC, `PlatformDataStructuresToDataAttributesGUID` ASC, `PlatformDataStructuresID` ASC, `CompositeDataStructureName` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `RegisteredApp` ASC, `PlatformDataAttributesID` ASC) VISIBLE,
    CONSTRAINT `FK_platform_datastructurestodataattributes_dataattributes`
    FOREIGN KEY (`PlatformDataAttributesID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_datastructure`
    FOREIGN KEY (`PlatformDataStructuresID`)
    REFERENCES `platform_datastructures` (`PlatformDataStructuresID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_sensitivityflag`
    FOREIGN KEY (`SensitivityFlagID`)
    REFERENCES `refdata_sensitivityflag` (`SensitiveFlagID`),
    CONSTRAINT `FK_platform_datastructurestodataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_rulesets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platform_rulesets` (
                                                                   `RuleID` BIGINT NOT NULL AUTO_INCREMENT,
                                                                   `RuleName` VARCHAR(65) NULL DEFAULT NULL,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `ExpirationDate` TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (`RuleID`),
    INDEX `FK_platform_rulesets_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_Platform_RuleSets` (`RuleID` ASC, `RuleName` ASC, `CreatedUser` ASC, `CreatedDate` ASC, `ExpirationDate` ASC, `StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_platform_rulesets_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_operationtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_operationtype` (
    `OperationTypeID` VARCHAR(7) NOT NULL,
    `OperationTypeName` VARCHAR(60) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`OperationTypeID`),
    INDEX `FK_refdata_operationtype_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_OperationType` (`OperationTypeID` ASC, `OperationTypeName` ASC, `StatusID` ASC, `CreatedDate` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_operationtype_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `platform_rulesetsdefinitions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `platform_rulesetsdefinitions` (
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
    INDEX `FK_platform_rulesetsdefinitions_operationtype` (`OperationTypeID` ASC) VISIBLE,
    INDEX `FK_platform_rulesetsdefinitions_registeredapp` (`ApplicationID` ASC) VISIBLE,
    INDEX `FK_platform_rulesetsdefinitions_ruleset` (`RuleSetID` ASC) VISIBLE,
    INDEX `FK_platform_rulesetsdefinitions_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_platform_rulesetsdefinitions_dataattributes` (`DataAttributeID` ASC) VISIBLE,
    INDEX `IDX_Platform_RulesetsDefinitions` (`RulesetDefinitionsID` ASC, `RuleSetID` ASC, `RulesetDefinitionName` ASC, `StepOrderID` ASC, `OperationTypeID` ASC, `RulesetDefValue` ASC, `CreatedDate` ASC, `EffectiveDate` ASC, `StatusID` ASC, `ApplicationID` ASC, `TermDate` ASC, `DataAttributeID` ASC) VISIBLE,
    CONSTRAINT `FK_platform_rulesetsdefinitions_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_operationtype`
    FOREIGN KEY (`OperationTypeID`)
    REFERENCES `refdata_operationtype` (`OperationTypeID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_registeredapp`
    FOREIGN KEY (`ApplicationID`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_ruleset`
    FOREIGN KEY (`RuleSetID`)
    REFERENCES `platform_rulesets` (`RuleID`),
    CONSTRAINT `FK_platform_rulesetsdefinitions_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_industrystd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_industrystd` (
    `IndustryStd` VARCHAR(6) NOT NULL,
    `IndustryStdDesc` VARCHAR(30) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`IndustryStd`),
    INDEX `FK_refdata_industrystd_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_IndustryStd` (`IndustryStd` ASC, `IndustryStdDesc` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_industrystd_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_codeset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_codeset` (
     `CodeSetsID` BIGINT NOT NULL AUTO_INCREMENT,
     `CodeSetName` VARCHAR(50) NULL DEFAULT NULL,
    `IndustryStd` VARCHAR(6) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    `CodesetGUID` CHAR(38) NULL DEFAULT NULL,
    `FieldMapping` VARCHAR(20) NULL DEFAULT NULL,
    `SensitivityFlagID` SMALLINT NULL DEFAULT NULL,
    PRIMARY KEY (`CodeSetsID`),
    INDEX `FK_refdata_codesets_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_codeset_industrystd` (`IndustryStd` ASC) VISIBLE,
    INDEX `FK_refdata_codeset_sensitivityflag` (`SensitivityFlagID` ASC) VISIBLE,
    INDEX `IDX_RefData_CodeSets` (`CodeSetsID` ASC, `CodeSetName` ASC, `IndustryStd` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `CodesetGUID` ASC, `FieldMapping` ASC, `SensitivityFlagID` ASC) VISIBLE,
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
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_codesettomsgtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_codesettomsgtype` (
     `CodeSetToMsgTypeID` BIGINT NOT NULL AUTO_INCREMENT,
     `CodeSetsID` BIGINT NULL DEFAULT NULL,
     `MsgType` VARCHAR(10) NULL DEFAULT NULL,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `CreatedUser` VARCHAR(20) NULL DEFAULT NULL,
    PRIMARY KEY (`CodeSetToMsgTypeID`),
    INDEX `FK_refdata_codesettomsgtype_codesets` (`CodeSetsID` ASC) VISIBLE,
    INDEX `FK_refdata_codesettomsgtype_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_CodeSetsToMsgType` (`CodeSetToMsgTypeID` ASC, `CodeSetsID` ASC, `MsgType` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_codesettomsgtype_codesets`
    FOREIGN KEY (`CodeSetsID`)
    REFERENCES `refdata_codeset` (`CodeSetsID`),
    CONSTRAINT `FK_refdata_codesettomsgtype_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_industrystd_datatypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_industrystd_datatypes` (
     `DataTypesToIndustryID` INT NOT NULL AUTO_INCREMENT,
     `IndustryStd` VARCHAR(6) NOT NULL,
    `DataTypeName` VARCHAR(10) NULL DEFAULT NULL,
    `DataTypeNameDesc` VARCHAR(75) NULL DEFAULT NULL,
    `DataTypeSubFields` VARCHAR(249) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`DataTypesToIndustryID`),
    INDEX `IDX_IndustryStd_DataTypes` (`DataTypesToIndustryID` ASC, `IndustryStd` ASC, `DataTypeName` ASC, `DataTypeNameDesc` ASC, `DataTypeSubFields` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_industrystd_datatypes_industrystd` (`IndustryStd` ASC) VISIBLE,
    INDEX `FK_refdata_industrystd_datatypes_status` (`StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_industrystd_datatypes_industrystd`
    FOREIGN KEY (`IndustryStd`)
    REFERENCES `refdata_industrystd` (`IndustryStd`),
    CONSTRAINT `FK_refdata_industrystd_datatypes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_industrystd_fields`
-- -----------------------------------------------------
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
    INDEX `IDX_IndustryStd_Fields` (`FieldsToIndustryID` ASC, `MessageFieldNumber` ASC, `MessageFieldName` ASC, `FieldLength` ASC, `DataType` ASC, `MessageSegment` ASC, `SegmentFieldOrder` ASC, `Vrsn` ASC, `IndustryStd` ASC, `SensitivityFlagID` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_industrystd_fields_industrystd` (`IndustryStd` ASC) VISIBLE,
    INDEX `FK_refdata_industrystd_fields_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_industrystd_fields_sensitivtyflag` (`SensitivityFlagID` ASC) VISIBLE,
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
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_industrystd_segments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_industrystd_segments` (
                                                                              `SegmentToIndustryID` INT NOT NULL AUTO_INCREMENT,
                                                                              `IndustryStd` VARCHAR(6) NOT NULL,
    `IndustryStdDesc` VARCHAR(30) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `SegmentName` VARCHAR(10) NULL DEFAULT NULL,
    `SegmentNameDesc` VARCHAR(129) NULL DEFAULT NULL,
    PRIMARY KEY (`SegmentToIndustryID`),
    INDEX `FK_refdata_industrystd_segments_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_industrystd_segments_industrystd` (`IndustryStd` ASC) VISIBLE,
    INDEX `IDX_IndustryStd_Segments` (`SegmentToIndustryID` ASC, `IndustryStd` ASC, `IndustryStdDesc` ASC, `CreatedDate` ASC, `StatusID` ASC, `SegmentName` ASC, `SegmentNameDesc` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_industrystd_segments_industrystd`
    FOREIGN KEY (`IndustryStd`)
    REFERENCES `refdata_industrystd` (`IndustryStd`),
    CONSTRAINT `FK_refdata_industrystd_segments_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_legalentity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_legalentity` (
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
    INDEX `FK_refdata_location_states` (`StateID` ASC) VISIBLE,
    INDEX `FK_refdata_location_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_RefData_LegalEntity2` (`LegalEntityGUID` ASC, `LocationName` ASC, `Address` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedUser` ASC, `StatusID` ASC, `CreatedDate` ASC, `LocationURL` ASC, `LocationPhone` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_location_states`
    FOREIGN KEY (`StateID`)
    REFERENCES `refdata_usstates` (`StateID`),
    CONSTRAINT `FK_refdata_location_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_organization` (
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
    INDEX `FK_refdata_organization_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_organization_states` (`StateID` ASC) VISIBLE,
    INDEX `FK_refdata_organization_legalentity` (`LegalEntityGUID` ASC) VISIBLE,
    INDEX `IDX_RefData_Organization` (`OrganizationGUID` ASC, `OrganizationName` ASC, `Address` ASC, `City` ASC, `StateID` ASC, `ZipCode` ASC, `CreatedDate` ASC, `StatusID` ASC, `CreatedUser` ASC, `OrganizationInternalCode` ASC, `OrganizationInternalID` ASC, `LegalEntityGUID` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_organization_legalentity`
    FOREIGN KEY (`LegalEntityGUID`)
    REFERENCES `refdata_legalentity` (`LegalEntityGUID`),
    CONSTRAINT `FK_refdata_organization_states`
    FOREIGN KEY (`StateID`)
    REFERENCES `refdata_usstates` (`StateID`),
    CONSTRAINT `FK_refdata_organization_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_platformparams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_platformparams` (
                                                                        `PlatformParamsID` SMALLINT NOT NULL AUTO_INCREMENT,
                                                                        `PlatformParamValues` VARCHAR(35) NULL DEFAULT NULL,
    `PlatformParamDesc` VARCHAR(70) NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    PRIMARY KEY (`PlatformParamsID`),
    INDEX `FK_refdata_platformparams_status` (`StatusID` ASC) VISIBLE,
    INDEX `IDX_refdata_platformparams` (`PlatformParamsID` ASC, `PlatformParamDesc` ASC, `PlatformParamValues` ASC, `CreatedDate` ASC, `StatusID` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_platformparams_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refdata_platformparamstodataattributes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refdata_platformparamstodataattributes` (
    `PlatformParamsToDataAttributeID` BIGINT NOT NULL AUTO_INCREMENT,
    `PlatformParamsID` SMALLINT NULL DEFAULT NULL,
    `DataAttributeID` SMALLINT NULL DEFAULT NULL,
    `CreatedDate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
    `StatusID` SMALLINT NULL DEFAULT '1',
    `RegisteredApp` VARCHAR(38) NULL DEFAULT NULL,
    PRIMARY KEY (`PlatformParamsToDataAttributeID`),
    INDEX `FK_refdata_platformparamstodataattributes_platformparams` (`PlatformParamsID` ASC) VISIBLE,
    INDEX `FK_refdata_platformparamstodataattributes_dataattributes` (`DataAttributeID` ASC) VISIBLE,
    INDEX `FK_refdata_platformparamstodataattributes_status` (`StatusID` ASC) VISIBLE,
    INDEX `FK_refdata_platformparamstodataattributes_registeredapp` (`RegisteredApp` ASC) VISIBLE,
    INDEX `IDX_refdata_platformparamstodataattributes` (`PlatformParamsToDataAttributeID` ASC, `PlatformParamsID` ASC, `DataAttributeID` ASC, `CreatedDate` ASC, `StatusID` ASC, `RegisteredApp` ASC) VISIBLE,
    CONSTRAINT `FK_refdata_platformparamstodataattributes_dataattributes`
    FOREIGN KEY (`DataAttributeID`)
    REFERENCES `platform_dataattributes` (`PlatformDataAttributesID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_platformparams`
    FOREIGN KEY (`PlatformParamsID`)
    REFERENCES `refdata_platformparams` (`PlatformParamsID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_registeredapp`
    FOREIGN KEY (`RegisteredApp`)
    REFERENCES `refdata_application` (`AppGUID`),
    CONSTRAINT `FK_refdata_platformparamstodataattributes_status`
    FOREIGN KEY (`StatusID`)
    REFERENCES `refdata_status` (`StatusID`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

-- datasynthesis.refdata_terminologystd definition
CREATE TABLE IF NOT EXISTS `refdata_terminologystd` (
    `TerminologyStdID` smallint NOT NULL AUTO_INCREMENT,
    `TerminologyStd` varchar(12) NOT NULL,
    `TerminologyStdVersion` varchar(10) NOT NULL,
    `TerminologyStdDesc` varchar(30) DEFAULT NULL,
    `CreatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
    `StatusID` smallint DEFAULT '1',
    PRIMARY KEY (`TerminologyStdID`),
    KEY `FK_TerminologyStd_status` (`StatusID`),
    KEY `IDX_Refdata_TerminologyStd` (`TerminologyStdID`,`TerminologyStd`,`TerminologyStdVersion`,`TerminologyStdDesc`,`CreatedDate`,`StatusID`) USING BTREE,
    CONSTRAINT `FK_TerminologyStd_status` FOREIGN KEY (`StatusID`) REFERENCES `refdata_status` (`StatusID`)
    )
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS terms_codesetstoapplication
(
    CodeSetToApplicationID bigint auto_increment primary key,
    CodeSetsID bigint not null,
    CreatedDate datetime default CURRENT_TIMESTAMP null,
    StatusID smallint default 1 null,
    OrganizationID varchar(38) null,
    ApplicationID varchar(38) null,
    CodeValue varchar(20) null,
    CodeDesc varchar(129) null,
    FormalName varchar(45) null,
    Address varchar(45) null,
    CityStateZip varchar(99) null,
    PhoneNumber varchar(20) null,
    OtherField1 varchar(49) null,
    OtherField2 varchar(49) null,
    TermLow varchar(25) null,
    TermHigh varchar(25) null,
    constraint FK_terms_codesetstoapplication_Application
        foreign key (ApplicationID) references refdata_application (AppGUID),
    constraint FK_terms_codesetstoapplication_Org
        foreign key (OrganizationID) references refdata_organization (OrganizationGUID),
    constraint FK_terms_codesetstoapplication_codeset
        foreign key (CodeSetsID) references refdata_codeset (CodeSetsID),
    constraint FK_terms_codesetstoapplication_status
        foreign key (StatusID) references refdata_status (StatusID)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

create index IDX_Terms_CodeSetsToApplication
    on terms_codesetstoapplication (CodeSetToApplicationID, CodeSetsID, CodeValue, CodeDesc, CreatedDate, OrganizationID, ApplicationID, StatusID, FormalName, Address, CityStateZip, PhoneNumber, OtherField1, OtherField2, TermLow, TermHigh);

create table terms_codesetscrossmaps
(
    CodeSetCrossMapID bigint auto_increment
        primary key,
    CodeSetsID bigint not null,
    CodeSetToApplicationID bigint null,
    TerminologyStd smallint null,
    SpecificDetails varchar(99) null,
    CreatedDate datetime default CURRENT_TIMESTAMP null,
    StatusID smallint default 1 null,
    CreatedUser varchar(20) null,
    CodeValue varchar(20) null,
    CodeDesc varchar(129) null,
    constraint FK_terms_codesetscrossmap_codesettoapp
        foreign key (CodeSetToApplicationID) references terms_codesetstoapplication (CodeSetToApplicationID),
    constraint FK_termscodesetscrossmap_codeset
        foreign key (CodeSetsID) references refdata_codeset (CodeSetsID),
    constraint FK_termscodesetscrossmap_status
        foreign key (StatusID) references refdata_status (StatusID),
    constraint FK_termscodesetscrossmaps_termstd
        foreign key (TerminologyStd) references refdata_terminologystd (TerminologyStdID)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;

create index IDX_Terms_CodeSetsCrossmap
    on terms_codesetscrossmaps (CodeSetCrossMapID, CodeSetsID, TerminologyStd, SpecificDetails,
                                CreatedDate, CreatedUser, StatusID, CodeValue, CodeDesc);

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

DROP TRIGGER IF EXISTS `refdata_application_uuid` $$
CREATE
    TRIGGER `refdata_application_uuid`
    BEFORE INSERT ON `refdata_application`
               FOR EACH ROW
BEGIN
    IF new.AppGUID IS NULL THEN
        SET new.AppGUID = UUID();
END IF;
        END$$

DROP TRIGGER IF EXISTS `refdata_legalentity_uuid` $$
CREATE
    TRIGGER `refdata_legalentity_uuid`
    BEFORE INSERT ON `refdata_legalentity`
               FOR EACH ROW
BEGIN
    IF new.LegalEntityGUID IS NULL THEN
        SET new.LegalEntityGUID = UUID();
END IF;
        END$$


DROP TRIGGER IF EXISTS `refdata_organization_uuid` $$
CREATE
    TRIGGER `refdata_organization_uuid`
    BEFORE INSERT ON `refdata_organization`
               FOR EACH ROW
BEGIN
    IF new.OrganizationGUID IS NULL THEN
        SET new.OrganizationGUID = UUID();
END IF;
        END$$

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
