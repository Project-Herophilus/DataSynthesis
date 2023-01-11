const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

router.get('/appsettingsgeneral', function (req, res) {
    let strQuery ='select * from platform_appsettings_general'
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
router.get('/platformconfigdataattributes', function (req, res) {
    let strQuery ='select * from platform_config_dataattributes'
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

router.get('/platformconfigdatastructures', function (req, res) {
    let strQuery ='select * from platform_config_datastructures'
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

router.get('/platformconfigdatastructuresdtl', function (req, res) {
    let strQuery ='select * from platform_config_datastructures_dtl'
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

router.get('/datastructures', function (req, res) {
    let strQuery ='select * from platform_config_datastructures'
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
  *     Platform Configuration Details by Data Structure
 */
router.get('/platformconfigdatastructuresdtlbydatastructure/:datastructureid', function (req, res) {
    const codeVal = req.params.datastructureid;
    let strQuery ='select * from platform_config_datastructures_dtl where platformdatastructuresid = ' + codeVal;
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
  *     Platform Configured Data Attributes by Specific Data Attributes
 */
router.get('/platformconfigdataattributesbydatastructure/:dataattributeid', function (req, res) {
    const codeVal = req.params.dataattributeid;
    let strQuery ='select * from platform_config_dataattributes where dataattributeid = '+ codeVal;
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

module.exports = router;