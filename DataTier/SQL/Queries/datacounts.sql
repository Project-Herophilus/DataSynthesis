SELECT 'datagenerated_accountnumbers' AS datagenerated_accountnumbers, COUNT(*) FROM datagenerated_accountnumbers
UNION ALL SELECT 'datagenerated_addresses' AS datagenerated_addresses, COUNT(*) FROM datagenerated_addresses
UNION ALL SELECT 'datagenerated_bankaccount' AS datagenerated_bankaccount, COUNT(*) FROM datagenerated_bankaccount
UNION ALL SELECT 'datagenerated_creditcard' AS datagenerated_creditcard, COUNT(*) FROM datagenerated_creditcard
UNION ALL SELECT 'datagenerated_dateofbirth' AS datagenerated_dateofbirth, COUNT(*) FROM datagenerated_dateofbirth
UNION ALL SELECT 'datagenerated_driverslicenses' AS datagenerated_driverslicenses, COUNT(*) FROM datagenerated_driverslicenses
UNION ALL SELECT 'datagenerated_ein' AS datagenerated_ein, COUNT(*) FROM datagenerated_ein
UNION ALL SELECT 'datagenerated_phonenumber' AS datagenerated_phonenumber, COUNT(*) FROM datagenerated_phonenumber
UNION ALL SELECT 'datagenerated_phonenumbersintl' AS datagenerated_phonenumbersintl, COUNT(*) FROM datagenerated_phonenumbersintl
UNION ALL SELECT 'datagenerated_serialnumbers' AS datagenerated_serialnumbers, COUNT(*) FROM datagenerated_serialnumbers
UNION ALL SELECT 'datagenerated_socialsecuritynumber' AS datagenerated_socialsecuritynumber, COUNT(*) FROM datagenerated_socialsecuritynumber
UNION ALL SELECT 'dataexisting_namefirst' AS dataexisting_namefirst, COUNT(*) FROM dataexisting_namefirst
UNION ALL SELECT 'dataexisting_namelast' AS dataexisting_namelast, COUNT(*) FROM dataexisting_namelast
UNION ALL SELECT 'dataexisting_ababanking' AS dataexisting_ababanking, COUNT(*) FROM dataexisting_ababanking
UNION ALL SELECT 'dataexisting_areacode' AS dataexisting_areacode, COUNT(*) FROM dataexisting_areacode
UNION ALL SELECT 'dataexisting_areacodeintl' AS dataexisting_areacodeintl, COUNT(*) FROM dataexisting_areacodeintl
UNION ALL SELECT 'dataexisting_companies' AS dataexisting_companies, COUNT(*) FROM dataexisting_companies
UNION ALL SELECT 'dataexisting_zipcodeus' AS dataexisting_zipcodeus, COUNT(*) FROM dataexisting_zipcodeus
UNION ALL SELECT 'dataexisting_upccodes' AS dataexisting_upccodes, COUNT(*) FROM dataexisting_upccodes
;