const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
//const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

// Data Existing Queries

    router.get('/ababanking', function (req, res) {
        dbConnection.query('select * from dataexisting_ababanking where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
            res.status(200).send();
        });
    });
    // rest api to get a area codes by state
    // Example: http://localhost:3001/dataexisting/ababanking/CA
    router.get('/ababanking/:statecode', function (req, res) {
        dbConnection.query('select * from dataexisting_ababanking where StatusID=1 and State=?', [req.params.statecode], function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
        });
    });

    router.get('/areacode', function (req, res) {
        dbConnection.query('select * from dataexisting_areacode where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));

        });
    });
    // rest api to get a area codes by state
    // Example: http://localhost:3001/dataexisting/areacode/CA
    router.get('/areacode/:statecode', function (req, res) {
        dbConnection.query('select * from dataexisting_areacode where StatusID=1 and StateCode=?', [req.params.statecode], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    // rest api to get a area codes by state
    // Example: http://localhost:3001/dataexisting/timezone/CST
    router.get('/areacode/:timezone', function (req, res) {
        dbConnection.query('select * from dataexisting_areacode where StatusID=1 and TimeZone=?', [req.params.timezone], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    router.get('/companies', function (req, res) {
        dbConnection.query('select * from dataexisting_companies where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    router.get('/namefirst/:gender', function (req, res) {
        dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and gender=?', [req.params.gender], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/namefirst/:firstnamechar/:gender', function (req, res) {
        dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=? and gender=?', [req.params.firstnamechar, req.params.gender], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/namefirst/:firstnamechar', function (req, res) {
        dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=?', [req.params.firstnamechar], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/namefirst', function (req, res) {
        dbConnection.query('select * from dataexisting_namefirst where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    router.get('/namelast/:lastnamechar', function (req, res) {
        dbConnection.query('select * from dataexisting_namelast where StatusID=1 and left(lastname,1)=?', [req.params.lastnamechar], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/namelast', function (req, res) {
        dbConnection.query('select * from dataexisting_namelast where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    router.get('/upccodes', function (req, res) {
        dbConnection.query('select * from dataexisting_upccodes where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    router.get('/zipcodeus', function (req, res) {
        dbConnection.query('select * from dataexisting_zipcodeus where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/zipcodeus/:statecode', function (req, res) {
        dbConnection.query('select * from dataexisting_zipcodeus where StatusID=1 and State=?', [req.params.statecode], function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    module.exports = router;
