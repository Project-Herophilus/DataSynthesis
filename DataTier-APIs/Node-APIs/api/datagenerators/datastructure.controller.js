//const db= require("../../general/connectors/dbConnections/mysqlConnect")
const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('../../general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const datastructuresBuilder = require("../../builders/buildComplexDataStructures");
const fs = require("fs");
//will contain all insert/upsert logic from data that is generated and synthesized

/*
      dataResults = datastructuresBuilder.generateDemographic_Record(modifiedTuples, count, state, sending_app, sending_fac)
      dataResults.forEach(line=>{
        fs.appendFileSync('person-demographics.csv', line, 'utf8')
      })
      res.send(dataResults)
*/

router.get("/datastructure/:datastructurename", async(req, res) => {
    req.query.count;
    req.query.type;
    const count = req.query.count || 5000;
    if (count > 5000)
    {
       let count = 5000;
    }
    const datastructurename = req.query.datastructurename || "Person Demographics";
    res.setHeader("Content-Type", "text/plain");
    dataResults = datastructuresBuilder.buildComplexDataStructure(datastructurename,count);
    res.send(dataResults);
});

module.exports = router;
