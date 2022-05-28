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

async function intervalFunc() {
    console.log('Retrieving Information Needed for Data Generation');
    // auditingDetail.generate_auditrecord(1,"a","b");
    //tablename ="platform_config_datagen";
    sql_string = queryBuilder.getDataGenConfig();
    //loop through each dataconfig and establsish data attribute and data attribute generation
    //dataQuery = queryProcessor.RecordSpecificResponse(dataObjectResponse);
    const results = await queryProcessor.RunSpecificQuery(sql_string)
    return results
}
intervalFunc().then(resp=>{
    //console.log(resp)
    //const mgmtDataGeneration = [];
    //const res =resp.responseText
    /*for (const keyData in resp)
    {
        console.log("Config ID:"+keyData.datagenconfigid)
    }*/
    resp.rows.forEach(row=>{
       console.log("Data Generation Config: "+resp.row.datagenconfigid)
       //console.log(resp.datatypegenconfigname)
    })

})

// Run This on an interval the timeout amount is in milliseconds so 10000 is 10 seconds
setInterval(intervalFunc,10000)

