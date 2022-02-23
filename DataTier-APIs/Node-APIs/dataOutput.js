// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const config = process.env
dotenv.config({ path: path.resolve(__dirname, './.env') })
const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('./general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("./builders/buildDataAttributes");
const buildComplexDataStructure = require("./builders/buildComplexDataStructures");
const fs = require("fs");

//Outputs
const topicOutput = require("./connectivity/general/connectors/kafka-producer")
const topicName="generatedData";

let transactionCount = 20
// Write Directly to Topic all the data as one transaction
//topicOutput(topicName,datastructuresGenerated.generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',transactionCount))
// Write the data per transaction and persist it to the topic
// datastructuresGenerated.generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',transactionCount)
// .forEach(msg=>{
//     const dataObject = {"date":new Date(),"serialnumber":msg}
//     //topicOutput(topicName,msg)
//     topicOutput(topicName,dataObject)
// })

let outputType = config.outputAdapter;
let componentName;
let methodName;

const appName="DataSynthesis";
const appGUID=""
/*let dataObjectResponse = [];
dataObjectResponse = buildComplexDataStructure.buildComplexDataStructure("Person Demographics", 5000);
console.log(outputType)
console.log(dataObjectResponse )
if (outputType == "kafka") {
    for (let i = 0; i < dataObjectResponse.length; i++) {
        console.log(dataObjectResponse[i].toString());
    }
}*/
componentName = "buildComplexDataStructure";
methodName ="PersonDemographics";
    buildComplexDataStructure.buildComplexDataStructure("Person Demographics", 5000).then(resp=>{
        console.log("hello")
        resp.forEach(msg=>{
            const dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
                "componentName": componentName,"methodName": methodName,"Person Demographics":msg}
            //console.log(dataObject)
            if (outputType=="kafka")
            {
                //const dataObject = {"date":new Date(),"Person Demographics":msg}
                topicOutput(topicName,dataObject)
            }
            if (outputType=="file")
            {
                fs.appendFileSync(componentName+'_'+methodName+'.dat', JSON.stringify(dataObject)+"\n", (err) => {
                    if (err) { console.log(err); }
                });
            }
        })
        //.catch(err=>{
        //console.log(err)
    })

