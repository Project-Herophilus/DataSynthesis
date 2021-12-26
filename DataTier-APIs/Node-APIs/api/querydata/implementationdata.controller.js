const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");


/*
*     Impl Data
*/

router.get('/applications', function (req, res) {
    dbConnection.query('select * from impl_application where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});
router.get('/codesets', function (req, res) {
    dbConnection.query('select * from impl_codesetscrossmaps where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    dbConnection.query('select * from impl_codesetscrossmaps where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    dbConnection.query('select * from impl_codesetstoapplication where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    dbConnection.query('select * from impl_codesettomsgtype where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/legalentities', function (req, res) {
    dbConnection.query('select * from impl_legalentities where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/organization', function (req, res) {
    dbConnection.query('select * from impl_organization where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/rulesets', function (req, res) {
    dbConnection.query('select * from impl_rulesets where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get('/rulesetsdefinitions', function (req, res) {
    dbConnection.query('select * from impl_rulesetsdefinitions where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

module.exports = router;