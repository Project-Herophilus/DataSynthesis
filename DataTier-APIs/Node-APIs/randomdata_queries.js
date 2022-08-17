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

// Global Variable for usage in platform
global.__basedir = __dirname;

async function queryFunction() {
    sqlQuery = queryBuilder.getDataFromTable('dataexisting_ababanking',5000);
    console.log(sqlQuery)
    results1 = await dbQueries.RunSpecificQuery(sqlQuery);
    return results1;
}


let outputType = config.outputAdapter;
let componentName;
let methodName;
var dataattributeName;
var runCount;

let systemOutputName;
const args = process.argv.slice(2);

const appName="DataSynthesis";
const appGUID=uuid.v4();

dataattributeName = args[0];
runCount = args[1];

// Set Start Value for timing
let auditEventMessage ="";
let startTime = new Date();
const runQuantity = process.env.runQuantity;
componentName = "buildDataAttriubutes";
methodName ="randomQoery_"+dataattributeName;

const queryResults = [];
if(dataattributeName=='ababanking')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }

    //dataOutputting.processDataOutput(randomQueryDtl, methodName, requestGUID);
    queryFunction().then(resp=>{
        //console.log(resp)
        console.log(queryResults)
        resp.rows.forEach(row=> {
           //console.log(row.ababankingid)
            const dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
                "componentName": componentName,"methodName": methodName,"data":row.ababankingid}
            queryResults.push(JSON.stringify(dataObject))
        })
        }
        //dataOutputting.processDataOutput(accountnumbersDtl, methodName, requestGUID);
    )
    //console.log(queryResults);
}

