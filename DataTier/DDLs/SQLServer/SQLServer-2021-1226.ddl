CREATE TABLE auditing_dataplatform (
	dataplatformid int NOT NULL,
	dataprocessingdate datetime,
	createdbyuser varchar(20),
	organizaton varchar(38),
	application varchar(38),
	statusid int,
	createddate datetime,
	reccount int,
	component varchar(20),
	actionname varchar(20),
	durationtorun int,
	activitydetail varchar(75),
	PRIMARY KEY (dataplatformid)
);
CREATE TABLE auditing_datarequest (
	datarequestid int NOT NULL,
	datarequestdate datetime,
	createdbyuser varchar(20),
	organizaton varchar(38),
	application varchar(38),
	statusid int,
	createddate datetime,
	reccount int,
	recorddatarequest varchar(400),
	PRIMARY KEY (datarequestid)
);
CREATE TABLE dataexisting_ababanking (
	ababankingid int NOT NULL,
	routingnumber varchar(9),
	telegraphicname varchar(20),
	customername varchar(36),
	city varchar(20),
	statecode varchar(2),
	zipcode varchar(5),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (ababankingid)
);
CREATE TABLE dataexisting_areacode (
	areacodeid int NOT NULL,
	areacodevalue varchar(3) NOT NULL,
	timezone varchar(3),
	statecode varchar(2),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (areacodeid)
);
CREATE TABLE dataexisting_areacodeintl (
	iddcode varchar(5) NOT NULL,
	countryid int,
	createddate datetime,
	statusid int,
	registeredapp char(38),
	PRIMARY KEY (iddcode)
);
CREATE TABLE dataexisting_companies (
	companiesid int NOT NULL,
	companyname varchar(79),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (companiesid)
);
CREATE TABLE dataexisting_namefirst (
	firstnameid int NOT NULL,
	firstname varchar(39),
	gender varchar(1),
	statusid int,
	createddate datetime,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (firstnameid)
);
CREATE TABLE dataexisting_namelast (
	lastnameid int NOT NULL,
	lastname varchar(69),
	statusid int NOT NULL,
	createddate datetime,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (lastnameid)
);
CREATE TABLE dataexisting_upccodes (
	upccodeid int NOT NULL,
	upccodename varchar(15),
	upcproductname varchar(150),
	createddate datetime,
	statusid int,
	registeredapp char(38),
	PRIMARY KEY (upccodeid)
);
CREATE TABLE dataexisting_zipcodeintl (
	zipcodeintnlid int NOT NULL,
	zipcode char(10) NOT NULL,
	zipcodetype varchar(15),
	city varchar(75),
	country int,
	lattitude varchar(10),
	longitude varchar(10),
	Location varchar(99),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (zipcodeintnlid)
);
CREATE TABLE dataexisting_zipcodeus (
	zipcodeid int NOT NULL,
	zipcode char(5) NOT NULL,
	zipcodetype varchar(15),
	city varchar(75),
	statecode varchar(2),
	lattitude varchar(10),
	longitude varchar(10),
	lctn varchar(99),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (zipcodeid)
);
CREATE TABLE datagenerated_accountnumbers (
	accountnumbersid int NOT NULL,
	accountnumbervalue varchar(20),
	createddate datetime,
	createduser varchar(20),
	statusid int,
	registeredapp char(38),
	datagentypeid int,
	PRIMARY KEY (accountnumbersid)
);
CREATE TABLE datagenerated_addresses (
	addressid int NOT NULL,
	addressstreet varchar(99),
	addressstreet2 varchar(59),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	datagentypeid int,
	PRIMARY KEY (addressid)
);
CREATE TABLE datagenerated_bankaccount (
	bankaccountsid int NOT NULL,
	bankaccountvalue varchar(17),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	datagentypeid int,
	PRIMARY KEY (bankaccountsid)
);
CREATE TABLE datagenerated_creditcard (
	creditcardid int NOT NULL,
	creditcardnumber varchar(20),
	creditcardname varchar(20),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	datagentypeid int,
	PRIMARY KEY (creditcardid)
);
CREATE TABLE datagenerated_dateofbirth (
	dateofbirthsid int NOT NULL,
	dateofbirth varchar(12),
	dateofbirthdate date,
	age int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (dateofbirthsid)
);
CREATE TABLE datagenerated_driverslicenses (
	driverslicensesid int NOT NULL,
	dln varchar(25),
	statecode varchar(2),
	createddate datetime,
	statusid int,
	datagentypeid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (driverslicensesid)
);
CREATE TABLE datagenerated_ein (
	einid int NOT NULL,
	einvalue varchar(10),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (einid)
);
CREATE TABLE datagenerated_phonenumber (
	phonenumberid int NOT NULL,
	phonenumbervalue varchar(8),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (phonenumberid)
);
CREATE TABLE datagenerated_phonenumbersintl (
	phonenumberintlid int NOT NULL,
	phonenumbervalue varchar(12),
	createddate datetime,
	statusid int,
	countryid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (phonenumberintlid)
);
CREATE TABLE datagenerated_socialsecuritynumber (
	socialsecuritynumberid int NOT NULL,
	socialsecuritynumbervalue varchar(11),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	registeredapp char(38),
	PRIMARY KEY (socialsecuritynumberid)
);
CREATE TABLE datagenerated_useridentities (
	useridentitiesid int NOT NULL,
	useridentityvalue varchar(20),
	userdomain varchar(20),
	additionalattributes varchar(40),
	createddate datetime,
	statusid int,
	registeredapp char(38),
	datagentypeid int,
	PRIMARY KEY (useridentitiesid)
);
CREATE TABLE datamodel_datatables (
	tablename varchar(64) NOT NULL,
	tableinformation varchar(249),
	statusid int,
	createddate datetime,
	PRIMARY KEY (tablename)
);
CREATE TABLE datamodel_domain (
	domainname varchar(64) NOT NULL,
	domaininformation varchar(249),
	statusid int,
	createddate datetime,
	PRIMARY KEY (domainname)
);
CREATE TABLE datastructure_address (
	completeaddressid int NOT NULL,
	address1 varchar(99),
	city varchar(70),
	stateid varchar(2),
	zipcode varchar(10),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (completeaddressid)
);
CREATE TABLE datastructure_bankaccount (
	databuiltbankaccountsid int NOT NULL,
	bankaccountnumber varchar(12),
	bankaccountname varchar(75),
	bankroutingid varchar(9),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (databuiltbankaccountsid)
);
CREATE TABLE datastructure_corporations (
	databuiltcorporationid int NOT NULL,
	corporationname varchar(99),
	address1 varchar(99),
	city varchar(70),
	stateid varchar(2),
	zipcode varchar(10),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (databuiltcorporationid)
);
CREATE TABLE datastructure_names (
	databuiltnamesid int NOT NULL,
	completename varchar(100),
	gender varchar(1),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (databuiltnamesid)
);
CREATE TABLE datastructure_persondemographics (
	persondemographicsid int NOT NULL,
	dln varchar(25),
	dlnstate varchar(2),
	ssn varchar(11),
	dobvalue varchar(12),
	dobdate date,
	age int,
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (persondemographicsid)
);
CREATE TABLE datastructure_phonenumbers (
	databuiltphonenumbersid int NOT NULL,
	areacode varchar(3),
	phonenumber varchar(8),
	completephonenumber varchar(14),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (databuiltphonenumbersid)
);
CREATE TABLE datastructure_phonenumbersintl (
	databuiltphonenumbersintlid int NOT NULL,
	areacode varchar(3),
	phonenumber varchar(8),
	completephonenumber varchar(14),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (databuiltphonenumbersintlid)
);
CREATE TABLE datastructure_products (
	databuiltproductsid int NOT NULL,
	productid varchar(20),
	productname varchar(99),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (databuiltproductsid)
);
CREATE TABLE impl_application (
	appguid char(38) NOT NULL,
	applicationcustomcode varchar(15),
	applicationdesc varchar(50),
	createduser varchar(20),
	createddate datetime,
	statusid int,
	vendorid int,
	PRIMARY KEY (appguid)
);
CREATE TABLE impl_codesets (
	implcodesetid int NOT NULL,
	codesetsid bigint NOT NULL,
	createddate datetime,
	statusid int,
	organizationid varchar(38),
	applicationid varchar(38),
	industrystd varchar(6),
	fieldmapping varchar(40),
	sensitivityflagid int,
	externaltableid varchar(20),
	externalnotes varchar(149),
	externallink varchar(99),
	PRIMARY KEY (implcodesetid)
);
CREATE TABLE impl_codesetscrossmaps (
	codesetcrossmapid int NOT NULL,
	codesetsid bigint NOT NULL,
	codesettoapplicationid bigint,
	terminologystdto int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	transformcodevalue varchar(40),
	transformcodedesc varchar(129),
	PRIMARY KEY (codesetcrossmapid)
);
CREATE TABLE impl_codesetstoapplication (
	codesettoapplicationid int NOT NULL,
	codesetsid bigint NOT NULL,
	createddate datetime,
	statusid int,
	organizationid varchar(38),
	applicationid varchar(38),
	codevalue varchar(20),
	codedesc varchar(129),
	formalname varchar(45),
	address varchar(45),
	citystatezip varchar(99),
	phonenumber varchar(20),
	otherfield1 varchar(49),
	otherfield2 varchar(49),
	termlow varchar(25),
	termhigh varchar(25),
	PRIMARY KEY (codesettoapplicationid)
);
CREATE TABLE impl_codesetstomsgtype (
	codesettomsgtypeid int NOT NULL,
	codesetsid bigint,
	msgtype varchar(75),
	statusid int,
	createddate datetime,
	createduser varchar(20),
	appguid char(38),
	orgguid char(38),
	PRIMARY KEY (codesettomsgtypeid)
);
CREATE TABLE impl_legalentities (
	legalentityguid char(38) NOT NULL,
	locationname varchar(50),
	address varchar(75),
	city varchar(60),
	stateid varchar(2),
	zipcode varchar(12),
	createduser varchar(20),
	statusid int,
	createddate datetime NOT NULL,
	locationurl varchar(99),
	locationphone varchar(12),
	PRIMARY KEY (legalentityguid)
);
CREATE TABLE impl_organization (
	organizationguid char(38) NOT NULL,
	organizationinternalcode varchar(10),
	organizationinternalid varchar(10),
	organizationname varchar(50),
	address varchar(75),
	city varchar(60),
	stateid varchar(2),
	zipcode varchar(12),
	createduser varchar(20),
	statusid int,
	createddate datetime NOT NULL,
	legalentityguid varchar(38),
	PRIMARY KEY (organizationguid)
);
CREATE TABLE impl_rulesets (
	ruleid int NOT NULL,
	rulename varchar(65),
	createduser varchar(20),
	createddate datetime,
	statusid int,
	expirationdate datetime,
	PRIMARY KEY (ruleid)
);
CREATE TABLE impl_rulesetsdefinitions (
	rulesetdefinitionsid char(38) NOT NULL,
	rulesetdefinitionname varchar(50),
	rulesetid bigint,
	steporderid int,
	operationtypeid varchar(7),
	rulesetdefvalue char(40),
	statusid int,
	createddate datetime,
	effectivedate datetime,
	applicationid varchar(38),
	termdate datetime,
	dataattributeid int,
	PRIMARY KEY (rulesetdefinitionsid)
);
CREATE TABLE platform_appsettings_general (
	appsettingsid int NOT NULL,
	appsettingname varchar(50),
	appsettingvalue varchar(199),
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	defaultdatagenerationapp varchar(38),
	PRIMARY KEY (appsettingsid)
);
CREATE TABLE platform_config_datagen (
	datagenconfigid int NOT NULL,
	datatypegenconfigname varchar(25),
	dataattributeid int,
	runquantity int,
	minuteinterval int,
	datagentypeid int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	applicationid char(38),
	PRIMARY KEY (datagenconfigid)
);
CREATE TABLE platform_dataattributes (
	platformdataattributesid int NOT NULL,
	dataattributename varchar(50),
	sensitivityflagid int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	platformdataattributeguid char(38),
	registeredapp char(38),
	PRIMARY KEY (platformdataattributesid)
);
CREATE TABLE platform_datastructures (
	platformdatastructuresid int NOT NULL,
	datastructurename varchar(50),
	sensitivityflagid int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	platformdatastructuresguid char(38),
	registeredapp varchar(38),
	PRIMARY KEY (platformdatastructuresid)
);
CREATE TABLE platform_datastructurestodataattributes (
	platformdatastructurestodataattributesid int NOT NULL,
	platformdatastructuresid int,
	compositedatastructurename varchar(50),
	sensitivityflagid int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	platformdatastructurestodataattributesguid char(38),
	registeredapp char(38),
	platformdataattributesid int,
	PRIMARY KEY (platformdatastructurestodataattributesid)
);
CREATE TABLE refdata_codeset (
	codesetsid int NOT NULL,
	codesetname varchar(50),
	industrystd varchar(6),
	statusid int,
	createddate datetime,
	createduser varchar(20),
	codesetguid char(38),
	fieldmapping varchar(40),
	sensitivityflagid int,
	externaltableid varchar(20),
	externalnotes varchar(149),
	externallink varchar(99),
	PRIMARY KEY (codesetsid)
);
CREATE TABLE refdata_countries (
	countryid int NOT NULL,
	idd varchar(5),
	countryname varchar(59),
	createddate datetime,
	statusid int,
	PRIMARY KEY (countryid)
);
CREATE TABLE refdata_datagentypes (
	datagentypeid int NOT NULL,
	datagentypedescription varchar(65),
	definition varchar(255),
	dataattributeid int,
	createddate datetime,
	statusid int,
	createduser varchar(20),
	PRIMARY KEY (datagentypeid)
);
CREATE TABLE refdata_industrystd (
	industrystd varchar(6) NOT NULL,
	industrystddesc varchar(30),
	createddate datetime,
	statusid int,
	PRIMARY KEY (industrystd)
);
CREATE TABLE refdata_industrystd_datatypes (
	datatypestoindustryid int NOT NULL,
	industrystd varchar(6) NOT NULL,
	datatypename varchar(10),
	datatypenamedesc varchar(75),
	datatypesubfields varchar(249),
	createddate datetime,
	statusid int,
	PRIMARY KEY (datatypestoindustryid)
);
CREATE TABLE refdata_industrystd_fields (
	fieldstoindustryid int NOT NULL,
	messagefieldnumber varchar(14),
	messagefieldname varchar(154),
	fieldlength varchar(10),
	datatype varchar(7),
	messagesegment varchar(3),
	segmentfieldorder varchar(8),
	vrsn varchar(7),
	industrystd varchar(7),
	sensitivityflagid int,
	createddate datetime,
	statusid int,
	PRIMARY KEY (fieldstoindustryid)
);
CREATE TABLE refdata_industrystd_segments (
	segmenttoindustryid int NOT NULL,
	industrystd varchar(6) NOT NULL,
	industrystddesc varchar(30),
	createddate datetime,
	statusid int,
	segmentname varchar(10),
	segmentnamedesc varchar(129),
	PRIMARY KEY (segmenttoindustryid)
);
CREATE TABLE refdata_operationtype (
	operationtypeid varchar(7) NOT NULL,
	operationtypename varchar(60),
	createddate datetime,
	statusid int,
	PRIMARY KEY (operationtypeid)
);
CREATE TABLE refdata_platformparams (
	platformparamsid int NOT NULL,
	platformparamvalues varchar(35),
	platformparamdesc varchar(70),
	createddate datetime,
	statusid int,
	PRIMARY KEY (platformparamsid)
);
CREATE TABLE refdata_platformparamstodataattributes (
	platformparamstodataattributeid int NOT NULL,
	platformparamsid int,
	dataattributeid int,
	createddate datetime,
	statusid int,
	registeredapp varchar(38),
	PRIMARY KEY (platformparamstodataattributeid)
);
CREATE TABLE refdata_sensitivityflag (
	sensitiveflagid int NOT NULL,
	sensitiveflagdesc varchar(30),
	createddate datetime,
	statusid int,
	PRIMARY KEY (sensitiveflagid)
);
CREATE TABLE refdata_status (
	statusid int NOT NULL,
	statusdescription varchar(45) NOT NULL,
	createddate datetime,
	createduser varchar(20),
	PRIMARY KEY (statusid)
);
CREATE TABLE refdata_terminologystd (
	terminologystdid int NOT NULL,
	terminologystd varchar(25) NOT NULL,
	terminologystdversion varchar(10) NOT NULL,
	terminologystddesc varchar(129),
	createddate datetime,
	statusid int,
	PRIMARY KEY (terminologystdid)
);
CREATE TABLE refdata_timezones (
	timezonevalue varchar(3) NOT NULL,
	timezonedesc varchar(25),
	createddate datetime,
	statusid int,
	PRIMARY KEY (timezonevalue)
);
CREATE TABLE refdata_usstates (
	stateid varchar(2) NOT NULL,
	statedescription varchar(65),
	lattitude varchar(12),
	longitude varchar(12),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	PRIMARY KEY (stateid)
);
CREATE TABLE refdata_vendor (
	vendorid int NOT NULL,
	vendorname varchar(50),
	createddate datetime,
	statusid int,
	createduser varchar(20),
	vendorguid char(38),
	PRIMARY KEY (vendorid)
);
CREATE TABLE terms_codeset_hl7v2 (
	termcodesetid int NOT NULL,
	codesetsid bigint NOT NULL,
	createddate datetime,
	statusid int,
	codevalue varchar(20),
	codedesc varchar(129),
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
	saui varchar(50),
	scui varchar(100),
	sdui varchar(100),
	sab varchar(20) NOT NULL,
	tty varchar(20) NOT NULL,
	code varchar(100) NOT NULL,
	str varchar(3000) NOT NULL,
	srl varchar(25) NOT NULL,
	suppress char(1) NOT NULL,
	cvf varchar(25)
);
ALTER TABLE auditing_dataplatform
	ADD FOREIGN KEY (statusid) 
	REFERENCES refdata_status (statusid);


ALTER TABLE auditing_datarequest
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
	ADD FOREIGN KEY (sensitivityflagid) 
	REFERENCES refdata_sensitivityflag (sensitiveflagid);

ALTER TABLE impl_codesets
	ADD FOREIGN KEY (statusid) 
	REFERENCES refdata_status (statusid);


ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (codesettoapplicationid) 
	REFERENCES impl_codesetstoapplication (codesettoapplicationid);

ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (codesetsid) 
	REFERENCES refdata_codeset (codesetsid);

ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (statusid) 
	REFERENCES refdata_status (statusid);

ALTER TABLE impl_codesetscrossmaps
	ADD FOREIGN KEY (terminologystdto) 
	REFERENCES refdata_terminologystd (terminologystdid);


ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (applicationid) 
	REFERENCES impl_application (appguid);

ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (organizationid) 
	REFERENCES impl_organization (organizationguid);

ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (codesetsid) 
	REFERENCES refdata_codeset (codesetsid);

ALTER TABLE impl_codesetstoapplication
	ADD FOREIGN KEY (statusid) 
	REFERENCES refdata_status (statusid);


ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (appguid) 
	REFERENCES impl_application (appguid);

ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (orgguid) 
	REFERENCES impl_organization (organizationguid);

ALTER TABLE impl_codesetstomsgtype
	ADD FOREIGN KEY (codesetsid) 
	REFERENCES refdata_codeset (codesetsid);

ALTER TABLE impl_codesetstomsgtype
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


ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (applicationid) 
	REFERENCES impl_application (appguid);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (dataattributeid) 
	REFERENCES platform_dataattributes (platformdataattributesid);

ALTER TABLE platform_config_datagen
	ADD FOREIGN KEY (datagentypeid) 
	REFERENCES refdata_datagentypes (datagentypeid);

ALTER TABLE platform_config_datagen
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


ALTER TABLE terms_codeset_hl7v2
	ADD FOREIGN KEY (codesetsid) 
	REFERENCES refdata_codeset (codesetsid);

ALTER TABLE terms_codeset_hl7v2
	ADD FOREIGN KEY (statusid) 
	REFERENCES refdata_status (statusid);


