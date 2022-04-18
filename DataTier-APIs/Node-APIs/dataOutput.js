// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
dotenv.config({ path: path.resolve(__dirname, './.env') })
const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('./general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("./builders/buildDataAttributes");
const buildComplexDataStructures = require("./builders/buildComplexDataStructures");
const fs = require("fs");

//Outputs
const topicOutput = require("./connectivity/general/connectors/kafka-producer");
const { data } = require('./general/functions/general/randomFunctions');
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
let datastructureName;
let systemOutputName;

//console.log(crypto.randomUUID());
//console.log(`Here is a test v4 uuid: ${uuid.v4()}`);

//datastructureName ="Person Demographics";
datastructureName ="Complete Name";
//datastructureName ="US Address";
//datastructureName ="Bank Account";
//datastructureName ="US Phone Number";

const appName="DataSynthesis";
const appGUID=uuid.v4();
componentName = "buildComplexDataStructures";
methodName ="buildComplexDataStructure_"+datastructureName.replace(/\s/g, "");

buildComplexDataStructures.buildComplexDataStructure(datastructureName, 5000).then(resp=>{
    const finalDataOutPut = []
    resp.forEach(msg=>{
        const dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
            "componentName": componentName,"methodName": methodName,"data":msg}
        finalDataOutPut.push(dataObject)
    })
    externalizeDataOutput(finalDataOutPut, outputType)
})
.catch(err=>{
    console.log(err)})

const externalizeDataOutput = function(dataoutput, adapter){

    systemOutputName = datastructureName.replace(/\s/g, "");
    if (adapter=="kafka")
    {
        dataoutput.forEach(msg=>{
            topicOutput(topicName,msg)
        })
    }
    if (adapter=="file")
    {
        dataoutput.forEach(msg=>{
            fs.appendFileSync(componentName+'_'+systemOutputName+'.dat', JSON.stringify(msg)+"\n", (err) => {
                if (err) { console.log(err); }
            });
        })
    }
}

