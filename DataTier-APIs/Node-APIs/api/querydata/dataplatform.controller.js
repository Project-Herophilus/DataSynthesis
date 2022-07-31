//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

router.get('/datastructures', function (req, res) {
    dbConnection.query('select datastructurename from platform_config_datastructures where StatusID=1', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
    });
});
module.exports = router;