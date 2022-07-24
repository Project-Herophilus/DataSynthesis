//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

/*
*     Terms Data
*/

router.get('/termscodesethl7v2', function (req, res) {
    dbConnection.query('select * from terms_codeset_HL7v2', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesethl7v2/:code', function (req, res) {
    dbConnection.query('select * from terms_codeset_HL7v2 and code like ?', [req.params.code], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesetumls', function (req, res) {
    dbConnection.query('select * from terms_umls_mrconoso', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/termscodesetumls/:sabcode', function (req, res) {
    dbConnection.query('select * from terms_umls_mrconoso SAB=?', [req.params.sabcode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;