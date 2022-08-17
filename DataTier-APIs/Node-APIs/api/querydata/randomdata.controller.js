//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const dbQueries = require('../../general/datatier/dbQueries');
const express = require("express");
const router = express.Router();

router.get('/ababanking', function (req, res) {
  dbConnection.query('select * from dataexisting_ababanking order by random() limit '+process.env.runQuantity, function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
    });
});

module.exports = router;