//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

/*
*     Reference Data
*/

router.get('/codesets', function (req, res) {
    dbConnection.query('select * from refdata_codeset', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/countries', function (req, res) {
    dbConnection.query('select * from refdata_countries', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/datagentypes', function (req, res) {
    dbConnection.query('select * from refdata_datagentypes', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/industrystd', function (req, res) {
    dbConnection.query('select * from refdata_industrystd', function (error, results, fields) {
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
    dbConnection.query('select * from refdata_sensitivityflag', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/statuses', function (req, res) {
    dbConnection.query('select * from refdata_status', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/terminologystd', function (req, res) {
    dbConnection.query('select * from refdata_terminologystd', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/timezones', function (req, res) {
    dbConnection.query('select * from refdata_timezones', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/usstates', function (req, res) {
    dbConnection.query('select * from refdata_usstates', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/vendors', function (req, res) {
    dbConnection.query('select * from refdata_vendor', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;