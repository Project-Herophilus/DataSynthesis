//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
const statusID = 1;
let dbUsed = process.env.rdbms;
// Data Existing Queries

    router.get('/datatables', function (req, res) {
        dbConnection.query('select tablename,tableinformation from datamodel_datatables where StatusID=1', function (error, results, fields) {
            if (error) throw error;
            res.end(JSON.stringify(results));
            res.status(200).send();
        });
    });

    router.get('/datadomain', function (req, res) {
        dbConnection.query('select * from datamodel_domain where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
        });
    });

    module.exports = router;
