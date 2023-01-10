const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

// Data Existing Queries

    router.get('/ababanking', function (req, res) {
            let strQuery ='select * from dataexisting_ababanking'
            dbConnection.query(strQuery, function (error, results, fields) {
                if (error) throw error;
                if (results.rows.length > 0)
                {
                    res.end(JSON.stringify(results.rows));
                    res.status(200).send();
                }
                else
                {
                    res.status(200).send("No Data Returned from Query: "+strQuery);
                }
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
            let strQuery ='select * from dataexisting_ababanking where StateCode= '+stateCodeVal
            dbConnection.query(strQuery, function (error, results, fields) {
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

    /*
     *   AreaCode
     */
    router.get('/areacode', function (req, res) {
            let strQuery ='select * from dataexisting_areacode'
            dbConnection.query(strQuery, function (error, results, fields) {
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
            let strQuery ='select * from dataexisting_areacode where StateCode= '+stateCodeVal
            dbConnection.query(strQuery, function (error, results, fields) {
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

    /*
     *   Companies
     */
    router.get('/companies', function (req, res) {
        let strQuery ='select * from dataexisting_companies'
        dbConnection.query(strQuery, function (error, results, fields) {
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
            let strQuery ='select * from dataexisting_companies where companyname like '+'%'+companyNameVal+'%'
            //dbConnection.query('select * from dataexisting_companies where companyname like $1', ['%'+req.params.companyname+'%'], function (error, results, fields) {
            dbConnection.query(strQuery, function (error, results, fields) {
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
            let strQuery ='select * from dataexisting_companies where firstname like '+'%'+firstNameCharVal+'%'+' and gender ='+'%'+genderVal+'%'
            //dbConnection.query('select * from dataexisting_namefirst where firstname like $1 and gender=$2', ['%'+req.params.firstnamelike+'%', req.params.gender], function (error, results, fields) {
            dbConnection.query(strQuery, function (error, results, fields) {
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
    router.get('/namefirst', function (req, res) {
        let strQuery ='select * from dataexisting_namefirst'
        dbConnection.query(strQuery, function (error, results, fields) {
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
            let strQuery ='select * from dataexisting_namelast where lastname like '+'%'+lastnameCharVal+'%'
            dbConnection.query(strQuery, function (error, results, fields) {
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
    router.get('/namelast', function (req, res) {
        let strQuery ='select * from dataexisting_namelast'
        dbConnection.query(strQuery, function (error, results, fields) {
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
            let strQuery ='select * from dataexisting_upccodes where upcproductname like '+'%'+productNameVal+'%'
            dbConnection.query(strQuery, function (error, results, fields) {
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
    router.get('/upccodes', function (req, res) {
        let strQuery ='select * from dataexisting_upccodes'
        dbConnection.query(strQuery, function (error, results, fields) {
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

    /*
     *    ZipcodeUS
     */
    router.get('/zipcodeus', function (req, res) {
        let strQuery ='select * from dataexisting_zipcodeus where statusid=1'
        dbConnection.query(strQuery, function (error, results, fields) {
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
    router.get('/zipcodeus/:statecode', function (req, res) {
        if (rdbmsType =="mysql") {
            dbConnection.query('select * from dataexisting_zipcodeus where StateCode=?', [req.params.statecode], function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
            });
        }
        if (rdbmsType =="postgreSQL") {
            const stateCodeVal = req.params.statecode;
            let strQuery ='select * from dataexisting_zipcodeus where statecode='+stateCodeVal
            dbConnection.query(strQuery, function (error, results, fields) {
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

    module.exports = router;
