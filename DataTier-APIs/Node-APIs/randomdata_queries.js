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
let componentName;
let methodName;
var dataattributeName;
var runCount;

let systemOutputName;

const appName="DataSynthesis";
const appGUID=uuid.v4();



// Set Start Value for timing
let auditEventMessage ="";
let startTime = new Date();
const runQuantity = process.env.runQuantity;
componentName = "buildDataAttriubutes";
methodName ="randomQoery_"+dataattributeName;

const queryResults = [];
let dataObject = {};
if(dataattributeName=='banking')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }

    //dataOutputting.processDataOutput(randomQueryDtl, methodName, requestGUID);
    queryFunction().then(resp=>{
        //console.log(resp)
        console.log(resp.rows)
        if (mode=='batch'){
            console.log('mode')
            dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
            "componentName": componentName,"methodName": methodName,"data":resp.rows}
            queryResults.push(JSON.stringify(dataObject))
            dataOutputting.processDataOutput(queryResults, methodName, appGUID)
            return dataObject
        }
        if (mode=='transactional'){
            resp.rows.forEach(row=>{
                dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
                "componentName": componentName,"methodName": methodName,"data":row}
            })
            queryResults.push(JSON.stringify(dataObject))
            dataOutputting.processDataOutput(queryResults, methodName, appGUID)
        }
    })
        // dataOutputting.processDataOutput(accountnumbersDtl, methodName, requestGUID);

}

