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
const auditing = require("./general/functions/auditing");
const fs = require("fs");
const dataOutputting = require("./general/functions/general/dataOutput")
//Outputs
const topicOutput = require("./connectivity/general/connectors/kafka-producer");
const { data } = require('./general/functions/general/randomFunctions');
const topicName="generatedData";
const args = process.argv.slice(2);
let outputType = config.outputAdapter;
let componentName;
let methodName;
let dataattributeName;
let systemOutputName;

/* DataAttributeName or DataAttributeNames
 * Single dataattributeName =['']
 * Multiple dataattributeName = ['',''];
 */
//dataattributeName = ['accountnumber'];
//dataattributeName = 'address_us';
dataattributeName = args[0];
const regularExp ='';
//const dataattributeName = ['',''];

const appName="DataSynthesis";
const appGUID=uuid.v4();
const runQuantity = 5000;

componentName = "buildDataAttriubutes";
// Set Start Value for timing
let startTime = new Date();
// Call Method
methodName ="buildDataAttributes_"+dataattributeName.replace(/\s/g, "");
/*
 * Code Method to Return Data
 */

if(dataattributeName=='accountnumber')
{
    buildDataAttributes.generateAccountNumbers(regularExp,runQuantity).then(resp=>{
        const finalDataOutPut = []
        resp.forEach(msg=>{
            const dataObject = {"date":new Date(),"applicationName":appName,"appGUID":appGUID,
                "componentName": componentName,"methodName": methodName,"data":msg}
            finalDataOutPut.push(dataObject)
        })
        endTime = new Date();
        // Auditing - Publish
        auditing.generate_auditrecord(runQuantity,componentName,appName,startTime,endTime);
        // Auditing Values
        startTime = new Date();
        // Output Record
        //externalizeDataOutput(finalDataOutPut, outputType)
        dataOutputting.processDataOutput(finalDataOutPut, datastructureName);
        // Audit
        endTime = new Date();
        componentName = "DataOutput";
        auditing.generate_auditrecord(runQuantity,componentName,appName,startTime,endTime);
    })
        .catch(err=>{
            console.log(err)
        })
}
if(dataattributeName=='ssn')
{
        console.log("Invoking generateSSN")
        social_security_numbers = buildDataAttributes.generateSSN(500)
        dataOutputting.processDataOutput(social_security_numbers, methodName);

}

// console.log(generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',10));
// console.log(generateSerialNumbers_Complex(10));
// console.log(module.exports.generateSSN(10))
// console.log(module.exports.generateEIN(10))
// console.log(module.exports.generateDateOfBirths(1960, 10))
// console.log(module.exports.generateCreditCards(12,'Discover'))
// console.log(module.exports.generateDLN('blah','blah'))
// console.log(module.exports.generateAccountNumbers('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25))
// console.log(module.exports.generateUserIdentities('^[%#@&]{1}[A-Z]{3}[%#@&]{1}[0-9]{1}[A-Z]{2}$',25))
// console.log(module.exports.generateIntlPhoneNumbers('in',1000))