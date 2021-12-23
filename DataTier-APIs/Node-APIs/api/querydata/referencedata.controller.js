const dbConnection = require("../../general/dbConnections/mysqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

/*
*     Reference Data
*/

router.get('/codesets', function (req, res) {
    dbConnection.query('select * from refdata_codeset where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/countries', function (req, res) {
    dbConnection.query('select * from refdata_countries where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagentypes', function (req, res) {
    dbConnection.query('select * from refdata_datagentypes where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/industrystd', function (req, res) {
    dbConnection.query('select * from refdata_industrystd where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/operationtype', function (req, res) {
    dbConnection.query('select * from refdata_operationtype', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/platformparams', function (req, res) {
    dbConnection.query('select * from refdata_platformparams', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/platformparamstodataattributes', function (req, res) {
    dbConnection.query('select * from refdata_platformparamstodataattributes', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/sensitivityflags', function (req, res) {
    dbConnection.query('select * from refdata_sensitivtyflags where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/statuses', function (req, res) {
    dbConnection.query('select * from refdata_status where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/terminologystd', function (req, res) {
    dbConnection.query('select * from refdata_terminologystd where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/timezones', function (req, res) {
    dbConnection.query('select * from refdata_timezones where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/usstates', function (req, res) {
    dbConnection.query('select * from refdata_usstates where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/vendors', function (req, res) {
    dbConnection.query('select * from refdata_vendors where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;