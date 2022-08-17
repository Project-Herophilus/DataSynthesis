const dbConnection = require("./connectivity/general/connectors/dbConnections/dbGenericConnector")
const dbQueries = require('./general/datatier/dbQueries');
const express = require("express");
const router = express.Router();
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
const auditing = require("./general/platform/auditing");
const fs = require("fs");
const dataOutputting = require("./general/platform/dataOutput")
const { data } = require('./general/functions/general/randomFunctions');
//Outputs
const topicOutput = require("./connectivity/general/connectors/kafka-producer");
const db = require("./general/datatier/dbQueries");
const queryBuilder = require("./general/datatier/reusableQueries");
const queryProcessor = require("./general/datatier/dbQueries");
const { processDataOutput } = require("./general/platform/dataOutput");

// Global Variable for usage in platform
global.__basedir = __dirname;
const args = process.argv.slice(2);
dataattributeName = args[0];
runCount = args[1];
mode = args[2];

async function queryFunction() {
    sqlQuery = queryBuilder.getDataFromTable(input_table_mapping[dataattributeName],runCount);
    results1 = await dbQueries.RunSpecificQuery(sqlQuery)
    return results1;
}
const input_table_mapping = {
    "lastname": "dataexisting_namelast",
    "firstname": "dataexisting_namefirst",
    "banking": "dataexisting_ababanking"
}


let outputType = config.outputAdapter;
var dataattributeName;
var runCount;

let systemOutputName;
const appName="DataSynthesis";
const appGUID=uuid.v4();

// Set Start Value for timing
let auditEventMessage ="";
let startTime = new Date();
const runQuantity = process.env.runQuantity;
let componentName = "randomizedQuery";
let methodName ="randomQuery_"+dataattributeName;


    const queryResults = [];
    let dataObject = {};

    queryFunction().then(resp=>{
        //console.log(resp.rows)
        if (mode=='batch'){
            dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
                "componentName": componentName,"methodName": methodName,"data":resp.rows}
            queryResults.push(JSON.stringify(dataObject))
            dataOutputting.processDataOutput(queryResults, methodName, appGUID)
            return dataObject
        }
        if (mode=='transactional'){
            //console.log(resp)
            resp.rows.forEach(row=>{
                //dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
                //    "componentName": componentName,"methodName": methodName,"data":row.lastnameid};
                queryResults.push(row)
                dataOutputting.processDataOutput(queryResults, methodName, appGUID)
                //console.log(row.data)
            })
        }
    })


// to run from prompt
// 1. ensure datasynthesis env variables are set
// 2. to run a query to randomly return 20 firstnames and send in a single message delivery format
// node randomdata_queries.js firstname 20 transactional
