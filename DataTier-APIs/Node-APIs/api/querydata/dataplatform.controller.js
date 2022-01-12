//const db = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
let rdbmsType = process.env.rdbms;

module.exports = router;
