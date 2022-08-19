const dbConnection = require("./connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('./general/datatier/reusableQueries');
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
const express = require("express");
const router = express.Router();
const hl7Builder = require("./builders/buildmsgHL7");
const fs = require("fs");
const dataOutputting = require("./general/platform/dataOutput")
const { data } = require('./general/functions/general/randomFunctions');
//Outputs
const topicOutput = require("./connectivity/general/connectors/kafka-producer");
// Global Variable for usage in platform
global.__basedir = __dirname;

let outputType = config.outputAdapter;
let componentName;
let methodName;
var dataattributeName;
var runCount;

let systemOutputName;
const args = process.argv.slice(2);

const appName="DataSynthesis";
const requestGUID=uuid.v4();

dataattributeName = args[0];
runCount = args[1];
processUSState = args[2];
hl7message = args[3];
hl7event = args[4];
// Set Start Value for timing
let auditEventMessage ="";
let startTime = new Date();
const runQuantity = process.env.runQuantity;
componentName = "generate-industrystd";
methodName ="generate-hl7";

let dataResults;

if (dataattributeName =='hl7')
{
    const doc_type = hl7message;
    //TRIGGER EVENT = AO1,AO8,AO3
    const trigger_event = hl7event;
    const count = runCount;
    const state = processUSState;
    const sending_app = "datasynthesis";
    const sending_fac = "datafacility"

    dbConnection.query(queryBuilder.getData(count, state), (err, rows, fields)=>{
        if(err) throw err;
        const tuples = [];
        const modifiedTuples = [];
        rows.forEach((row,i)=>{
            row.rows.forEach((object, index)=>{
                if(tuples.length <= index){
                    tuples[index] = []
                    tuples[index].push(object)
                }
                else {
                    tuples[index].push(object)
                }
            })

        })
        tuples.forEach(record=>{
            modifiedTuples.push(record.reduce(function(result, current){
                return Object.assign(result,current)
            }, {}))
        })
        dataResults = hl7Builder.generateHL7_Record(modifiedTuples, doc_type, trigger_event, count, state, sending_app, sending_fac)
        console.log("dataresults" + dataResults)
        fs.writeFileSync('industrystds-test.hl7', dataResults.toString(), 'utf8')
        //res.send(dataResults)
    })
}

// to run from prompt
// 1. ensure datasynthesis env variables are set
// 2. Generate 10 HL7 ADT A01
// node generatedata_hl7.js hl7 10 TX ADT A01
