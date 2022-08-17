//const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('../../general/datatier/reusableQueries');
const express = require("express");
const router = express.Router();
const dataattributesGenerator = require("../../builders/buildDataAttributes");
const fs = require("fs");

router.get("/addresses", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  //DOC TYPE = ADT
  const table = req.query.table;
  const limit = req.query.limit || 1000;
  const results = await dataattributesGenerator.generateAddress_Record_US(limit)
  res.json(results)

});

router.get("/phonenumbers-us", async(req, res) => {
    const number_of_phone_numbers = parseInt(req.query.count) || 1000;
    const country = req.query.country || "US";
    const results = dataattributesGenerator.generateUSPhoneNumbers(number_of_phone_numbers, country)
    res.json(results)
  
  });

module.exports = router;
