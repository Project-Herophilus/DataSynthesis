// Include all APIs and components to pull data
const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('./general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const datastructuresGenerated = require("./builders/buildDataAttributes");
const fs = require("fs");

//Outputs
const topicOutput = require("./connectivity/systems/connectors/datasynthesis/kafka-injector")
const topicName="generatedData";

let transactionCount = 20
// Write Directly to Topic all the data as one transaction
//topicOutput(topicName,datastructuresGenerated.generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',transactionCount))
// Write the data per transaction and persist it to the topic
datastructuresGenerated.generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',transactionCount)
.forEach(msg=>{
    const dataObject = {"date":new Date(),"serialnumber":msg}
    //topicOutput(topicName,msg)
    topicOutput(topicName,dataObject)
})