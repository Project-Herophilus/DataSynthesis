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
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_operationtype.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/refdata_terminologystd.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_legalentities.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_organization.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Implementation/impl_application.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Other/datamodel_datatables.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Other/datamodel_domain.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/1-platform_dataattributes.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./ReferenceData/10-refdata_datagentypes.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/2-platform_datastructures.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/3-platform_datastructurestodataattributes.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Platform/platform_config_datagen.sql
-- Issue in State or relationship
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_ababanking.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_areacode.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_companies.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_1.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namefirst_3.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_1.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_3.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_4.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_5.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_namelast_6.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_upccodes.sql
-- Issue in State or relationship
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataExisting/dataexisting_zipcodeus.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_accountnumber.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_addresses.sql
-- Issue in Statement
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_bankaccount.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_creditcard.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_dateofbirth.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_1.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_driverslicenses_3.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_phonenumber.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_socialsecuritynumber.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./DataGenerated/datagenerated_useridentities.sql
@ psql:./Terms/terms_umls_mrconoso.sql:25001: ERROR:  character with byte sequence 0x81 in encoding "WIN1252" has no equiv
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Terms/terms_umls_mrconoso.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Terms/terms_umls_mrconoso_2.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Terms/terms_umls_mrconoso_3a.sql
psql -h localhost -U postgres -d datasynthesis -p 5432 -f ./Terms/terms_umls_mrconoso_4.sql
