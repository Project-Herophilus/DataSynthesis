# psql h localhost -U postgres -d datasynthesis -p 5432 -f file.sql
# "C:\Program Files\PostgreSQL\13\bin\psql.exe" -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/1-refdata_status.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/1-refdata_status.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/2-refdata_timezones.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/3-refdata_usstates.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/5-refdata_vendor.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/7-refdata_industrystd.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/8-refdata_sensitivityflag.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/9-refdata_codeset.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_countries.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_operationtype_v2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_terminologystd.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_devicetype.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_industries.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_industriestobusiness.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_legalentities.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_organization.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_application_v2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Other/datamodel_datatables.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Other/datamodel_domain.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/1-platform_dataattributes_v3.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/10-refdata_datagentypes.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/2-platform_datastructures_v2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/3-platform_datastructurestodataattributes.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/platform_config_dataattributes_generator.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_ababanking.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_areacode.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_companies.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_1.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_1.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_3.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_upccodes.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_zipcodeus_v2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_accountnumber.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_addresses.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_bankaccount.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_creditcard.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_dateofbirth.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_1.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_phonenumbers.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_socialsecuritynumber.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_useridentities.sql
