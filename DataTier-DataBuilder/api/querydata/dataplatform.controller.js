const db= require("../../general/dbConnections/mysqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

router.get('/dataexisting_ababanking', function (req, res) {
    connection.query('select * from dataexisting_ababanking where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
    });
});

router.get('/dataexisting_areacode', function (req, res) {
    connection.query('select * from dataexisting_areacode where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));

    });
});

// rest api to get a area codes by state
// Example: http://localhost:8400/dataexisting_areacode/CA
router.get('/dataexisting_areacode/:statecode', function (req, res) {
    connection.query('select * from dataexisting_areacode where StatusID=1 and StateCode=?', [req.params.statecode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/dataexisting_companies', function (req, res) {
    connection.query('select * from dataexisting_companies where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_namefirst/:firstnamechar/:gender', function (req, res) {
    connection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=? and gender=?', [req.params.firstnamechar, req.params.gender], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_namefirst/:firstnamechar', function (req, res) {
    connection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=?', [req.params.firstnamechar], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_namefirst', function (req, res) {
    connection.query('select * from dataexisting_namefirst where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_namelast/:lastnamechar', function (req, res) {
    connection.query('select * from dataexisting_namelast where StatusID=1 and left(lastname,1)=?', [req.params.lastnamechar], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_namelast', function (req, res) {
    connection.query('select * from dataexisting_namelast where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_upccodes', function (req, res) {
    connection.query('select * from dataexisting_upccodes where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_zipcodeus/:statecode', function (req, res) {
    connection.query('select * from dataexisting_zipcodeus where StatusID=1 and State=?', [req.params.statecode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/dataexisting_zipcodeus', function (req, res) {
    connection.query('select * from dataexisting_zipcodeus where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
 *     Data Generated
 */
router.get('/datagenerated_accountnumbers', function (req, res) {
    connection.query('select * from datagenerated_accountnumbers', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_addresses', function (req, res) {
    connection.query('select * from datagenerated_addresses where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_bankaccount', function (req, res) {
    connection.query('select * from datagenerated_bankaccount where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_creditcard', function (req, res) {
    connection.query('select * from datagenerated_creditcard where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_dateofbirth', function (req, res) {
    connection.query('select * from datagenerated_dateofbirth where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_driverslicenses/:statecode', function (req, res) {
    connection.query('select * from datagenerated_driverslicenses where StatusID=1 and StateCode=?', [req.params.statecode] ,function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_driverslicenses', function (req, res) {
    connection.query('select * from datagenerated_driverslicenses where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});


router.get('/datagenerated_ein', function (req, res) {
    connection.query('select * from datagenerated_ein where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_phonennumber', function (req, res) {
    connection.query('select * from datagenerated_phonenumber where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_socialsecuritynumber', function (req, res) {
    connection.query('select * from datagenerated_socialsecuritynumber where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagenerated_useridentities', function (req, res) {
    connection.query('select * from datagenerated_useridentities where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
*     Impl Data
*/

router.get('/applications', function (req, res) {
    connection.query('select * from impl_application where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    connection.query('select * from impl_codesetstocrossmaps where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    connection.query('select * from impl_codesetstoapplication where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    connection.query('select * from impl_codesettomsgtype where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/legalentity', function (req, res) {
    connection.query('select * from impl_legalentities where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/organization', function (req, res) {
    connection.query('select * from impl_organization where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/organization', function (req, res) {
    connection.query('select * from impl_rulesets where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/organization', function (req, res) {
    connection.query('select * from impl_rulesetsdefintions where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
*     Reference Data
*/

router.get('/codesets', function (req, res) {
    connection.query('select * from refdata_codeset where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/countries', function (req, res) {
    connection.query('select * from refdata_countries where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagentypes', function (req, res) {
    connection.query('select * from refdata_datagentypes where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/industrystd', function (req, res) {
    connection.query('select * from refdata_industrystd where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/operationtype', function (req, res) {
    connection.query('select * from refdata_operationtype', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/platformparams', function (req, res) {
    connection.query('select * from refdata_platformparams', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/platformparamstodataattributes', function (req, res) {
    connection.query('select * from refdata_platformparamstodataattributes', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/sensitivityflags', function (req, res) {
    connection.query('select * from refdata_sensitivtyflags where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/statuses', function (req, res) {
    connection.query('select * from refdata_status where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/terminologystd', function (req, res) {
    connection.query('select * from refdata_terminologystd where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/timezones', function (req, res) {
    connection.query('select * from refdata_timezones where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/usstates', function (req, res) {
    connection.query('select * from refdata_usstates where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/vendors', function (req, res) {
    connection.query('select * from refdata_vendors where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

/*
*     Terms Data
*/

router.get('/termscodesethl7v2', function (req, res) {
    connection.query('select * from terms_codeset_HL7v2 where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesetumls', function (req, res) {
    connection.query('select * from terms_umls_mrconoso where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesetumls/:sabcode', function (req, res) {
    connection.query('select * from terms_umls_mrconoso where StatusID=1 and SAB=?', [req.params.sabcode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;