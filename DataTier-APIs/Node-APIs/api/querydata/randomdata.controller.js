//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const dbQueries = require('../../general/datatier/dbQueries');
const express = require("express");
const router = express.Router();

router.get('/ababanking', function (req, res) {
  dbConnection.query('select * from dataexisting_ababanking order by random() limit '+process.env.runQuantity, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0){
          res.end(JSON.stringify(results.rows));
          res.status(200).send();
        }
        else { 
          res.status(500).send("No Data Available")
        }
    });
});

module.exports = router;