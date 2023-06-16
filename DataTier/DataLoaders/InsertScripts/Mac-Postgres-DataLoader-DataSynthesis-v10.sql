# /Library/PostgreSQL/15/bin/psql h localhost -U postgres -d datasynthesis -p 5432 -f file.sql
# "C:\Program Files\PostgreSQL\13\bin\/Library/PostgreSQL/15/bin/psql.exe" -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/1-refdata_status.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/1-refdata_status.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/2-refdata_timezones.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/3-refdata_usstates.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/5-refdata_vendor.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/7-refdata_industrystd.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/8-refdata_sensitivityflag.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/9-refdata_codeset.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/10-refdata_datagentypes.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_countries.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_operationtype.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_terminologystd.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_devicetypes.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_industries.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_industriestobusiness.sql
--Implementation
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_legalentities.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_organization.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_application.sql
-- Data Model
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataModel/datamodel_datatables.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataModel/datamodel_domain.sql
-- Platform
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/platform_dataattributes.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/platform_config_dataattributes.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/platform_config_datastructures.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/platform_config_datastructures_dtl.sql
-- DataExisting
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_ababanking.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_areacode.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_companies.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_1.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_2.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_1.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_2.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_3.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_profession.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_upccodes.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_zipcodeus.sql
-- DataGenerated
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_accountnumbers.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_addresses.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_bankaccount.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_creditcard.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_dateofbirth.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_devices.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_1.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_2.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_ein.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_phonenumbers.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_serialnumbers.sql
/Library/PostgreSQL/15/bin/psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_useridentities.sql