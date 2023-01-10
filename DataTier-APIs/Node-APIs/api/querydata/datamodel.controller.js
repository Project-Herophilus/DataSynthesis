const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
const statusID = 1;
let dbUsed = process.env.rdbms;

    router.get('/datatables', function (req, res) {
        let strQuery ='select tablename,tableinformation from datamodel_datatables'
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

    router.get('/datadomain', function (req, res) {
        let strQuery ='select * from datamodel_domain'
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
