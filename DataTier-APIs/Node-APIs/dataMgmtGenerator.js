// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const config = process.env
dotenv.config({ path: path.resolve(__dirname, '.env') })
const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('./general/functions/datatier/query-builder');
const queryProcessor = require('./general/functions/datatier/dbQueries');
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("./builders/buildDataAttributes");
const buildComplexDataStructure = require("./builders/buildComplexDataStructures");
const fs = require("fs");
const datasattributesGenerator = require("./builders/buildDataAttributes");
const rng = require("./builders/numberGenerators");
const dbConnection = require("./connectivity/general/connectors/dbConnections/postgresqlConnect");
const auditingDetail = require("./general/functions/auditing")
const dataGenConfigurationDetails = [];

function intervalFunc() {
    console.log('Retrieving Information Needed for Data Generation');
    auditingDetail.generate_auditrecord(1,"a","b");
    /*tablename ="platform_config_datagen";
    dataObjectResponse = queryBuilder.getDataGenConfig(tablename);
    console.log(dataObjectResponse);
    //dataQuery = queryProcessor.RecordSpecificResponse(dataObjectResponse);
    const dataQuery = queryProcessor.RunSpecificQuery(dataObjectResponse);
    console.log(dataQuery.toString());*/
    // 600000 ms in 10 minutes
}

setInterval(intervalFunc, 1500);


