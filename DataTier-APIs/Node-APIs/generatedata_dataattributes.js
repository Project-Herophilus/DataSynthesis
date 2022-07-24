// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
//dotenv.config({ path: path.resolve(__dirname, './.env') })
//const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const db = require("./connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('./general/datatier/reusableQueries');
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("./builders/buildDataAttributes");
const auditing = require("./general/platform/auditing");
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
const appGUID=uuid.v4();

dataattributeName = args[0];
runCount = args[1];

// Set Start Value for timing
let auditEventMessage ="";
let startTime = new Date();
const runQuantity = 5000;
componentName = "buildDataAttriubutes";
methodName ="buildDataAttributes_"+dataattributeName.replace(/\s/g, "");

/*
 *
 * Code Methods to Return Data
 *
 * Mixed Regex: ^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$
 * Number Regex: ^[0-9]{9}$
 *
 */

/*
 *  This works on command line options to run:
 *  This example invokes the node base data generator for data attributes
 *  Below this example will create accountnumbers with one of two random regular expressions
 *  if no second argument is specified then the const runQuantity value is used
 *  (currently set by default is 5000)
 *  Example:    node generatedata_dataattributes.js accountnumber
 *  This example will create 525 accountnumbers with one of two random regular expressions
 *  Example:    node generatedata_dataattributes.js accountnumber 525
 */

if(dataattributeName=='accountnumbers')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    var randomValues = ["^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$","^[0-9]{9}$"];
    var randomValueSelection = randomValues[Math.floor(Math.random()*randomValues.length)];
    auditEventMessage ="Invoking Data Generator for  "+ runCount+" Account Numbers"
    auditEventMessage = auditEventMessage +" with Random Value Used for Generation: "+randomValueSelection;
    console.log(auditEventMessage);
    accountnumbersDtl = buildDataAttributes.generateAccountNumbers(randomValueSelection, runCount)
    dataOutputting.processDataOutput(accountnumbersDtl, methodName);
}

/*
 *   row.forEach not a function
 *
 */
if(dataattributeName=='address-us')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage ="Invoking Data Generator for "+ runCount+" US based addresses"
    console.log(auditEventMessage)
    buildDataAttributes.generateAddress_Record_US(runCount).then(resp=>{
        dataOutputting.processDataOutput(resp, methodName);
    })
}
if(dataattributeName=='bankaccounts')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage ="Invoking Data Generator for "+ runCount+" Bank Accounts"
    console.log(auditEventMessage)
    bankaccountDtl = buildDataAttributes.generateBankAccounts("^[0-9]{9}$",runCount)
    dataOutputting.processDataOutput(bankaccountDtl, methodName);
}

if(dataattributeName=='creditcards')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    var randomValues = ["Visa","Mastervard","Discover","AMEX"];
    var randomValueSelection = randomValues[Math.floor(Math.random()*randomValues.length)];
    auditEventMessage ="Invoking Data Generator for "+ runCount+" Credit Cards with random selected Card: "+randomValueSelection;
    console.log(auditEventMessage)
    creditcardDtl = buildDataAttributes.generateCreditCards(runCount,randomValueSelection)
    dataOutputting.processDataOutput(creditcardDtl, methodName);
}

if(dataattributeName=='dobs')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage = "Invoking Data Generator for "+ runCount+" Date of Births"
    console.log(auditEventMessage)
    dobDtl = buildDataAttributes.generateDateOfBirths(1950,runCount)
    dataOutputting.processDataOutput(dobDtl, methodName);
}

if(dataattributeName=='dlns')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage ="Invoking Data Generator for "+ runCount+" US Drivers Licenses "
    console.log(auditEventMessage)
    dobDtl = buildDataAttributes.generateDLN(runCount,"")
    dataOutputting.processDataOutput(dobDtl, methodName);
}

if(dataattributeName=='eins')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage ="Invoking Data Generator for "+ runCount+" EIN - Employer Identification Numbers"
    console.log(auditEventMessage)
    dobDtl = buildDataAttributes.generateEIN(runCount)
    dataOutputting.processDataOutput(dobDtl, methodName);
}

if(dataattributeName=='phonenumber-us')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage="Invoking Data Generator for "+ runCount+" US Phone Numbers"
    console.log(auditEventMessage)
    phonenumberDtl = buildDataAttributes.generatePhoneNumbersUS("us",runCount)
    dataOutputting.processDataOutput(phonenumberDtl, methodName);
}

if(dataattributeName=='phonenumber-intl')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage ="Invoking Data Generator for "+ runCount+" Intl Phone Numbers"
    console.log(auditEventMessage)
    phonenumberDtl = buildDataAttributes.generatePhoneNumbersIntl("uk",runCount)
    dataOutputting.processDataOutput(phonenumberDtl, methodName);
}

if(dataattributeName=='serialnumbers')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    var randomValues = ["^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$","^[0-9]{9}$"];
    var randomValueSelection = randomValues[Math.floor(Math.random()*randomValues.length)];
    auditEventMessage="Invoking Data Generator for "+ runCount+" Serial Numbers with random value:"+ randomValueSelection;
    console.log("Invoking Data Generator for "+ runCount+" Social Security Numbers")
    console.log("Random Value Used for Generation: "+randomValueSelection)
    serialNumberDtl = buildDataAttributes.generateSerialNumbers_Basic(randomValueSelection,runCount)
    //serialNumberDtl = buildDataAttributes.generateSerialNumbers_Complex(5000)
    dataOutputting.processDataOutput(serialNumberDtl, methodName);
}

if(dataattributeName=='ssns')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    auditEventMessage="Invoking Data Generator for "+ runCount+" Social Security Numbers";
    console.log(auditEventMessage)
    socialsecurityDtl = buildDataAttributes.generateSSN(runCount)
    dataOutputting.processDataOutput(socialsecurityDtl, methodName);
}

if(dataattributeName=='useridentities')
{
    if(runCount==null)
    {
        runCount = runQuantity;
    }
    var randomValues = ["^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$","^[0-9]{9}$"];
    var randomValueSelection = randomValues[Math.floor(Math.random()*randomValues.length)];
    auditEventMessage="Invoking Data Generator for "+ runCount+" User Identities with random value:"+ randomValueSelection;
    console.log(auditEventMessage)
    useridentityDtl = buildDataAttributes.generateUserIdentities(randomValueSelection,runCount)
    dataOutputting.processDataOutput(useridentityDtl, methodName);

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