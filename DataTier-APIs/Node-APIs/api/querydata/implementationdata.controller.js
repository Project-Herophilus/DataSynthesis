//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");

let rdbmsType = process.env.rdbms;

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
        let sqlQuery = 'select * from impl_application where StatusID ='+StatusID;
        dbConnection.query('select * from impl_application where '+StatusID, function (error, results, fields) {
            if (error) throw error;
            if (results.rows.length > 0)
            {
                res.end(JSON.stringify(results.rows));
                res.status(200).send();
            }
            else
            {
                res.status(200).send("No Data Returned from Query: " +strQuery);
            }
        });
    }
});

router.get('/codesets', function (req, res) {
    let sqlQuery = 'select * from impl_codesetscrossmaps where statusid =1';
    dbConnection.query('select * from impl_codesetscrossmaps where statusid =1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    let sqlQuery = 'select * from impl_codesetscrossmaps where statusid=1';
    dbConnection.query('select * from impl_codesetscrossmaps where statusid=1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    let sqlQuery = 'select * from impl_codesetstoapplication where statusid=1';
    dbConnection.query('select * from impl_codesetstoapplication where statusid=1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/codesetstocrossmaps', function (req, res) {
    let sqlQuery = 'select * from impl_codesettomsgtype where statusid=1';
    dbConnection.query('select * from impl_codesettomsgtype where statusid=1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/legalentities', function (req, res) {
    let sqlQuery = 'select * from impl_legalentities where statusid=1';
    dbConnection.query('select * from impl_legalentities where statusid=1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/organization', function (req, res) {
    let sqlQuery = 'select * from impl_organization where statusid=1';
    dbConnection.query('select * from impl_organization where statusid=1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/rulesets', function (req, res) {
    let sqlQuery = 'select * from impl_rulesets where statusid =1';
    dbConnection.query('select * from impl_rulesets where statusid =1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

router.get('/rulesetsdefinitions', function (req, res) {
    let sqlQuery = 'select * from impl_rulesetsdefinitions where statusid=1';
    dbConnection.query('select * from impl_rulesetsdefinitions where statusid=1', function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0)
        {
            res.end(JSON.stringify(results.rows));
            res.status(200).send();
        }
        else
        {
            res.status(200).send("No Data Returned from Query: " +strQuery);
        }
    });
});

module.exports = router;