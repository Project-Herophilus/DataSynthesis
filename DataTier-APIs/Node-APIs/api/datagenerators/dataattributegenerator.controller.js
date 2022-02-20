//const db= require("../../general/connectors/dbConnections/mysqlConnect")
const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('../../general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const datasattributesGenerator = require("../../builders/buildDataAttributes");
const fs = require("fs");

router.get("/addresses", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  //DOC TYPE = ADT
  const table = req.query.table;
  const limit = req.query.limit || 1000;
 
  db.query(queryBuilder.getDataFromTable(table, limit), (err, rows, fields)=>{
      if(err) throw err;
    const results = datasattributesGenerator.generateAddress_Record_US(rows.rows)
    res.json(results)
  })

});

router.get("/phone-numbers", async(req, res) => {
    const number_of_phone_numbers = parseInt(req.query.count) || 1000;
    const country = req.query.country || "US";
    const results = datasattributesGenerator.generateUSPhoneNumbers(number_of_phone_numbers, country)
    res.json(results)
  
  });

module.exports = router;
