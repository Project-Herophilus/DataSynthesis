//const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

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
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_ababanking where StatusID=1 and StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
                res.status(200).send();
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const stateCodeVal = req.params.statecode;
            dbConnection.query('select * from dataexisting_ababanking where StatusID=1 and StateCode=$1', [req.params.statecode], function (error, results, fields) {
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
            dbConnection.query('select * from dataexisting_areacode where StatusID=1 and StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const stateCodeVal = req.params.statecode;
            dbConnection.query('select * from dataexisting_areacode where StatusID=1 and StateCode=$1', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }

    });
    // rest api to get areacodes by timezones
    // Example: http://localhost:3001/dataexisting/timezone/CST
    router.get('/areacode/:timezone', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_areacode where StatusID=1 and TimeZone=?', [req.params.timezone], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const timeZoneVal = req.params.timezone;
            dbConnection.query('select * from dataexisting_areacode where StatusID=1 and TimeZone=$1', [req.params.timezone], function (error, results, fields) {
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
            dbConnection.query('select * from dataexisting_companies where StatusID=1 and companyname like ?', [req.params.companyname], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const compayNameVal = req.params.companyname;
            dbConnection.query('select * from dataexisting_companies where StatusID=1 and companyname like $1', [req.params.companyname], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });

    /*
     *   NameFirst
     */
    router.get('/namefirst/:gender', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and gender=?', [req.params.gender], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const genderVal = req.params.gender;
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and gender=$1', [req.params.gender], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namefirst/:firstnamechar/:gender', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=? and gender=?', [req.params.firstnamechar, req.params.gender], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL") {
            const genderVal = req.params.gender;
            const firstNameCharVal = req.params.firstnamechar;
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=$2 and gender=$1', [req.params.firstnamechar, req.params.gender], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namefirst/:firstnamechar', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=?', [req.params.firstnamechar], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL") {
            const firstNameCharVal = req.params.firstnamechar;
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and left(firstname,1)=$1', [req.params.firstnamechar], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namefirst:likename', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and namefirst like ?', [req.params.likename], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const lastnameVal = req.params.likename;
            dbConnection.query('select * from dataexisting_namefirst where StatusID=1 and namefirst like $1', [req.params.likename], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }

    });
    router.get('/namefirst', function (req, res) {
        dbConnection.query('select * from dataexisting_namefirst where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    /*
     *    NameLast
     */
    router.get('/namelast/:lastnamechar', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namelast where StatusID=1 and left(lastname,1)=?', [req.params.lastnamechar], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const lastnameCharVal = req.params.lastnamechar;
            dbConnection.query('select * from dataexisting_namelast where StatusID=1 and left(lastname,1)=$1', [req.params.lastnamechar], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namelast/:lastnamematch', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_namelast where StatusID=1 and lastname like ?', [req.params.lastnamematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const lastnameCharVal = req.params.lastnamematch;
            dbConnection.query('select * from dataexisting_namelast where StatusID=1 and lastname like $1', [req.params.lastnamematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/namelast', function (req, res) {
        dbConnection.query('select * from dataexisting_namelast where StatusID=1', function (error, results, fields) {
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
            dbConnection.query('select * from dataexisting_upccodes where StatusID=1 and companyname like ?', [req.params.productnamematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const productNameVal = req.params.productnamematch;
            dbConnection.query('select * from dataexisting_upccodes where StatusID=1 and productname like $1', [req.params.productnamematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/upccodes/:upccodematch', function (req, res) {
        if (rdbmsType =="mysql")
        {
            dbConnection.query('select * from dataexisting_upccodes where StatusID=1 and upccode like ?', [req.params.upccodematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL")
        {
            const upcCodeVal = req.params.upccodematch;
            dbConnection.query('select * from dataexisting_upccodes where StatusID=1 and upccode like $1', [req.params.upccodematch], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });
    router.get('/upccodes', function (req, res) {
        dbConnection.query('select * from dataexisting_upccodes where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });

    /*
     *    ZipcodeUS
     */
    router.get('/zipcodeus', function (req, res) {
        dbConnection.query('select * from dataexisting_zipcodeus where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
        });
    });
    router.get('/zipcodeus/:statecode', function (req, res) {
        if (rdbmsType =="mysql") {
            dbConnection.query('select * from dataexisting_zipcodeus where StatusID=1 and StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL") {
            const stateCodeVal = req.params.statecode;
            dbConnection.query('select * from dataexisting_zipcodeus where StatusID=1 and StateCode=$1', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
    });

    module.exports = router;
