//const db= require("../../general/connectors/dbConnections/mysqlConnect")
const db= require("../../general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('../../general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const datastructuresGenerated = require("../../builders/buildDataGenerated");
const fs = require("fs");

router.get("/addresses", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  //DOC TYPE = ADT
  const table = req.query.table;
  const limit = req.query.limit || 1000;
 
  db.query(queryBuilder.getDataFromTable(table, limit), (err, rows, fields)=>{
      if(err) throw err;
    const results = datastructuresGenerated.generateAddress_Record_US(rows.rows)
    res.json(results)
  })

});

module.exports = router;
