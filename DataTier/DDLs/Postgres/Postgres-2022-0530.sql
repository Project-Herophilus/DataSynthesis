CREATE TABLE dataexisting_ababanking (
                                         ababankingid serial NOT NULL,
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
                                       areacodeid serial NOT NULL,
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
                                        companiesid serial NOT NULL,
                                        companyname varchar(79) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        createduser varchar(20) DEFAULT 'NULL'::character varying,
                                        registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                        PRIMARY KEY (companiesid)
);

CREATE TABLE dataexisting_namefirst (
                                        firstnameid serial NOT NULL,
                                        firstname varchar(39) DEFAULT 'NULL'::character varying,
                                        gender varchar(1) DEFAULT 'NULL'::character varying,
                                        statusid integer DEFAULT 1,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        createduser varchar(20) DEFAULT 'NULL'::character varying,
                                        registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                        PRIMARY KEY (firstnameid)
);

CREATE TABLE dataexisting_namelast (
                                       lastnameid serial NOT NULL,
                                       lastname varchar(69) DEFAULT 'NULL'::character varying,
                                       statusid integer DEFAULT 1 NOT NULL,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       createduser varchar(20) DEFAULT 'NULL'::character varying,
                                       registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                       PRIMARY KEY (lastnameid)
);

CREATE TABLE dataexisting_upccodes (
                                       upccodeid serial NOT NULL,
                                       upccodename varchar(15) DEFAULT 'NULL'::character varying,
                                       upcproductname varchar(150) DEFAULT 'NULL'::character varying,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                       PRIMARY KEY (upccodeid)
);

CREATE TABLE dataexisting_zipcodeintl (
                                          zipcodeintnlid serial NOT NULL,
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
                                        zipcodeid serial NOT NULL,
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
                                              accountnumbersid serial NOT NULL,
                                              accountnumbervalue varchar(20) DEFAULT 'NULL'::character varying,
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              createduser varchar(20) DEFAULT 'NULL'::character varying,
                                              statusid integer DEFAULT 1,
                                              registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                              datagentypeid integer,
                                              PRIMARY KEY (accountnumbersid)
);

CREATE TABLE datagenerated_addresses (
                                         addressid serial NOT NULL,
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
                                           bankaccountsid serial NOT NULL,
                                           bankaccountvalue varchar(17) DEFAULT 'NULL'::character varying,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser varchar(20) DEFAULT 'NULL'::character varying,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           datagentypeid integer,
                                           PRIMARY KEY (bankaccountsid)
);

CREATE TABLE datagenerated_creditcard (
                                          creditcardid serial NOT NULL,
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
                                      datagencustomdid serial NOT NULL,
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
                                           dateofbirthsid serial NOT NULL,
                                           dateofbirth varchar(12) DEFAULT 'NULL'::character varying,
                                           dateofbirthdate date,
                                           age integer,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser varchar(20) DEFAULT 'NULL'::character varying,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           PRIMARY KEY (dateofbirthsid)
);

CREATE TABLE datagenerated_driverslicenses (
                                               driverslicensesid serial NOT NULL,
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
                                   einid serial NOT NULL,
                                   einvalue varchar(10) DEFAULT 'NULL'::character varying,
                                   createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1,
                                   createduser varchar(20) DEFAULT 'NULL'::character varying,
                                   registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                   PRIMARY KEY (einid)
);

CREATE TABLE datagenerated_phonenumber (
                                           phonenumberid serial NOT NULL,
                                           phonenumbervalue varchar(8) DEFAULT 'NULL'::character varying,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           createduser varchar(20) DEFAULT 'NULL'::character varying,
                                           registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                           PRIMARY KEY (phonenumberid)
);

CREATE TABLE datagenerated_phonenumbersintl (
                                                phonenumberintlid serial NOT NULL,
                                                phonenumbervalue varchar(12) DEFAULT 'NULL'::character varying,
                                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                countryid integer,
                                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                                PRIMARY KEY (phonenumberintlid)
);

CREATE TABLE datagenerated_serialnumbers (
                                             serialnumberid serial NOT NULL,
                                             serialnumbervalue varchar(25) DEFAULT 'NULL'::character varying,
                                             createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                             statusid integer DEFAULT 1,
                                             createduser varchar(20) DEFAULT 'NULL'::character varying,
                                             registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                             PRIMARY KEY (serialnumberid)
);

CREATE TABLE datagenerated_socialsecuritynumber (
                                                    socialsecuritynumberid serial NOT NULL,
                                                    socialsecuritynumbervalue varchar(11) DEFAULT 'NULL'::character varying,
                                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                    statusid integer DEFAULT 1,
                                                    createduser varchar(20) DEFAULT 'NULL'::character varying,
                                                    registeredapp char(38) DEFAULT 'NULL'::bpchar,
                                                    PRIMARY KEY (socialsecuritynumberid)
);

CREATE TABLE datagenerated_useridentities (
                                              useridentitiesid serial NOT NULL,
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
                                tablename varchar(64),
                                statusid integer DEFAULT 1,
                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                node_api_endpoint varchar(99),
                                quarkus_api_endpoint varchar(99),
                                api_desc varchar(99),
                                api_name varchar(49),
                                datamodelapiid serial NOT NULL,
                                PRIMARY KEY (datamodelapiid)
);

CREATE TABLE datamodel_datatables (
                                      tablename varchar(64) NOT NULL,
                                      tableinformation varchar(249) DEFAULT 'NULL'::character varying,
                                      statusid integer DEFAULT 1,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      PRIMARY KEY (tablename)
);

CREATE TABLE datamodel_domain (
                                  domainname varchar(64) NOT NULL,
                                  domaininformation varchar(249) DEFAULT 'NULL'::character varying,
                                  statusid integer DEFAULT 1,
                                  createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY (domainname)
);

CREATE TABLE datastructure_address (
                                       completeaddressid serial NOT NULL,
                                       address1 varchar(99) DEFAULT 'NULL'::character varying,
                                       city varchar(70) DEFAULT 'NULL'::character varying,
                                       stateid varchar(2) DEFAULT 'NULL'::character varying,
                                       zipcode varchar(10) DEFAULT 'NULL'::character varying,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                       PRIMARY KEY (completeaddressid)
);

CREATE TABLE datastructure_bankaccount (
                                           databuiltbankaccountsid serial NOT NULL,
                                           bankaccountnumber varchar(12) DEFAULT 'NULL'::character varying,
                                           bankaccountname varchar(75) DEFAULT 'NULL'::character varying,
                                           bankroutingid varchar(9) DEFAULT 'NULL'::character varying,
                                           createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                           statusid integer DEFAULT 1,
                                           registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                           PRIMARY KEY (databuiltbankaccountsid)
);

CREATE TABLE datastructure_corporations (
                                            databuiltcorporationid serial NOT NULL,
                                            corporationname varchar(99) DEFAULT 'NULL'::character varying,
                                            address1 varchar(99) DEFAULT 'NULL'::character varying,
                                            city varchar(70) DEFAULT 'NULL'::character varying,
                                            stateid varchar(2) DEFAULT 'NULL'::character varying,
                                            zipcode varchar(10) DEFAULT 'NULL'::character varying,
                                            createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                            statusid integer DEFAULT 1,
                                            registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                            PRIMARY KEY (databuiltcorporationid)
);

CREATE TABLE datastructure_names (
                                     databuiltnamesid serial NOT NULL,
                                     completename varchar(100) DEFAULT 'NULL'::character varying,
                                     gender varchar(1) DEFAULT 'NULL'::character varying,
                                     createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1,
                                     registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                     PRIMARY KEY (databuiltnamesid)
);

CREATE TABLE datastructure_persondemographics (
                                                  persondemographicsid serial NOT NULL,
                                                  dln varchar(25) DEFAULT 'NULL'::character varying,
                                                  dlnstate varchar(2) DEFAULT 'NULL'::character varying,
                                                  ssn varchar(11) DEFAULT 'NULL'::character varying,
                                                  dobvalue varchar(12) DEFAULT 'NULL'::character varying,
                                                  dobdate date,
                                                  age integer,
                                                  createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                  statusid integer DEFAULT 1,
                                                  registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                                  PRIMARY KEY (persondemographicsid)
);

CREATE TABLE datastructure_phonenumbers (
                                            databuiltphonenumbersid serial NOT NULL,
                                            areacode varchar(3) DEFAULT 'NULL'::character varying,
                                            phonenumber varchar(8) DEFAULT 'NULL'::character varying,
                                            completephonenumber varchar(14) DEFAULT 'NULL'::character varying,
                                            createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                            statusid integer DEFAULT 1,
                                            registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                            PRIMARY KEY (databuiltphonenumbersid)
);

CREATE TABLE datastructure_phonenumbersintl (
                                                databuiltphonenumbersintlid serial NOT NULL,
                                                areacode varchar(3) DEFAULT 'NULL'::character varying,
                                                phonenumber varchar(8) DEFAULT 'NULL'::character varying,
                                                completephonenumber varchar(14) DEFAULT 'NULL'::character varying,
                                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                statusid integer DEFAULT 1,
                                                registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                                PRIMARY KEY (databuiltphonenumbersintlid)
);

CREATE TABLE datastructure_products (
                                        databuiltproductsid serial NOT NULL,
                                        productid varchar(20) DEFAULT 'NULL'::character varying,
                                        productname varchar(99) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                        PRIMARY KEY (databuiltproductsid)
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
                               implcodesetid serial NOT NULL,
                               codesetsid bigint NOT NULL,
                               createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                               statusid integer DEFAULT 1,
                               organizationid varchar(38) DEFAULT 'NULL'::character varying,
                               applicationid varchar(38) DEFAULT 'NULL'::character varying,
                               industrystd varchar(6) DEFAULT 'NULL'::character varying,
                               externaltableid varchar(20) DEFAULT 'NULL'::character varying,
                               externalnotes varchar(149) DEFAULT 'NULL'::character varying,
                               externallink varchar(99) DEFAULT 'NULL'::character varying,
                               codesetdesc varchar(69),
                               PRIMARY KEY (implcodesetid)
);

create sequence impl_codesetscrossmaps_codesetcrossmapid_seq;
CREATE TABLE impl_codesets_crossmaps (
                                         codesetcrossmapid integer DEFAULT nextval('impl_codesetscrossmaps_codesetcrossmapid_seq'::regclass) NOT NULL,
                                         implcodesetsid bigint NOT NULL,
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

create sequence refdata_devices_devicesid_seq;
CREATE TABLE impl_devices (
                              devicesid integer DEFAULT nextval('refdata_devices_devicesid_seq'::regclass) NOT NULL,
                              devicename varchar(40),
                              industryid integer,
                              devicetypeid integer,
                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                              statusid integer DEFAULT 1,
                              application varchar(38),
                              organization varchar(38),
                              PRIMARY KEY (devicesid)
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

CREATE TABLE impl_rulesets (
                               ruleid serial NOT NULL,
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
                                          rulesetid bigint,
                                          steporderid integer,
                                          operationtypeid varchar(7) DEFAULT 'NULL'::character varying,
                                          rulesetdefvalue char(40) DEFAULT 'NULL'::bpchar,
                                          statusid integer DEFAULT 1,
                                          createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                          effectivedate timestamp,
                                          applicationid varchar(38) DEFAULT 'NULL'::character varying,
                                          termdate timestamp,
                                          dataattributeid integer,
                                          PRIMARY KEY (rulesetdefinitionsid)
);

CREATE TABLE platform_appsettings_general (
                                              appsettingsid serial NOT NULL,
                                              appsettingname varchar(50) DEFAULT 'NULL'::character varying,
                                              appsettingvalue varchar(199) DEFAULT 'NULL'::character varying,
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                              defaultdatagenerationapp varchar(38) DEFAULT 'NULL'::character varying,
                                              PRIMARY KEY (appsettingsid)
);

create sequence platform_config_datagen_datagenconfigid_seq;
CREATE TABLE platform_config_dataattributes_generator (
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

CREATE TABLE platform_dataattributes (
                                         platformdataattributesid serial NOT NULL,
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

CREATE TABLE platform_datastructures (
                                         platformdatastructuresid serial NOT NULL,
                                         datastructurename varchar(50) DEFAULT 'NULL'::character varying,
                                         sensitivityflagid integer,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         createduser varchar(20) DEFAULT 'NULL'::character varying,
                                         platformdatastructuresguid char(38) DEFAULT 'NULL'::bpchar,
                                         registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                         PRIMARY KEY (platformdatastructuresid)
);

create sequence platform_datastructurestodata_platformdatastructurestodataa_seq;
CREATE TABLE platform_datastructurestodataattributes (
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

CREATE TABLE refdata_codeset (
                                 codesetsid serial NOT NULL,
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
                                   countryid serial NOT NULL,
                                   idd varchar(5) DEFAULT 'NULL'::character varying,
                                   countryname varchar(59) DEFAULT 'NULL'::character varying,
                                   createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                   statusid integer DEFAULT 1,
                                   PRIMARY KEY (countryid)
);

CREATE TABLE refdata_datagentypes (
                                      datagentypeid serial NOT NULL,
                                      datagentypedescription varchar(65) DEFAULT 'NULL'::character varying,
                                      definition varchar(255) DEFAULT 'NULL'::character varying,
                                      dataattributeid integer,
                                      createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                      statusid integer DEFAULT 1,
                                      createduser varchar(20) DEFAULT 'NULL'::character varying,
                                      PRIMARY KEY (datagentypeid)
);

CREATE TABLE refdata_devicetypes (
                                     devicetypeid serial NOT NULL,
                                     devicetype varchar(30),
                                     createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                     statusid integer DEFAULT 1,
                                     PRIMARY KEY (devicetypeid)
);

CREATE TABLE refdata_industries (
                                    industryid serial NOT NULL,
                                    industryname varchar(45),
                                    createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                    statusid integer DEFAULT 1,
                                    PRIMARY KEY (industryid)
);

CREATE TABLE refdata_industriestobusiness (
                                              industrytobusinessid serial NOT NULL,
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

CREATE TABLE refdata_industrystd_datatypes (
                                               datatypestoindustryid serial NOT NULL,
                                               industrystd varchar(6) NOT NULL,
                                               datatypename varchar(10) DEFAULT 'NULL'::character varying,
                                               datatypenamedesc varchar(75) DEFAULT 'NULL'::character varying,
                                               datatypesubfields varchar(249) DEFAULT 'NULL'::character varying,
                                               createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                               statusid integer DEFAULT 1,
                                               PRIMARY KEY (datatypestoindustryid)
);

CREATE TABLE refdata_industrystd_fields (
                                            fieldstoindustryid serial NOT NULL,
                                            messagefieldnumber varchar(14) DEFAULT 'NULL'::character varying,
                                            messagefieldname varchar(154) DEFAULT 'NULL'::character varying,
                                            fieldlength varchar(10) DEFAULT 'NULL'::character varying,
                                            datatype varchar(7) DEFAULT 'NULL'::character varying,
                                            messagesegment varchar(3) DEFAULT 'NULL'::character varying,
                                            segmentfieldorder varchar(8) DEFAULT 'NULL'::character varying,
                                            vrsn varchar(7) DEFAULT 'NULL'::character varying,
                                            industrystd varchar(7) DEFAULT 'NULL'::character varying,
                                            sensitivityflagid integer,
                                            createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                            statusid integer DEFAULT 1,
                                            PRIMARY KEY (fieldstoindustryid)
);

CREATE TABLE refdata_industrystd_segments (
                                              segmenttoindustryid serial NOT NULL,
                                              industrystd varchar(6) NOT NULL,
                                              industrystddesc varchar(30) DEFAULT 'NULL'::character varying,
                                              createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                              statusid integer DEFAULT 1,
                                              segmentname varchar(10) DEFAULT 'NULL'::character varying,
                                              segmentnamedesc varchar(129) DEFAULT 'NULL'::character varying,
                                              PRIMARY KEY (segmenttoindustryid)
);

CREATE TABLE refdata_operationtype (
                                       operationtypeid varchar(7) NOT NULL,
                                       operationtypename varchar(60) DEFAULT 'NULL'::character varying,
                                       createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                       statusid integer DEFAULT 1,
                                       PRIMARY KEY (operationtypeid)
);

CREATE TABLE refdata_platformparams (
                                        platformparamsid serial NOT NULL,
                                        platformparamvalues varchar(35) DEFAULT 'NULL'::character varying,
                                        platformparamdesc varchar(70) DEFAULT 'NULL'::character varying,
                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        PRIMARY KEY (platformparamsid)
);

create sequence refdata_platformparamstodataa_platformparamstodataattribute_seq;
CREATE TABLE refdata_platformparamstodataattributes (
                                                        platformparamstodataattributeid integer DEFAULT nextval('refdata_platformparamstodataa_platformparamstodataattribute_seq'::regclass) NOT NULL,
                                                        platformparamsid integer,
                                                        dataattributeid integer,
                                                        createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                                        statusid integer DEFAULT 1,
                                                        registeredapp varchar(38) DEFAULT 'NULL'::character varying,
                                                        PRIMARY KEY (platformparamstodataattributeid)
);

CREATE TABLE refdata_sensitivityflag (
                                         sensitiveflagid serial NOT NULL,
                                         sensitiveflagdesc varchar(30) DEFAULT 'NULL'::character varying,
                                         createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                         statusid integer DEFAULT 1,
                                         PRIMARY KEY (sensitiveflagid)
);

CREATE TABLE refdata_status (
                                statusid serial NOT NULL,
                                statusdescription varchar(45) NOT NULL,
                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                PRIMARY KEY (statusid)
);

CREATE TABLE refdata_terminologystd (
                                        terminologystdid integer NOT NULL,
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
                                vendorid serial NOT NULL,
                                vendorname varchar(50) DEFAULT 'NULL'::character varying,
                                createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                statusid integer DEFAULT 1,
                                createduser varchar(20) DEFAULT 'NULL'::character varying,
                                vendorguid char(38) DEFAULT 'NULL'::bpchar,
                                PRIMARY KEY (vendorid)
);

CREATE TABLE terms_codeset_industrystd (
                                           termcodesetid integer NOT NULL,
                                           codesetsid bigint NOT NULL,
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



ALTER TABLE datastructure_address
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_address
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_bankaccount
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_bankaccount
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_corporations
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_corporations
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_names
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_names
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_persondemographics
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_persondemographics
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_phonenumbers
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_phonenumbers
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datastructure_phonenumbers
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_phonenumbersintl
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_phonenumbersintl
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);

ALTER TABLE datastructure_phonenumbersintl
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE datastructure_products
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE datastructure_products
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



ALTER TABLE impl_devices
    ADD FOREIGN KEY (application)
        REFERENCES impl_application (appguid);

ALTER TABLE impl_devices
    ADD FOREIGN KEY (organization)
        REFERENCES impl_organization (organizationguid);

ALTER TABLE impl_devices
    ADD FOREIGN KEY (devicetypeid)
        REFERENCES refdata_devicetypes (devicetypeid);

ALTER TABLE impl_devices
    ADD FOREIGN KEY (industryid)
        REFERENCES refdata_industries (industryid);

ALTER TABLE impl_devices
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



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



ALTER TABLE platform_config_dataattributes_generator
    ADD FOREIGN KEY (applicationid)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_config_dataattributes_generator
    ADD FOREIGN KEY (dataattributeid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_config_dataattributes_generator
    ADD FOREIGN KEY (datagentypeid)
        REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE platform_config_dataattributes_generator
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



ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_datastructures
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE platform_datastructurestodataattributes
    ADD FOREIGN KEY (registeredapp)
        REFERENCES impl_application (appguid);

ALTER TABLE platform_datastructurestodataattributes
    ADD FOREIGN KEY (platformdataattributesid)
        REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_datastructurestodataattributes
    ADD FOREIGN KEY (platformdatastructuresid)
        REFERENCES platform_datastructures (platformdatastructuresid);

ALTER TABLE platform_datastructurestodataattributes
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE platform_datastructurestodataattributes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



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



ALTER TABLE refdata_industrystd_datatypes
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_industrystd_datatypes
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE refdata_industrystd_fields
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_industrystd_fields
    ADD FOREIGN KEY (sensitivityflagid)
        REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE refdata_industrystd_fields
    ADD FOREIGN KEY (statusid)
        REFERENCES refdata_status (statusid);



ALTER TABLE refdata_industrystd_segments
    ADD FOREIGN KEY (industrystd)
        REFERENCES refdata_industrystd (industrystd);

ALTER TABLE refdata_industrystd_segments
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



CREATE UNIQUE INDEX dataexisting_ababanking_pkey ON public.dataexisting_ababanking USING btree (ababankingid);

CREATE UNIQUE INDEX dataexisting_areacode_pkey ON public.dataexisting_areacode USING btree (areacodeid);

CREATE UNIQUE INDEX dataexisting_areacodeintl_pkey ON public.dataexisting_areacodeintl USING btree (iddcode);

CREATE UNIQUE INDEX dataexisting_companies_pkey ON public.dataexisting_companies USING btree (companiesid);

CREATE INDEX dataexisting_namefirst_idx ON public.dataexisting_namefirst USING btree (firstnameid, firstname, gender, statusid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_namefirst_pkey ON public.dataexisting_namefirst USING btree (firstnameid);

CREATE UNIQUE INDEX dataexisting_namefirst_uindex ON public.dataexisting_namefirst USING btree (firstname, gender, registeredapp);

CREATE INDEX dataexisting_namelast_index ON public.dataexisting_namelast USING btree (lastnameid, lastname, statusid, createddate, createduser, registeredapp);

CREATE UNIQUE INDEX dataexisting_namelast_pkey ON public.dataexisting_namelast USING btree (lastnameid);

CREATE UNIQUE INDEX dataexisting_namelast_uindex ON public.dataexisting_namelast USING btree (lastname, registeredapp);

CREATE UNIQUE INDEX dataexisting_upccodes_pkey ON public.dataexisting_upccodes USING btree (upccodeid);

CREATE UNIQUE INDEX dataexisting_zipcodeintl_pkey ON public.dataexisting_zipcodeintl USING btree (zipcodeintnlid);

CREATE UNIQUE INDEX dataexisting_zipcodeus_pkey ON public.dataexisting_zipcodeus USING btree (zipcodeid);

CREATE INDEX datagenerated_accountnumbers_index ON public.datagenerated_accountnumbers USING btree (accountnumbersid, accountnumbervalue, createddate, createduser, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_accountnumbers_pkey ON public.datagenerated_accountnumbers USING btree (accountnumbersid);

CREATE UNIQUE INDEX datagenerated_accountnumbers_uindex ON public.datagenerated_accountnumbers USING btree (accountnumbervalue, registeredapp, datagentypeid);

CREATE INDEX datagenerated_addresses_index ON public.datagenerated_addresses USING btree (addressid, addressstreet, addressstreet2, createddate, createduser, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_addresses_pkey ON public.datagenerated_addresses USING btree (addressid);

CREATE UNIQUE INDEX datagenerated_addresses_uindex ON public.datagenerated_addresses USING btree (addressstreet, addressstreet2, registeredapp, datagentypeid);

CREATE INDEX datagenerated_bankaccount_index ON public.datagenerated_bankaccount USING btree (bankaccountsid, bankaccountvalue, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_bankaccount_pkey ON public.datagenerated_bankaccount USING btree (bankaccountsid);

CREATE UNIQUE INDEX datagenerated_bankaccount_uindex ON public.datagenerated_bankaccount USING btree (bankaccountvalue, registeredapp, datagentypeid);

CREATE INDEX datagenerated_creditcard_index ON public.datagenerated_creditcard USING btree (creditcardid, creditcardnumber, creditcardname, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_creditcard_pkey ON public.datagenerated_creditcard USING btree (creditcardid);

CREATE UNIQUE INDEX datagenerated_creditcard_uindex ON public.datagenerated_creditcard USING btree (creditcardnumber, creditcardname, registeredapp, datagentypeid);

CREATE INDEX datagenerated_custom_index ON public.datagenerated_custom USING btree (customidentifier, customidentifierdesc, createddate, statusid, createduser, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_custom_pkey ON public.datagenerated_custom USING btree (datagencustomdid);

CREATE UNIQUE INDEX datagenerated_custom_uindex ON public.datagenerated_custom USING btree (customidentifier, customidentifierdesc, registeredapp, datagentypeid);

CREATE INDEX datagenerated_dateofbirth_index ON public.datagenerated_dateofbirth USING btree (dateofbirthsid, dateofbirth, age, dateofbirthdate, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_dateofbirth_pkey ON public.datagenerated_dateofbirth USING btree (dateofbirthsid);

CREATE UNIQUE INDEX datagenerated_dateofbirth_uindex ON public.datagenerated_dateofbirth USING btree (dateofbirthdate, dateofbirth, dateofbirthdate, registeredapp);

CREATE INDEX datagenerated_driverslicenses_index ON public.datagenerated_driverslicenses USING btree (driverslicensesid, dln, statecode, createddate, statusid, datagentypeid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_driverslicenses_pkey ON public.datagenerated_driverslicenses USING btree (driverslicensesid);

CREATE UNIQUE INDEX datagenerated_driverslicenses_uindex ON public.datagenerated_driverslicenses USING btree (dln, statecode, datagentypeid, registeredapp);

CREATE INDEX datagenerated_ein_index ON public.datagenerated_ein USING btree (einid, einvalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_ein_pkey ON public.datagenerated_ein USING btree (einid);

CREATE UNIQUE INDEX datagenerated_ein_uindex ON public.datagenerated_ein USING btree (einvalue, registeredapp);

CREATE INDEX datagenerated_phonenumber_index ON public.datagenerated_phonenumber USING btree (phonenumberid, phonenumbervalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_phonenumber_pkey ON public.datagenerated_phonenumber USING btree (phonenumberid);

CREATE UNIQUE INDEX datagenerated_phonenumber_uindex ON public.datagenerated_phonenumber USING btree (phonenumbervalue, registeredapp);

CREATE INDEX datagenerated_phonenumbersintl_index ON public.datagenerated_phonenumbersintl USING btree (phonenumberintlid, phonenumbervalue, createddate, statusid, countryid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_phonenumbersintl_pkey ON public.datagenerated_phonenumbersintl USING btree (phonenumberintlid);

CREATE UNIQUE INDEX datagenerated_phonenumbersintl_uindex ON public.datagenerated_phonenumbersintl USING btree (phonenumbervalue, countryid, registeredapp);

CREATE UNIQUE INDEX datagenerated_serialnumbers_pkey ON public.datagenerated_serialnumbers USING btree (serialnumberid);

CREATE INDEX datagenerated_socialsecuritynumber_index ON public.datagenerated_socialsecuritynumber USING btree (socialsecuritynumberid, socialsecuritynumbervalue, createddate, statusid, createduser, registeredapp);

CREATE UNIQUE INDEX datagenerated_socialsecuritynumber_pkey ON public.datagenerated_socialsecuritynumber USING btree (socialsecuritynumberid);

CREATE UNIQUE INDEX datagenerated_socialsecuritynumber_uindex ON public.datagenerated_socialsecuritynumber USING btree (socialsecuritynumbervalue, registeredapp);

CREATE INDEX datagenerated_useridentities_index ON public.datagenerated_useridentities USING btree (useridentitiesid, useridentityvalue, userdomain, additionalattributes, createddate, statusid, registeredapp, datagentypeid);

CREATE UNIQUE INDEX datagenerated_useridentities_pkey ON public.datagenerated_useridentities USING btree (useridentitiesid);

CREATE UNIQUE INDEX datagenerated_useridentities_uindex ON public.datagenerated_useridentities USING btree (useridentityvalue, userdomain, additionalattributes, registeredapp);

CREATE UNIQUE INDEX datamodel_apis_pk ON public.datamodel_apis USING btree (datamodelapiid);

CREATE UNIQUE INDEX datamodel_datatables_pkey ON public.datamodel_datatables USING btree (tablename);

CREATE UNIQUE INDEX datamodel_domain_pkey ON public.datamodel_domain USING btree (domainname);

CREATE UNIQUE INDEX datastructure_address_pkey ON public.datastructure_address USING btree (completeaddressid);

CREATE UNIQUE INDEX datastructure_bankaccount_pkey ON public.datastructure_bankaccount USING btree (databuiltbankaccountsid);

CREATE UNIQUE INDEX datastructure_corporations_pkey ON public.datastructure_corporations USING btree (databuiltcorporationid);

CREATE UNIQUE INDEX datastructure_names_pkey ON public.datastructure_names USING btree (databuiltnamesid);

CREATE UNIQUE INDEX datastructure_persondemographics_pkey ON public.datastructure_persondemographics USING btree (persondemographicsid);

CREATE UNIQUE INDEX datastructure_phonenumbers_pkey ON public.datastructure_phonenumbers USING btree (databuiltphonenumbersid);

CREATE UNIQUE INDEX datastructure_phonenumbersintl_pkey ON public.datastructure_phonenumbersintl USING btree (databuiltphonenumbersintlid);

CREATE UNIQUE INDEX datastructure_products_pkey ON public.datastructure_products USING btree (databuiltproductsid);

CREATE UNIQUE INDEX impl_application_pkey ON public.impl_application USING btree (appguid);

CREATE UNIQUE INDEX impl_codesets_pkey ON public.impl_codesets USING btree (implcodesetid);

CREATE UNIQUE INDEX impl_codesetscrossmaps_pkey ON public.impl_codesets_crossmaps USING btree (codesetcrossmapid);

CREATE UNIQUE INDEX impl_legalentities_pkey ON public.impl_legalentities USING btree (legalentityguid);

CREATE UNIQUE INDEX impl_organization_pkey ON public.impl_organization USING btree (organizationguid);

CREATE UNIQUE INDEX impl_rulesets_pkey ON public.impl_rulesets USING btree (ruleid);

CREATE UNIQUE INDEX impl_rulesetsdefinitions_pkey ON public.impl_rulesetsdefinitions USING btree (rulesetdefinitionsid);

CREATE UNIQUE INDEX platform_appsettings_general_pkey ON public.platform_appsettings_general USING btree (appsettingsid);

CREATE UNIQUE INDEX platform_config_datagen_pkey ON public.platform_config_dataattributes_generator USING btree (datagenconfigid);

CREATE UNIQUE INDEX platform_dataattributes_pkey ON public.platform_dataattributes USING btree (platformdataattributesid);

CREATE UNIQUE INDEX platform_datastructures_pkey ON public.platform_datastructures USING btree (platformdatastructuresid);

CREATE UNIQUE INDEX platform_datastructurestodataattributes_pkey ON public.platform_datastructurestodataattributes USING btree (platformdatastructurestodataattributesid);

CREATE UNIQUE INDEX refdata_codeset_pkey ON public.refdata_codeset USING btree (codesetsid);

CREATE UNIQUE INDEX refdata_countries_pkey ON public.refdata_countries USING btree (countryid);

CREATE UNIQUE INDEX refdata_datagentypes_pkey ON public.refdata_datagentypes USING btree (datagentypeid);

CREATE UNIQUE INDEX refdata_devices_devicesid_uindex ON public.impl_devices USING btree (devicesid);

CREATE UNIQUE INDEX refdata_devices_pk ON public.impl_devices USING btree (devicesid);

CREATE UNIQUE INDEX refdata_devicetypes_pk ON public.refdata_devicetypes USING btree (devicetypeid);

CREATE UNIQUE INDEX refdata_industries_pk ON public.refdata_industries USING btree (industryid);

CREATE UNIQUE INDEX refdata_industriestobusiness_industrytobusinessid_uindex ON public.refdata_industriestobusiness USING btree (industrytobusinessid);

CREATE UNIQUE INDEX refdata_industriestobusiness_pk ON public.refdata_industriestobusiness USING btree (industrytobusinessid);

CREATE UNIQUE INDEX refdata_industrystd_datatypes_pkey ON public.refdata_industrystd_datatypes USING btree (datatypestoindustryid);

CREATE UNIQUE INDEX refdata_industrystd_fields_pkey ON public.refdata_industrystd_fields USING btree (fieldstoindustryid);

CREATE UNIQUE INDEX refdata_industrystd_pkey ON public.refdata_industrystd USING btree (industrystd);

CREATE UNIQUE INDEX refdata_industrystd_segments_pkey ON public.refdata_industrystd_segments USING btree (segmenttoindustryid);

CREATE UNIQUE INDEX refdata_operationtype_pkey ON public.refdata_operationtype USING btree (operationtypeid);

CREATE UNIQUE INDEX refdata_platformparams_pkey ON public.refdata_platformparams USING btree (platformparamsid);

CREATE UNIQUE INDEX refdata_platformparamstodataattributes_pkey ON public.refdata_platformparamstodataattributes USING btree (platformparamstodataattributeid);

CREATE UNIQUE INDEX refdata_sensitivityflag_pkey ON public.refdata_sensitivityflag USING btree (sensitiveflagid);

CREATE UNIQUE INDEX refdata_status_pkey ON public.refdata_status USING btree (statusid);

CREATE UNIQUE INDEX refdata_terminologystd_pkey ON public.refdata_terminologystd USING btree (terminologystdid);

CREATE UNIQUE INDEX refdata_timezones_pkey ON public.refdata_timezones USING btree (timezonevalue);

CREATE UNIQUE INDEX refdata_usstates_pkey ON public.refdata_usstates USING btree (stateid);

CREATE UNIQUE INDEX refdata_vendor_pkey ON public.refdata_vendor USING btree (vendorid);

CREATE INDEX terms_codeset_industrystd_index ON public.terms_codeset_industrystd USING btree (termcodesetid, codesetsid, createddate, statusid, codevalue, codedesc, industrystd);

CREATE UNIQUE INDEX terms_codeset_industrystd_pkey ON public.terms_codeset_industrystd USING btree (termcodesetid);

CREATE UNIQUE INDEX terms_codeset_industrystd_uindex ON public.terms_codeset_industrystd USING btree (codesetsid, codevalue, codedesc, industrystd);

CREATE INDEX terms_umls_mrconoso_index ON public.terms_umls_mrconoso USING btree (cui, lat, ts, lui, stt, sui, ispref, aui, saui, scui, sdui, sab, tty, code, str, srl, suppress, cvf);

CREATE OR REPLACE FUNCTION public.armor(bytea)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_armor$function$
;

CREATE OR REPLACE FUNCTION public.armor(bytea, text[], text[])
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_armor$function$
;

CREATE OR REPLACE FUNCTION public.crypt(text, text)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_crypt$function$
;

CREATE OR REPLACE FUNCTION public.dearmor(text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_dearmor$function$
;

CREATE OR REPLACE FUNCTION public.decrypt(bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_decrypt$function$
;

CREATE OR REPLACE FUNCTION public.decrypt_iv(bytea, bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_decrypt_iv$function$
;

CREATE OR REPLACE FUNCTION public.digest(text, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_digest$function$
;

CREATE OR REPLACE FUNCTION public.digest(bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_digest$function$
;

CREATE OR REPLACE FUNCTION public.encrypt(bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_encrypt$function$
;

CREATE OR REPLACE FUNCTION public.encrypt_iv(bytea, bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_encrypt_iv$function$
;

CREATE OR REPLACE FUNCTION public.gen_random_bytes(integer)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_random_bytes$function$
;

CREATE OR REPLACE FUNCTION public.gen_random_uuid()
    RETURNS uuid
    LANGUAGE c
    PARALLEL SAFE
AS '$libdir/pgcrypto', $function$pg_random_uuid$function$
;

CREATE OR REPLACE FUNCTION public.gen_salt(text)
    RETURNS text
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_gen_salt$function$
;

CREATE OR REPLACE FUNCTION public.gen_salt(text, integer)
    RETURNS text
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_gen_salt_rounds$function$
;

CREATE OR REPLACE FUNCTION public.hmac(text, text, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_hmac$function$
;

CREATE OR REPLACE FUNCTION public.hmac(bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pg_hmac$function$
;

CREATE OR REPLACE FUNCTION public.pgp_armor_headers(text, OUT key text, OUT value text)
    RETURNS SETOF record
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_armor_headers$function$
;

CREATE OR REPLACE FUNCTION public.pgp_key_id(bytea)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_key_id_w$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt(bytea, bytea)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt(bytea, bytea, text)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt(bytea, bytea, text, text)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_decrypt_bytea(bytea, bytea, text, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_decrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt(text, bytea)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt(text, bytea, text)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_pub_encrypt_bytea(bytea, bytea, text)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_pub_encrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt(bytea, text)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt(bytea, text, text)
    RETURNS text
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt_bytea(bytea, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_decrypt_bytea(bytea, text, text)
    RETURNS bytea
    LANGUAGE c
    IMMUTABLE PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_decrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt(text, text)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt(text, text, text)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_text$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt_bytea(bytea, text)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_bytea$function$
;

CREATE OR REPLACE FUNCTION public.pgp_sym_encrypt_bytea(bytea, text, text)
    RETURNS bytea
    LANGUAGE c
    PARALLEL SAFE STRICT
AS '$libdir/pgcrypto', $function$pgp_sym_encrypt_bytea$function$
;

