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
    let sqlQuery = 'select * from terms_codeset_HL7v2';
    dbConnection.query('select * from terms_codeset_HL7v2', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0){
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else {
            res.status(500).send("No Data Available"+strQuery);
        }
    });
});

router.get('/termscodesethl7v2/:code', function (req, res) {
    const codeVal = req.params.code;
    let sqlQuery = 'select * from terms_codeset_HL7v2 where code like '+'%'+codeVal+'%';
    dbConnection.query('select * from terms_codeset_HL7v2 where code like ?', [req.params.code], function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0){
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else {
            res.status(500).send("No Data Available"+strQuery);
        }
    });
});

router.get('/termscodesetumls', function (req, res) {
    let sqlQuery = 'select * from terms_umls_mrconoso';
    dbConnection.query('select * from terms_umls_mrconoso', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0){
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else {
            res.status(500).send("No Data Available"+strQuery);
        }
    });
});

router.get('/termscodesetumls/:sabcode', function (req, res) {
    const codeVal = req.params.sabcode;
    let sqlQuery = 'select * from terms_umls_mrconoso where SAB like '+'%'+codeVal+'%';
    dbConnection.query('select * from terms_umls_mrconoso where SAB=?', [req.params.sabcode], function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0){
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else {
            res.status(500).send("No Data Available"+strQuery);
        }
    });
});

module.exports = router;