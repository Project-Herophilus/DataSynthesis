const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

/*
*     Reference Data
*/

router.get('/codesets', function (req, res) {
    let strQuery = 'select * from refdata_codeset';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/countries', function (req, res) {
    let strQuery = 'select * from refdata_countries';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/datagentypes', function (req, res) {
    let strQuery = 'select * from refdata_datagentypes';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/industrystd', function (req, res) {
    let strQuery = 'select * from refdata_industrystd';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/operationtype', function (req, res) {
    let strQuery = 'select * from refdata_operationtype';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/platformparams', function (req, res) {
    let strQuery = 'select * from refdata_platformparams';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/platformparamstodataattributes', function (req, res) {
    let strQuery = 'select * from refdata_platformparamstodataattributes';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/sensitivityflags', function (req, res) {
    let strQuery = 'select * from refdata_sensitivityflag';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/statuses', function (req, res) {
    let strQuery = 'select * from refdata_status';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/terminologystd', function (req, res) {
    let strQuery = 'select * from refdata_terminologystd';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/timezones', function (req, res) {
    let strQuery = 'select * from refdata_timezones';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/usstates', function (req, res) {
    let strQuery = 'select * from refdata_usstates';
    dbConnection.query(strQuery, function (error, results, fields) {
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

router.get('/vendors', function (req, res) {
    let strQuery = 'select * from refdata_vendor';
    dbConnection.query(strQuery, function (error, results, fields) {
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