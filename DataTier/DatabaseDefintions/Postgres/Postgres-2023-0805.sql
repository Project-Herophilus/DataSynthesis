-- Create Sequences First
-- Need to create for all serial datatypes
create sequence dataexisting_ababanking_seq;
create sequence dataexisting_areacode_seq;
create sequence dataexisting_companies_seq;
create sequence dataexisting_namefirst_seq;
create sequence dataexisting_namelast_seq;
create sequence dataexisting_profession_seq;
create sequence dataexisting_upccodes_seq;
create sequence dataexisting_zipcodeintl_seq;
create sequence dataexisting_zipcodeus_seq;
create sequence datagenerated_accountnumbers_seq;
create sequence datagenerated_addresses_seq;
create sequence datagenerated_bankaccount_seq;
create sequence datagenerated_creditcard_seq;
create sequence datagenerated_custom_seq;
create sequence datagenerated_dateofbirth_seq;
create sequence datagenerated_devices_seq;
create sequence datagenerated_driverslicenses_seq;
create sequence datagenerated_ein_seq;
create sequence datagenerated_phonenumber_seq;
create sequence datagenerated_phonenumberintl_seq;
create sequence datagenerated_regex_seq;
create sequence datagenerated_serialnumbers_seq;
create sequence datagenerated_socialsecuritynumber_seq;
create sequence datagenerated_useridentities_seq;
create sequence datamodel_apis_seq;
create sequence datastructure_coreid_seq;
create sequence impl_codesets_seq;
create sequence impl_codesetscrossmaps_codesetcrossmapid_seq;
create sequence impl_professiontypes_seq;
create sequence impl_regextypes_seq;
create sequence impl_rulesets_seq;
create sequence platform_appsettings_general_seq;
create sequence platform_config_datagen_datagenconfigid_seq;
create sequence platform_dataattributes_seq;
create sequence platform_datastructures_platformdatastructuresid_seq;
create sequence platform_datastructurestodata_platformdatastructurestodataa_seq;
create sequence platform_industrystds_metadata_seq;
create sequence refdata_codeset_seq;
create sequence refdata_countries_seq;
create sequence refdata_datagentypes_seq;
create sequence refdata_devicetypes_seq;
create sequence refdata_eventtypes_seq;
create sequence refdata_industries_seq;
create sequence refdata_industriestobusiness_seq;
create sequence refdata_platformparams_seq;
create sequence refdata_platformparamstodataa_platformparamstodataattribute_seq;
create sequence refdata_sensitivityflag_seq;
create sequence refdata_status_seq;
create sequence refdata_terminologystd_seq;
create sequence refdata_vendor_seq;
create sequence terms_codeset_industrystd_seq;

-- Create Tables
CREATE TABLE dataexisting_ababanking (
                                         ababankingid integer DEFAULT nextval('dataexisting_ababanking_seq'::regclass)  NOT NULL,
                                         routingnumber varchar(9) DEFAULT 'NULL'::character varying,
                                         telegraphicname varchar(20) DEFAULT 'NULL'::character varying,
                                         customername varchar(36) DEFAULT 'NULL'::character varying,
                                         city varchar(20) DEFAULT 'NULL'::character varying,
                                         statecode varchar(2) DEFAULT 'NULL'::character varying,
                                         zipcode varchar(5) DEFAULT 'NULL'::character varying,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                         PRIMARY KEY (ababankingid)
);

CREATE TABLE dataexisting_areacode (
                                       areacodeid integer DEFAULT nextval('dataexisting_areacode_seq'::regclass) NOT NULL,
                                       areacodevalue varchar(3) NOT NULL,
                                       timezone varchar(3) DEFAULT 'NULL'::character varying,
                                       statecode varchar(2) DEFAULT 'NULL'::character varying,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       createduser varchar(20) DEFAULT 'NULL'::character varying,
                                       registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                       PRIMARY KEY (areacodeid)
);

CREATE TABLE dataexisting_areacodeintl (
                                           iddcode varchar(5) NOT NULL,
                                           countryid integer,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           PRIMARY KEY (iddcode)
);

CREATE TABLE dataexisting_companies (
                                        companiesid integer DEFAULT nextval('dataexisting_companies_seq'::regclass) NOT NULL,
                                        companyname varchar(79) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        createduser varchar(20) DEFAULT 'NULL'::character varying,
                                        registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                        PRIMARY KEY (companiesid)
);

CREATE TABLE dataexisting_namefirst (
                                        firstnameid integer DEFAULT nextval('dataexisting_namefirst_seq'::regclass) NOT NULL,
                                        firstname varchar(39) DEFAULT 'NULL'::character varying,
                                        gender varchar(1) DEFAULT 'NULL'::character varying,
                                        statusid integer DEFAULT 1,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        createduser varchar(20) DEFAULT 'NULL'::character varying,
                                        registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                        PRIMARY KEY (firstnameid)
);

CREATE TABLE dataexisting_namelast (
                                       lastnameid integer DEFAULT nextval('dataexisting_namelast_seq'::regclass) NOT NULL,
                                       lastname varchar(69) DEFAULT 'NULL'::character varying,
                                       statusid integer DEFAULT 1 NOT NULL,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       createduser varchar(20) DEFAULT 'NULL'::character varying,
                                       registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                       PRIMARY KEY (lastnameid)
);

CREATE TABLE dataexisting_profession (
                                         professionid integer DEFAULT nextval('dataexisting_profession_seq'::regclass) NOT NULL,
                                         professionname varchar(149) DEFAULT 'NULL'::character varying,
                                         statusid integer DEFAULT 1,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         registeredapp char(38) DEFAULT '16a17a48-d09b-11ea-9579-bba61161b25a'::bpchar,
                                         PRIMARY KEY (professionid)
);

CREATE TABLE dataexisting_upccodes (
                                       upccodeid integer DEFAULT nextval('dataexisting_upccodes_seq'::regclass) NOT NULL,
                                       upccodename varchar(15) DEFAULT 'NULL'::character varying,
                                       upcproductname varchar(150) DEFAULT 'NULL'::character varying,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                       PRIMARY KEY (upccodeid)
);

CREATE TABLE dataexisting_zipcodeintl (
                                          zipcodeintnlid integer DEFAULT nextval('dataexisting_zipcodeintl_seq'::regclass) NOT NULL,
                                          zipcode char(10) NOT NULL,
                                          zipcodetype varchar(15) DEFAULT 'NULL'::character varying,
                                          city varchar(75) DEFAULT 'NULL'::character varying,
                                          country integer,
                                          lattitude varchar(10) DEFAULT 'NULL'::character varying,
                                          longitude varchar(10) DEFAULT 'NULL'::character varying,
                                          "Location" varchar(99) DEFAULT 'NULL'::character varying,
                                          createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                          statusid integer DEFAULT 1,
                                          createduser varchar(20) DEFAULT 'NULL'::character varying,
                                          registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                          PRIMARY KEY (zipcodeintnlid)
);

CREATE TABLE dataexisting_zipcodeus (
                                        zipcodeid integer DEFAULT nextval('dataexisting_zipcodeus_seq'::regclass) NOT NULL,
                                        zipcode char(5) NOT NULL,
                                        zipcodetype varchar(15) DEFAULT 'NULL'::character varying,
                                        city varchar(75) DEFAULT 'NULL'::character varying,
                                        statecode varchar(2) DEFAULT 'NULL'::character varying,
                                        lattitude varchar(10) DEFAULT 'NULL'::character varying,
                                        longitude varchar(10) DEFAULT 'NULL'::character varying,
                                        lctn varchar(99) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        createduser varchar(20) DEFAULT 'NULL'::character varying,
                                        registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                        PRIMARY KEY (zipcodeid)
);

CREATE TABLE datagenerated_accountnumbers (
                                              accountnumbersid integer DEFAULT nextval('datagenerated_accountnumbers_seq'::regclass) NOT NULL,
                                              accountnumbervalue varchar(20) DEFAULT 'NULL'::character varying,
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              createduser varchar(20) DEFAULT 'NULL'::character varying,
                                              statusid integer DEFAULT 1,
                                              registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                              datagentypeid integer,
                                              PRIMARY KEY (accountnumbersid)
);

CREATE TABLE datagenerated_addresses (
                                         addressid integer DEFAULT nextval('datagenerated_addresses_seq'::regclass) NOT NULL,
                                         addressstreet varchar(99) DEFAULT 'NULL'::character varying,
                                         addressstreet2 varchar(59) DEFAULT 'NULL'::character varying,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                         datagentypeid integer,
                                         PRIMARY KEY (addressid)
);

CREATE TABLE datagenerated_bankaccount (
                                           bankaccountsid integer DEFAULT nextval('datagenerated_bankaccount_seq'::regclass) NOT NULL,
                                           bankaccountvalue varchar(17) DEFAULT 'NULL'::character varying,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser varchar(20) DEFAULT 'NULL'::character varying,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           datagentypeid integer,
                                           PRIMARY KEY (bankaccountsid)
);

CREATE TABLE datagenerated_creditcard (
                                          creditcardid integer DEFAULT nextval('datagenerated_creditcard_seq'::regclass) NOT NULL,
                                          creditcardnumber varchar(20) DEFAULT 'NULL'::character varying,
                                          creditcardname varchar(20) DEFAULT 'NULL'::character varying,
                                          createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                          statusid integer DEFAULT 1,
                                          createduser varchar(20) DEFAULT 'NULL'::character varying,
                                          registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                          datagentypeid integer,
                                          PRIMARY KEY (creditcardid)
);

CREATE TABLE datagenerated_custom (
                                      datagencustomdid integer DEFAULT nextval('datagenerated_custom_seq'::regclass) NOT NULL,
                                      customidentifier varchar(40) DEFAULT 'NULL'::character varying,
                                      customidentifierdesc varchar(29) DEFAULT 'NULL'::character varying,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      createduser varchar(20) DEFAULT 'NULL'::character varying,
                                      registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                      datagentypeid integer,
                                      PRIMARY KEY (datagencustomdid)
);

CREATE TABLE datagenerated_dateofbirth (
                                           dateofbirthsid integer DEFAULT nextval('datagenerated_dateofbirth_seq'::regclass) NOT NULL,
                                           dateofbirth varchar(12) DEFAULT 'NULL'::character varying,
                                           dateofbirthdate date,
                                           age integer,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser varchar(20) DEFAULT 'NULL'::character varying,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           PRIMARY KEY (dateofbirthsid)
);

CREATE TABLE datagenerated_devices (
                                       devicesid integer DEFAULT nextval('datagenerated_devices_seq'::regclass) NOT NULL,
                                       devicename varchar(40),
                                       devicetypeid integer,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       application char(38) DEFAULT 'NULL'::character varying,
                                       PRIMARY KEY (devicesid)
);

CREATE TABLE datagenerated_driverslicenses (
                                               driverslicensesid integer DEFAULT nextval('datagenerated_driverslicenses_seq'::regclass) NOT NULL,
                                               dln varchar(25) DEFAULT 'NULL'::character varying,
                                               statecode varchar(2) DEFAULT 'NULL'::character varying,
                                               createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                               statusid integer DEFAULT 1,
                                               datagentypeid integer,
                                               createduser varchar(20) DEFAULT 'NULL'::character varying,
                                               registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                               PRIMARY KEY (driverslicensesid)
);

CREATE TABLE datagenerated_ein (
                                   einid integer DEFAULT nextval('datagenerated_ein_seq'::regclass) NOT NULL,
                                   einvalue varchar(10) DEFAULT 'NULL'::character varying,
                                   createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1,
                                   createduser varchar(20) DEFAULT 'NULL'::character varying,
                                   registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                   PRIMARY KEY (einid)
);

CREATE TABLE datagenerated_phonenumber (
                                           phonenumberid integer DEFAULT nextval('datagenerated_phonenumber_seq'::regclass) NOT NULL,
                                           phonenumbervalue varchar(8) DEFAULT 'NULL'::character varying,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser varchar(20) DEFAULT 'NULL'::character varying,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           PRIMARY KEY (phonenumberid)
);

CREATE TABLE datagenerated_phonenumbersintl (
                                                phonenumberintlid integer DEFAULT nextval('datagenerated_phonenumberintl_seq'::regclass) NOT NULL,
                                                phonenumbervalue varchar(12) DEFAULT 'NULL'::character varying,
                                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                countryid integer,
                                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                                PRIMARY KEY (phonenumberintlid)
);

CREATE TABLE datagenerated_regexs (
                                      regexid integer DEFAULT nextval('datagenerated_regex_seq'::regclass) NOT NULL,
                                      regexvalue varchar(25) DEFAULT 'NULL'::character varying,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      createduser varchar(20) DEFAULT 'NULL'::character varying,
                                      regextypeid integer,
                                      registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                      PRIMARY KEY (regexid)
);

CREATE TABLE datagenerated_serialnumbers (
                                             serialnumberid integer DEFAULT nextval('datagenerated_serialnumbers_seq'::regclass) NOT NULL,
                                             serialnumbervalue varchar(25) DEFAULT 'NULL'::character varying,
                                             createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                             statusid integer DEFAULT 1,
                                             createduser varchar(20) DEFAULT 'NULL'::character varying,
                                             registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                             PRIMARY KEY (serialnumberid)
);

CREATE TABLE datagenerated_socialsecuritynumber (
                                                    socialsecuritynumberid integer DEFAULT nextval('datagenerated_socialsecuritynumber_seq'::regclass) NOT NULL,
                                                    socialsecuritynumbervalue varchar(11) DEFAULT 'NULL'::character varying,
                                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                    statusid integer DEFAULT 1,
                                                    createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                    registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                                    PRIMARY KEY (socialsecuritynumberid)
);

CREATE TABLE datagenerated_useridentities (
                                              useridentitiesid integer DEFAULT nextval('datagenerated_useridentities_seq'::regclass) NOT NULL,
                                              useridentityvalue varchar(20) DEFAULT 'NULL'::character varying,
                                              userdomain varchar(20) DEFAULT 'NULL'::character varying,
                                              additionalattributes varchar(40) DEFAULT 'NULL'::character varying,
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                              datagentypeid integer,
                                              PRIMARY KEY (useridentitiesid)
);

CREATE TABLE datamodel_apis (
                                datamodelapiid integer DEFAULT nextval('datamodel_apis_seq'::regclass) NOT NULL,
                                technology varchar(30),
                                baseurllocation varchar(99),
                                apiname varchar(79),
                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                statusid integer DEFAULT 1,
                                details varchar(249),
                                datmodel_tablename varchar(99),
                                apiparams varchar(59),
                                apiexample varchar(149),
                                dataattributeid integer DEFAULT 1,
                                PRIMARY KEY (datamodelapiid)
);

CREATE TABLE datamodel_datatables (
                                      tablename varchar(64) NOT NULL,
                                      tableinformation varchar(249) DEFAULT 'NULL'::character varying,
                                      statusid integer DEFAULT 1,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      "domain" varchar(64),
                                      PRIMARY KEY (tablename)
);

CREATE TABLE datamodel_domain (
                                  domainname varchar(64) NOT NULL,
                                  domaininformation varchar(249) DEFAULT 'NULL'::character varying,
                                  statusid integer DEFAULT 1,
                                  createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (domainname)
);

CREATE TABLE datastructure_core (
                                    datastructurecoreid integer DEFAULT nextval('datastructure_coreid_seq'::regclass) NOT NULL,
                                    datastructurename varchar(29) DEFAULT 'NULL'::character varying,
                                    datastructuredetails text DEFAULT 'NULL'::character varying,
                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                    statusid integer DEFAULT 1,
                                    registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                    PRIMARY KEY (datastructurecoreid)
);

CREATE TABLE impl_application (
                                  appguid char(38) DEFAULT 'gen_random_uuid()' NOT NULL,
                                  applicationcustomcode varchar(15) DEFAULT 'NULL'::character varying,
                                  applicationdesc varchar(50) DEFAULT 'NULL'::character varying,
                                  createduser varchar(20) DEFAULT 'NULL'::character varying,
                                  createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                  statusid integer DEFAULT 1,
                                  vendorid integer,
                                  industry_oid varchar(49),
                                  organization_uid varchar(49),
                                  PRIMARY KEY (appguid)
);

CREATE TABLE impl_codesets (
                               implcodesetid integer DEFAULT nextval('impl_codesets_seq'::regclass) NOT NULL,
                               codesetsid bigint NOT NULL,
                               createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                               statusid integer DEFAULT 1,
                               organizationid char(38) DEFAULT 'NULL'::character varying,
                               applicationid char(38) DEFAULT 'NULL'::character varying,
                               industrystd varchar(6) DEFAULT 'NULL'::character varying,
                               externaltableid varchar(20) DEFAULT 'NULL'::character varying,
                               externalnotes varchar(149) DEFAULT 'NULL'::character varying,
                               externallink varchar(99) DEFAULT 'NULL'::character varying,
                               codesetdesc varchar(69),
                               PRIMARY KEY (implcodesetid)
);


CREATE TABLE impl_codesets_crossmaps (
                                         codesetcrossmapid integer DEFAULT nextval('impl_codesetscrossmaps_codesetcrossmapid_seq'::regclass) NOT NULL,
                                         implcodesetsid integer NOT NULL,
                                         codesettoapplicationid bigint,
                                         terminologystdto integer,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         transformcodevalue varchar(40) DEFAULT 'NULL'::character varying,
                                         transformcodedesc varchar(129) DEFAULT 'NULL'::character varying,
                                         originalcodevalue varchar(40),
                                         originalcodedesc varchar(40),
                                         PRIMARY KEY (codesetcrossmapid)
);

CREATE TABLE impl_legalentities (
                                    legalentityguid char(38) NOT NULL,
                                    locationname varchar(50) DEFAULT 'NULL'::character varying,
                                    address varchar(75) DEFAULT 'NULL'::character varying,
                                    city varchar(60) DEFAULT 'NULL'::character varying,
                                    stateid varchar(2) DEFAULT 'NULL'::character varying,
                                    zipcode varchar(12) DEFAULT 'NULL'::character varying,
                                    createduser varchar(20) DEFAULT 'NULL'::character varying,
                                    statusid integer DEFAULT 1,
                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                    locationurl varchar(99) DEFAULT 'NULL'::character varying,
                                    locationphone varchar(12) DEFAULT 'NULL'::character varying,
                                    PRIMARY KEY (legalentityguid)
);

CREATE TABLE impl_organization (
                                   organizationguid char(38) NOT NULL,
                                   organizationinternalcode varchar(10) DEFAULT 'NULL'::character varying,
                                   organizationinternalid varchar(10) DEFAULT 'NULL'::character varying,
                                   organizationname varchar(50) DEFAULT 'NULL'::character varying,
                                   address varchar(75) DEFAULT 'NULL'::character varying,
                                   city varchar(60) DEFAULT 'NULL'::character varying,
                                   stateid varchar(2) DEFAULT 'NULL'::character varying,
                                   zipcode varchar(12) DEFAULT 'NULL'::character varying,
                                   createduser varchar(20) DEFAULT 'NULL'::character varying,
                                   statusid integer DEFAULT 1,
                                   createddate timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
                                   legalentityguid varchar(38) DEFAULT 'NULL'::character varying,
                                   PRIMARY KEY (organizationguid)
);

CREATE TABLE impl_professiontypes (
                                      professiontypeid integer DEFAULT nextval('impl_professiontypes_seq'::regclass) NOT NULL,
                                      professiontypename varchar(65) DEFAULT 'NULL'::character varying,
                                      createduser varchar(20) DEFAULT 'NULL'::character varying,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      PRIMARY KEY (professiontypeid)
);

CREATE TABLE impl_regextypes (
                                 implregextypeid integer DEFAULT nextval('impl_regextypes_seq'::regclass) NOT NULL,
                                 regextypedesc varchar(69),
                                 createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                 statusid integer DEFAULT 1,
                                 organizationid char(38) DEFAULT 'NULL'::character varying,
                                 applicationid char(38) DEFAULT 'NULL'::character varying,
                                 PRIMARY KEY (implregextypeid)
);

CREATE TABLE impl_rulesets (
                               ruleid integer DEFAULT nextval('impl_rulesets_seq'::regclass) NOT NULL,
                               rulename varchar(65) DEFAULT 'NULL'::character varying,
                               createduser varchar(20) DEFAULT 'NULL'::character varying,
                               createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                               statusid integer DEFAULT 1,
                               expirationdate timestamp,
                               PRIMARY KEY (ruleid)
);

CREATE TABLE impl_rulesetsdefinitions (
                                          rulesetdefinitionsid char(38) NOT NULL,
                                          rulesetdefinitionname varchar(50) DEFAULT 'NULL'::character varying,
                                          rulesetid integer,
                                          steporderid integer,
                                          operationtypeid varchar(7) DEFAULT 'NULL'::character varying,
                                          rulesetdefvalue char(40) DEFAULT 'NULL'::bpchar,
                                          statusid integer DEFAULT 1,
                                          createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                          effectivedate timestamp,
                                          applicationid char(38) DEFAULT 'NULL'::character varying,
                                          termdate timestamp,
                                          dataattributeid integer,
                                          PRIMARY KEY (rulesetdefinitionsid)
);

CREATE TABLE platform_appsettings_general (
                                              appsettingsid integer DEFAULT nextval('platform_appsettings_general_seq'::regclass) NOT NULL,
                                              appsettingname varchar(50) DEFAULT 'NULL'::character varying,
                                              appsettingvalue varchar(199) DEFAULT 'NULL'::character varying,
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              registeredapp char(38) DEFAULT 'NULL'::character varying,
                                              defaultdatagenerationapp char(38) DEFAULT 'NULL'::character varying,
                                              PRIMARY KEY (appsettingsid)
);


CREATE TABLE platform_config_dataattributes (
                                                datagenconfigid integer DEFAULT nextval('platform_config_datagen_datagenconfigid_seq'::regclass) NOT NULL,
                                                datatypegenconfigname varchar(25) DEFAULT 'NULL'::character varying,
                                                dataattributeid integer,
                                                runquantity integer,
                                                datagentypeid integer,
                                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                applicationid char(38) DEFAULT 'NULL'::bpchar,
                                                PRIMARY KEY (datagenconfigid)
);

CREATE TABLE platform_config_datastructures (
                                                platformdatastructuresid integer DEFAULT nextval('platform_datastructures_platformdatastructuresid_seq'::regclass) NOT NULL,
                                                datastructurename varchar(50) DEFAULT 'NULL'::character varying,
                                                sensitivityflagid integer,
                                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                platformdatastructuresguid char(38) DEFAULT 'gen_random_uuid()',
                                                registeredapp char(38) DEFAULT NULL,
                                                PRIMARY KEY (platformdatastructuresid)
);

CREATE TABLE platform_config_datastructures_dtl (
                                                    platformdatastructurestodataattributesid integer DEFAULT nextval('platform_datastructurestodata_platformdatastructurestodataa_seq'::regclass) NOT NULL,
                                                    platformdatastructuresid integer,
                                                    compositedatastructurename varchar(50) DEFAULT 'NULL'::character varying,
                                                    sensitivityflagid integer DEFAULT 1,
                                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                    statusid integer DEFAULT 1,
                                                    createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                    platformdatastructurestodataattributesguid char(38) DEFAULT 'NULL'::bpchar,
                                                    registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                                    platformdataattributesid integer,
                                                    PRIMARY KEY (platformdatastructurestodataattributesid)
);

CREATE TABLE platform_dataattributes (
                                         platformdataattributesid integer DEFAULT nextval('platform_dataattributes_seq'::regclass) NOT NULL,
                                         dataattributename varchar(50) DEFAULT 'NULL'::character varying,
                                         sensitivityflagid integer,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         platformdataattributeguid char(38) DEFAULT 'NULL'::bpchar,
                                         registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                         platformtablename varchar(38) DEFAULT 'NULL'::character varying,
                                         PRIMARY KEY (platformdataattributesid)
);

CREATE TABLE platform_industrystds_metadata (
                                         platformdindustrystdmetadatasid integer DEFAULT nextval('platform_industrystds_metadata_seq'::regclass) NOT NULL,
                                         eventtypeid varchar(10) DEFAULT 'NULL'::character varying,
                                         industryversion varchar(10) DEFAULT 'NULL'::character varying,
                                         segmentdetail varchar(50) DEFAULT 'NULL'::character varying,
                                         fieldorderid integer,
                                         fieldid varchar(10) DEFAULT 'NULL'::character varying,
                                         fieldname varchar(50) DEFAULT 'NULL'::character varying,
                                         fielddesc varchar(99) DEFAULT 'NULL'::character varying,
                                         sensitivityflagid integer,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         PRIMARY KEY (platformdindustrystdmetadatasid)
);

CREATE TABLE refdata_codeset (
                                 codesetsid integer DEFAULT nextval('refdata_codeset_seq'::regclass) NOT NULL,
                                 codesetname varchar(50) DEFAULT 'NULL'::character varying,
                                 industrystd varchar(6) DEFAULT 'NULL'::character varying,
                                 statusid integer DEFAULT 1,
                                 createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                 createduser varchar(20) DEFAULT 'NULL'::character varying,
                                 codesetguid char(38) DEFAULT 'NULL'::bpchar,
                                 fieldmapping varchar(40) DEFAULT 'NULL'::character varying,
                                 sensitivityflagid integer,
                                 externaltableid varchar(20) DEFAULT 'NULL'::character varying,
                                 externalnotes varchar(149) DEFAULT 'NULL'::character varying,
                                 externallink varchar(99) DEFAULT 'NULL'::character varying,
                                 PRIMARY KEY (codesetsid)
);

CREATE TABLE refdata_countries (
                                   countryid integer DEFAULT nextval('refdata_countries_seq'::regclass) NOT NULL,
                                   idd varchar(5) DEFAULT 'NULL'::character varying,
                                   countryname varchar(59) DEFAULT 'NULL'::character varying,
                                   createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1,
                                   PRIMARY KEY (countryid)
);

CREATE TABLE refdata_datagentypes (
                                      datagentypeid integer DEFAULT nextval('refdata_datagentypes_seq'::regclass) NOT NULL,
                                      datagentypedescription varchar(65) DEFAULT 'NULL'::character varying,
                                      definition varchar(255) DEFAULT 'NULL'::character varying,
                                      dataattributeid integer,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      createduser varchar(20) DEFAULT 'NULL'::character varying,
                                      PRIMARY KEY (datagentypeid)
);

CREATE TABLE refdata_devicetypes (
                                     devicetypeid integer DEFAULT nextval('refdata_devicetypes_seq'::regclass) NOT NULL,
                                     devicetype varchar(30),
                                     createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1,
                                     PRIMARY KEY (devicetypeid)
);

CREATE TABLE refdata_industrystd_eventtypes
(
    eventtypeid     varchar(10) default not null primary key,
    eventtypesddesc varchar(30) default 'NULL'::character varying,
    industrystd     varchar(6),
    createddate     timestamp   default CURRENT_TIMESTAMP,
    statusid        integer     default 1
);

CREATE TABLE refdata_industries (
                                    industryid integer DEFAULT nextval('refdata_industries_seq'::regclass) NOT NULL,
                                    industryname varchar(45),
                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                    statusid integer DEFAULT 1,
                                    PRIMARY KEY (industryid)
);

CREATE TABLE refdata_industriestobusiness (
                                              industrytobusinessid integer DEFAULT nextval('refdata_industriestobusiness_seq'::regclass) NOT NULL,
                                              industryid integer,
                                              businessarea varchar(50),
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              PRIMARY KEY (industrytobusinessid)
);

CREATE TABLE refdata_industrystd (
                                     industrystd varchar(6) NOT NULL,
                                     industrystddesc varchar(30) DEFAULT 'NULL'::character varying,
                                     createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1,
                                     PRIMARY KEY (industrystd)
);

CREATE TABLE refdata_operationtype (
                                       operationtypeid varchar(7) NOT NULL,
                                       operationtypename varchar(60) DEFAULT 'NULL'::character varying,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       PRIMARY KEY (operationtypeid)
);

CREATE TABLE refdata_platformparams (
                                        platformparamsid integer DEFAULT nextval('refdata_platformparams_seq'::regclass) NOT NULL,
                                        platformparamvalues varchar(35) DEFAULT 'NULL'::character varying,
                                        platformparamdesc varchar(70) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        PRIMARY KEY (platformparamsid)
);


CREATE TABLE refdata_platformparamstodataattributes (
                                                        platformparamstodataattributeid integer DEFAULT nextval('refdata_platformparamstodataa_platformparamstodataattribute_seq'::regclass) NOT NULL,
                                                        platformparamsid integer,
                                                        dataattributeid integer,
                                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                        statusid integer DEFAULT 1,
                                                        registeredapp char(38) DEFAULT 'NULL'::character varying,
                                                        PRIMARY KEY (platformparamstodataattributeid)
);

CREATE TABLE refdata_sensitivityflag (
                                         sensitiveflagid integer DEFAULT nextval('refdata_sensitivityflag_seq'::regclass) NOT NULL,
                                         sensitiveflagdesc varchar(30) DEFAULT 'NULL'::character varying,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         PRIMARY KEY (sensitiveflagid)
);

CREATE TABLE refdata_status (
                                statusid integer DEFAULT nextval('refdata_status_seq'::regclass) NOT NULL,
                                statusdescription varchar(45) NOT NULL,
                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                PRIMARY KEY (statusid)
);

CREATE TABLE refdata_terminologystd (
                                        terminologystdid integer DEFAULT nextval('refdata_terminologystd_seq'::regclass) NOT NULL,
                                        terminologystd varchar(25) NOT NULL,
                                        terminologystdversion varchar(10) NOT NULL,
                                        terminologystddesc varchar(129) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        PRIMARY KEY (terminologystdid)
);

CREATE TABLE refdata_timezones (
                                   timezonevalue varchar(3) NOT NULL,
                                   timezonedesc varchar(25) DEFAULT 'NULL'::character varying,
                                   createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1,
                                   PRIMARY KEY (timezonevalue)
);

CREATE TABLE refdata_usstates (
                                  stateid varchar(2) NOT NULL,
                                  statedescription varchar(65) DEFAULT 'NULL'::character varying,
                                  lattitude varchar(12) DEFAULT 'NULL'::character varying,
                                  longitude varchar(12) DEFAULT 'NULL'::character varying,
                                  createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                  statusid integer DEFAULT 1,
                                  createduser varchar(20) DEFAULT 'NULL'::character varying,
                                  PRIMARY KEY (stateid)
);

CREATE TABLE refdata_vendor (
                                vendorid integer DEFAULT nextval('refdata_vendor_seq'::regclass) NOT NULL,
                                vendorname varchar(50) DEFAULT 'NULL'::character varying,
                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                statusid integer DEFAULT 1,
                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                vendorguid char(38) DEFAULT 'NULL'::bpchar,
                                PRIMARY KEY (vendorid)
);

CREATE TABLE terms_codeset_industrystd (
                                           termcodesetid integer DEFAULT nextval('terms_codeset_industrystd_seq'::regclass)NOT NULL,
                                           codesetsid integer NOT NULL,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           codevalue varchar(20) DEFAULT 'NULL'::character varying,
                                           codedesc varchar(129) DEFAULT 'NULL'::character varying,
                                           industrystd varchar(6) DEFAULT 'UNDF'::character varying,
                                           terminologystdid integer,
                                           PRIMARY KEY (termcodesetid)
);

CREATE TABLE terms_umls_mrconoso (
                                     cui char(8) NOT NULL,
                                     lat char(3) NOT NULL,
                                     ts char(1) NOT NULL,
                                     lui varchar(10) NOT NULL,
                                     stt varchar(3) NOT NULL,
                                     sui varchar(10) NOT NULL,
                                     ispref char(1) NOT NULL,
                                     aui varchar(9) NOT NULL,
                                     saui varchar(50) DEFAULT 'NULL'::character varying,
                                     scui varchar(100) DEFAULT 'NULL'::character varying,
                                     sdui varchar(100) DEFAULT 'NULL'::character varying,
                                     sab varchar(20) NOT NULL,
                                     tty varchar(20) NOT NULL,
                                     code varchar(100) NOT NULL,
                                     str varchar(3000) NOT NULL,
                                     srl varchar(25) NOT NULL,
                                     suppress char(1) NOT NULL,
                                     cvf varchar(25) DEFAULT 'NULL'::character varying
);

-- Foreign Keys

ALTER TABLE dataexisting_ababanking
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_ababanking
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_areacode
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_areacode
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_areacode
    ADD FOREIGN KEY (timezone)
        REFERENCES refdata_timezones (timezonevalue);

ALTER TABLE dataexisting_areacode
    ADD FOREIGN KEY (statecode)
        REFERENCES refdata_usstates (stateid);

ALTER TABLE dataexisting_areacodeintl
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_areacodeintl
    ADD FOREIGN KEY (countryid)
        REFERENCES refdata_countries (countryid);

ALTER TABLE dataexisting_areacodeintl
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_companies
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_companies
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_namefirst
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_namefirst
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_namelast
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_namelast
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_profession
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

/*ALTER TABLE dataexisting_profession
    ADD FOREIGN KEY (professiontypeid)
        REFERENCES impl_professiontypes (professiontypeid);
*/
ALTER TABLE dataexisting_profession
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_upccodes
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_upccodes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_zipcodeintl
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_zipcodeintl
    ADD FOREIGN KEY (country)
        REFERENCES refdata_countries (countryid);

ALTER TABLE dataexisting_zipcodeintl
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE dataexisting_zipcodeus
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE dataexisting_zipcodeus
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_accountnumbers
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_accountnumbers
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_accountnumbers
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_addresses
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_addresses
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_addresses
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_bankaccount
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_bankaccount
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_bankaccount
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_creditcard
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_creditcard
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_creditcard
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_custom
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_custom
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_custom
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_dateofbirth
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_dateofbirth
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_devices
    ADD FOREIGN KEY (application)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_devices
    ADD FOREIGN KEY (devicetypeid)
        REFERENCES refdata_devicetypes (devicetypeid);

ALTER TABLE datagenerated_devices
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_driverslicenses
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_driverslicenses
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_driverslicenses
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_driverslicenses
    ADD FOREIGN KEY (statecode)
        REFERENCES refdata_usstates (stateid);

ALTER TABLE datagenerated_ein
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_ein
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_phonenumber
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_phonenumber
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_phonenumbersintl
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_phonenumbersintl
    ADD FOREIGN KEY (countryid)
        REFERENCES refdata_countries (countryid);

ALTER TABLE datagenerated_phonenumbersintl
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_regexs
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_regexs
    ADD FOREIGN KEY (regextypeid)
        REFERENCES impl_regextypes (implregextypeid);

ALTER TABLE datagenerated_regexs
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_serialnumbers
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_serialnumbers
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_socialsecuritynumber
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_socialsecuritynumber
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datagenerated_useridentities
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datagenerated_useridentities
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE datagenerated_useridentities
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE datamodel_apis
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY ("domain")
        REFERENCES datamodel_domain (domainname);

ALTER TABLE datamodel_datatables
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datastructure_core
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_core
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_application
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_application
    ADD FOREIGN KEY (vendorid)
        REFERENCES refdata_vendor (vendorid);

ALTER TABLE impl_codesets
    ADD FOREIGN KEY (applicationid)
        REFERENCES impl_application (appguid);

ALTER TABLE impl_codesets
    ADD FOREIGN KEY (organizationid)
        REFERENCES impl_organization (organizationguid);

ALTER TABLE impl_codesets
    ADD FOREIGN KEY (codesetsid)
        REFERENCES refdata_codeset (codesetsid);

ALTER TABLE impl_codesets
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE impl_codesets
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_codesets_crossmaps
    ADD FOREIGN KEY (implcodesetsid)
        REFERENCES impl_codesets (implcodesetid);

ALTER TABLE impl_codesets_crossmaps
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_codesets_crossmaps
    ADD FOREIGN KEY (terminologystdto)
        REFERENCES refdata_terminologystd (terminologystdid);

ALTER TABLE impl_legalentities
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_legalentities
    ADD FOREIGN KEY (stateid)
        REFERENCES refdata_usstates (stateid);

ALTER TABLE impl_organization
    ADD FOREIGN KEY (legalentityguid)
        REFERENCES impl_legalentities (legalentityguid);

ALTER TABLE impl_organization
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_organization
    ADD FOREIGN KEY (stateid)
        REFERENCES refdata_usstates (stateid);

ALTER TABLE impl_professiontypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_regextypes
    ADD FOREIGN KEY (applicationid)
        REFERENCES impl_application (appguid);

ALTER TABLE impl_regextypes
    ADD FOREIGN KEY (organizationid)
        REFERENCES impl_organization (organizationguid);

ALTER TABLE impl_regextypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_rulesets
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE impl_rulesetsdefinitions
    ADD FOREIGN KEY (applicationid)
        REFERENCES impl_application (appguid);

ALTER TABLE impl_rulesetsdefinitions
    ADD FOREIGN KEY (rulesetid)
        REFERENCES impl_rulesets (ruleid);

ALTER TABLE impl_rulesetsdefinitions
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE impl_rulesetsdefinitions
    ADD FOREIGN KEY (operationtypeid)
        REFERENCES refdata_operationtype (operationtypeid);

ALTER TABLE impl_rulesetsdefinitions
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_appsettings_general
    ADD FOREIGN KEY (defaultdatagenerationapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_appsettings_general
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_appsettings_general
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_config_dataattributes
    ADD FOREIGN KEY (applicationid)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_config_dataattributes
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_config_dataattributes
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE platform_config_dataattributes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_config_datastructures
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_config_datastructures
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_config_datastructures
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_config_datastructures_dtl
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_config_datastructures_dtl
    ADD FOREIGN KEY (platformdatastructuresid)
        REFERENCES platform_config_datastructures (platformdatastructuresid);

ALTER TABLE platform_config_datastructures_dtl
    ADD FOREIGN KEY (platformdataattributesid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_config_datastructures_dtl
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_config_datastructures_dtl
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_dataattributes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_industrystds_metadata
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE platform_industrystds_metadata
    ADD FOREIGN KEY (eventtypeid)
        REFERENCES refdata_industrystd_eventtypes (eventtypeid);

ALTER TABLE platform_industrystds_metadata
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE refdata_codeset
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_countries
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_datagentypes
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE refdata_datagentypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_devicetypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_industrystd_eventtypes
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_industries
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY (industryid)
        REFERENCES refdata_industries (industryid);

ALTER TABLE refdata_industriestobusiness
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_industrystd
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_operationtype
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_platformparams
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_platformparamstodataattributes
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE refdata_platformparamstodataattributes
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE refdata_platformparamstodataattributes
    ADD FOREIGN KEY (platformparamsid)
        REFERENCES refdata_platformparams (platformparamsid);

ALTER TABLE refdata_platformparamstodataattributes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_sensitivityflag
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_terminologystd
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_timezones
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_usstates
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE refdata_vendor
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (codesetsid)
        REFERENCES refdata_codeset (codesetsid);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE terms_codeset_industrystd
    ADD FOREIGN KEY (terminologystdid)
        REFERENCES refdata_terminologystd (terminologystdid);


-- Indexes

CREATE INDEX dataexisting_namefirst_idx ON dataexisting_namefirst USING btree (firstnameid, firstname, gender, statusid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_namefirst_uindex ON dataexisting_namefirst USING btree (firstname, gender, registeredapp);

CREATE INDEX dataexisting_namelast_index ON dataexisting_namelast USING btree (lastnameid, lastname, statusid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_namelast_uindex ON dataexisting_namelast USING btree (lastname, registeredapp);

CREATE INDEX dataexisting_profession_idx ON dataexisting_profession USING btree (professionid, professionname, statusid, professiontypeid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_profession_uindex ON dataexisting_profession USING btree (professionname, professiontypeid, registeredapp);

CREATE INDEX datagenerated_accountnumbers_index ON datagenerated_accountnumbers USING btree (accountnumbersid, accountnumbervalue, createddate, createduser, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_accountnumbers_uindex ON datagenerated_accountnumbers USING btree (accountnumbervalue, registeredapp, datagentypeid);

CREATE INDEX datagenerated_addresses_index ON datagenerated_addresses USING btree (addressid, addressstreet, addressstreet2, createddate, createduser, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_addresses_uindex ON datagenerated_addresses USING btree (addressstreet, addressstreet2, registeredapp, datagentypeid);

CREATE INDEX datagenerated_bankaccount_index ON datagenerated_bankaccount USING btree (bankaccountsid, bankaccountvalue, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_bankaccount_uindex ON datagenerated_bankaccount USING btree (bankaccountvalue, registeredapp, datagentypeid);

CREATE INDEX datagenerated_creditcard_index ON datagenerated_creditcard USING btree (creditcardid, creditcardnumber, creditcardname, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_creditcard_uindex ON datagenerated_creditcard USING btree (creditcardnumber, creditcardname, registeredapp, datagentypeid);

CREATE INDEX datagenerated_custom_index ON datagenerated_custom USING btree (customidentifier, customidentifierdesc, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_custom_uindex ON datagenerated_custom USING btree (customidentifier, customidentifierdesc, registeredapp, datagentypeid);

CREATE INDEX datagenerated_dateofbirth_index ON datagenerated_dateofbirth USING btree (dateofbirthsid, dateofbirth, age, dateofbirthdate, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_dateofbirth_uindex ON datagenerated_dateofbirth USING btree (dateofbirthdate, dateofbirth, dateofbirthdate, registeredapp);

CREATE INDEX datagenerated_driverslicenses_index ON datagenerated_driverslicenses USING btree (driverslicensesid, dln, statecode, createddate, statusid, datagentypeid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_driverslicenses_uindex ON datagenerated_driverslicenses USING btree (dln, statecode, datagentypeid, registeredapp);

CREATE INDEX datagenerated_ein_index ON datagenerated_ein USING btree (einid, einvalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_ein_uindex ON datagenerated_ein USING btree (einvalue, registeredapp);

CREATE INDEX datagenerated_phonenumber_index ON datagenerated_phonenumber USING btree (phonenumberid, phonenumbervalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_phonenumber_uindex ON datagenerated_phonenumber USING btree (phonenumbervalue, registeredapp);

CREATE INDEX datagenerated_phonenumbersintl_index ON datagenerated_phonenumbersintl USING btree (phonenumberintlid, phonenumbervalue, createddate, statusid, countryid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_phonenumbersintl_uindex ON datagenerated_phonenumbersintl USING btree (phonenumbervalue, countryid, registeredapp);

CREATE INDEX datagenerated_socialsecuritynumber_index ON datagenerated_socialsecuritynumber USING btree (socialsecuritynumberid, socialsecuritynumbervalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_socialsecuritynumber_uindex ON datagenerated_socialsecuritynumber USING btree (socialsecuritynumbervalue, registeredapp);

CREATE INDEX datagenerated_useridentities_index ON datagenerated_useridentities USING btree (useridentitiesid, useridentityvalue, userdomain, additionalattributes, createddate, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_useridentities_uindex ON datagenerated_useridentities USING btree (useridentityvalue, userdomain, additionalattributes, registeredapp);

CREATE INDEX terms_codeset_industrystd_index ON terms_codeset_industrystd USING btree (termcodesetid, codesetsid, createddate, statusid, codevalue, codedesc, industrystd);

CREATE UNIQUE INDEX terms_codeset_industrystd_uindex ON terms_codeset_industrystd USING btree (codesetsid, codevalue, codedesc, industrystd);

CREATE INDEX terms_umls_mrconoso_index ON terms_umls_mrconoso USING btree (cui, lat, ts, lui, stt, sui, ispref, aui, saui, scui, sdui, sab, tty, code, str, srl, suppress, cvf);
