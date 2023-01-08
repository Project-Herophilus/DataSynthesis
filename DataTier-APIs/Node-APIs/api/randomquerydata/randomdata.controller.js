//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const dbQueries = require('../../general/datatier/dbQueries');
const express = require("express");
const router = express.Router();

/*router.get('/ababanking', function (req, res) {
    let strQuery = 'select * from dataexisting_ababanking order by random()';
  dbConnection.query('select * from dataexisting_ababanking order by random() limit '+process.env.runQuantity, function (error, results, fields) {
        if (error) throw error;
        if (results.rows.length > 0){
          res.end(JSON.stringify(results.rows));
          res.status(200).send();
        }
        else { 
          res.status(500).send("No Data Available"+strQuery);
        }
    });
});*/

router.get('/returnrandomdata/:tablename', function (req, res) {
        const tableNameVal = req.params.tablename;
        let strQuery ='select * from  '+tableNameVal+' order by random() limit '+process.env.runQuantity;
        dbConnection.query(strQuery, function (error, results, fields) {
        //dbConnection.query('select * from dataexisting_ababanking where StateCode=$1', [req.params.statecode], function (error, results, fields) {
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