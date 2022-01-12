//const db = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../general/connectors/dbConnections/postgresqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");

module.exports = {
    /*
     *  Data Upsert
     *  We will use persist and check values we persist against the database and either insert them or not
     *
     */
    geneticUpsert(rows, sending_app, sending_fac) {
    }
}
module.exports = router;