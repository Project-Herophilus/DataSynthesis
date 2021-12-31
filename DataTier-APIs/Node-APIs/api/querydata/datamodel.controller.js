//const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

// Data Existing Queries

    router.get('/datatables', function (req, res) {
        dbConnection.query('select * from datamodel_datatables where StatusID=1', function (error, results, fields) {
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
