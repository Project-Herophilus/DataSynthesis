//const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

// Data Existing Queries

    router.get('/ababanking', function (req, res) {
            dbConnection.query('select * from dataexisting_ababanking', function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
                res.status(200).send();
            });
    });
    // rest api to get a area codes by state
    // Example: http://localhost:3001/dataexisting/ababanking/CA
    router.get('/ababanking/:statecode', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_ababanking where StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
                res.status(200).send();
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const stateCodeVal = req.params.statecode;
            dbConnection.query('select * from dataexisting_ababanking where StateCode=$1', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
                res.status(200).send();
            });
        }
    });

    /*
     *   AreaCode
     */
    router.get('/areacode', function (req, res) {
            dbConnection.query('select * from dataexisting_areacode where StatusID=1', function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
    });
    // Example: http://localhost:3001/dataexisting/areacode/CA
    router.get('/areacode/:statecode', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_areacode where StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const stateCodeVal = req.params.statecode;
            dbConnection.query('select * from dataexisting_areacode where StateCode=$1', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });

    /*
     *   Companies
     */
    router.get('/companies', function (req, res) {
        dbConnection.query('select * from dataexisting_companies where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    // Companies with a like name match
    router.get('/companies/:companyname', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_companies where companyname like ?', [req.params.companyname], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const companyNameVal = req.params.companyname;
            // let sqlQuery = "select * from dataexisting_companies where StatusID=1 and companyname like "+ companyNameVal;
            // console.log("Query: "+sqlQuery);
            dbConnection.query('select * from dataexisting_companies where companyname like $1', ['%'+req.params.companyname+'%'], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });

    /*
     *   NameFirst
     */
    router.get('/namefirst/:firstnamelike/:gender', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namefirst where left(firstname,1)=? and gender=?', [req.params.firstnamelike, req.params.gender], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL") {
            const genderVal = req.params.gender;
            const firstNameCharVal = req.params.firstnamelike;
            dbConnection.query('select * from dataexisting_namefirst where firstname like $1 and gender=$2', ['%'+req.params.firstnamelike+'%', req.params.gender], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namefirst:likename', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namefirst where firstname like ?', [req.params.likename], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const lastnameVal = req.params.likename;
            dbConnection.query('select * from dataexisting_namefirst where firstname like $1', ['%'+req.params.likename+'%'], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }

    });
    router.get('/namefirst', function (req, res) {
        dbConnection.query('select * from dataexisting_namefirst', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    /*
     *    NameLast
     */
    router.get('/namelast/:lastnamematch', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namelast where lastname like ?', [req.params.lastnamematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const lastnameCharVal = req.params.lastnamematch;
            dbConnection.query('select * from dataexisting_namelast where lastname like $1', ['%'+req.params.lastnamematch+'%'], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namelast', function (req, res) {
        dbConnection.query('select * from dataexisting_namelast', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    /*
     *   UPCCCodes
     */
    router.get('/upccodes/:productnamematch', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_upccodes where upcproductname like ?', [req.params.productnamematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const productNameVal = req.params.productnamematch;
            dbConnection.query('select * from dataexisting_upccodes where upcproductname like $1', ['%'+req.params.productnamematch+'%'], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/upccodes', function (req, res) {
        dbConnection.query('select * from dataexisting_upccodes', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    /*
     *    ZipcodeUS
     */
    router.get('/zipcodeus', function (req, res) {
        dbConnection.query('select * from dataexisting_zipcodeus', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/zipcodeus/:statecode', function (req, res) {
        if (rdbmsType =="mysql") {
            dbConnection.query('select * from dataexisting_zipcodeus where StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL") {
            const stateCodeVal = req.params.statecode;
            dbConnection.query('select * from dataexisting_zipcodeus where StateCode=$1', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });

    module.exports = router;
