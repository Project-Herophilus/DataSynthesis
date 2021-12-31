//const dbConnection= require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

/*
*     Terms Data
*/

router.get('/termscodesethl7v2', function (req, res) {
    dbConnection.query('select * from terms_codeset_HL7v2 where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesethl7v2/:code', function (req, res) {
    dbConnection.query('select * from terms_codeset_HL7v2 where StatusID=1 and code like ?', [req.params.code], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesetumls', function (req, res) {
    dbConnection.query('select * from terms_umls_mrconoso where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesetumls/:sabcode', function (req, res) {
    dbConnection.query('select * from terms_umls_mrconoso where StatusID=1 and SAB=?', [req.params.sabcode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;