const db = require("../../general/dbConnections/mysqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");


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