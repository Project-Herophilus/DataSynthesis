//const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const express = require("express");
const router = express.Router();
const fs = require("fs");

router.post('/createdatastructure', function(req, res) {
    console.log(req.body)
    const datastructure = {
        name: req.body.datastructurename,
        flag_id: req.body.sensitivityflag
    }
    const queryString = `insert into platform_config_datastructures (datastructurename, 
        sensitivityflagid) values ('${datastructure.name}', '${datastructure.flag_id}')`
    console.log(queryString)

    dbConnection.query(queryString, function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
        res.status(200).send();
    });
})



module.exports = router