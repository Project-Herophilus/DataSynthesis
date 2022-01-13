///const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

/*
*     Impl Data
*/

/*
 *   Applications
 */
router.get('/applications/:activeStatus', function (req, res) {
    const activeStatus = req.params.activeStatus;
    //console.log("Active Status: "+activeStatus);
    let StatusID;
    if (activeStatus == null || activeStatus == "active" )
    {
        StatusID = 'StatusID = 1';
    }
    if (activeStatus == "inactive")
    {
        StatusID = 'StatusID = 2';
    }
    if (activeStatus == "all")
    {
        StatusID = 'StatusID >=1 ';
    }
    if (rdbmsType =="mysql") {
        dbConnection.query('select * from impl_application where StatusID='+StatusID, function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
    if (rdbmsType =="postgreSQL")
    {
        let sqlQuery = 'select * from impl_application where '+StatusID;
        console.log("SQL: "+sqlQuery);
        dbConnection.query('select * from impl_application where '+StatusID, function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    }
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