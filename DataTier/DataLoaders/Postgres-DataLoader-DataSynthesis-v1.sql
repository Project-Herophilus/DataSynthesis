psql -d datasynthesis datasynthesis
psql -d datasynthesis datasynthesis -f ./ReferenceData/1-refdata_status.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\1-refdata_status.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\1-refdata_status.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\2-refdata_timezones.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\3-refdata_usstates.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\4-refdata_organization.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\5-refdata_vendor.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\6-refdata_application.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\7-refdata_industrystd.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\8-refdata_sensitivityflag.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\9-refdata_codeset.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\refdata_countries.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\refdata_operationtype.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f Other\datamodel_datatables.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f Platform\1-platform_dataattributes.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f ReferenceData\10-refdata_datagentypes.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f Platform\2-platform_datastructures.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f Platform\3-platform_datastructurestodataattributes.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f Platform\platform_appsettings_dataattributes.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f Platform\platform_config_datagen.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_ababanking.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_areacode.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_companies.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namefirst_1.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namefirst_2.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namefirst_3.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namelast_1.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namelast_2.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namelast_3.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namelast_4.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namelast_5.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_namelast_6.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_upccodes.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataExisting\dataexisting_zipcodeus.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_accountnumber.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_addresses.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_bankaccount.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_creditcard.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_dateofbirth.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_driverslicenses_1.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_driverslicenses_2.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_driverslicenses_3.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_phonenumber.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_socialsecuritynumber.sql
psql datasynthesis -h 127.0.0.1 -d datasynthesis -f DataGenerated\datagenerated_useridentities.sql