SELECT  (
        SELECT COUNT(*)
        FROM datagenerated_accountnumbers
        ) AS cnt_accountnumbers,
       (
        SELECT COUNT(*)
        FROM datagenerated_addresses
        ) AS cnt_addresses,
       (
        SELECT COUNT(*)
        FROM datagenerated_bankaccount
        ) AS cnt_bankaccounts,
       (
        SELECT COUNT(*)
        FROM datagenerated_creditcard
        ) AS cnt_creditcards,
        (
        SELECT COUNT(*)
        FROM datagenerated_dateofbirth
        ) AS cnt_dateofbirths,
        (
        SELECT COUNT(*)
        FROM datagenerated_driverslicenses
        ) AS cnt_dlns,
        (
        SELECT COUNT(*)
        FROM datagenerated_ein
        ) AS cnt_eins,
        (
        SELECT COUNT(*)
        FROM datagenerated_phonenumber
        ) AS cnt_phonenumbers,
        (
        SELECT COUNT(*)
        FROM datagenerated_phonenumbersintl
        ) AS cnt_phonenumbersintl,
        (
        SELECT COUNT(*)
        FROM datagenerated_socialsecuritynumber
        ) AS cnt_ssns,
        (
        SELECT COUNT(*)
        FROM datagenerated_useridentities
        ) AS cnt_useridentities,
       (
        SELECT COUNT(*)
        FROM dataexisting_namefirst
        ) AS cnt_firstnames,
        (
        SELECT COUNT(*)
        FROM dataexisting_namelast
        ) AS cnt_lastnames
