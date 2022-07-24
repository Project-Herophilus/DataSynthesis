// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
dotenv.config({ path: path.resolve(__dirname, './.env') })
//const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const db = require("./connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('./general/datatier/reusableQueries');
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("./builders/buildDataAttributes");
const buildComplexDataStructures = require("./builders/buildComplexDataStructures");
const auditing = require("./general/platform/auditing");
const fs = require("fs");
const dataOutputting = require("./general/platform/dataOutput")
//Outputs
const topicOutput = require("./connectivity/general/connectors/kafka-producer");
const { data } = require('./general/functions/general/randomFunctions');
const topicName="generatedData";

let outputType = config.outputAdapter;
let componentName;
let methodName;
let datastructureName;
let systemOutputName;
// Global Variable for usage in platform
global.__basedir = __dirname;

const args = process.argv.slice(2);

/* DataStructureName
 * This must match the name in the platform_datastructures table from the field
 * datastructurename
 */
//datastructureName ="Person Demographics";
//datastructureName ="Complete Name";
//datastructureName ="US Address";
//datastructureName ="Bank Account";

datastructureName = args[0];
if (datastructureName  == null)
{
    datastructureName  = "Person Demographics";
}

const appName="DataSynthesis";
const appGUID=uuid.v4();
const runQuantity = process.env.runQuantity;
componentName = "buildComplexDataStructures";
// Set Start Value for timing
let startTime = new Date();
// Call Method
methodName ="buildComplexDataStructure_"+datastructureName.replace(/\s/g, "");

/*
 * Code Method to Return Data
 */
buildComplexDataStructures.buildComplexDataStructure(datastructureName, runQuantity).then(resp=>{
    const finalDataOutPut = []
    resp.forEach(msg=>{
        const dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
            "componentName": componentName,"methodName": methodName,"data":msg}
        finalDataOutPut.push(JSON.stringify(dataObject))
    })
    // endTime = new Date();
    // Auditing - Publish
    // auditing.generate_auditrecord(runQuantity,componentName,appName,startTime,endTime);
    // Auditing Values
    // startTime = new Date();
    // Output Record
    //externalizeDataOutput(finalDataOutPut, outputType)
    dataOutputting.processDataOutput(finalDataOutPut, methodName);
    // Audit
    // endTime = new Date();
    // componentName = "DataOutput";
    // auditing.generate_auditrecord(runQuantity,componentName,appName,startTime,endTime);
})
.catch(err=>{
    console.log(err)
})

