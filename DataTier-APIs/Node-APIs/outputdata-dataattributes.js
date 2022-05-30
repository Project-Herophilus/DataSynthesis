// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
dotenv.config({ path: path.resolve(__dirname, './.env') })
const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('./general/functions/datatier/reusableQueries');
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
var dataattributeName;
let systemOutputName;
// Global Variable for usage in platform
global.__basedir = __dirname;

dataattributeName = args[0];
const regularExp ='';
const appName="DataSynthesis";
const appGUID=uuid.v4();
const runQuantity = 5000;
componentName = "buildDataAttriubutes";
// Set Start Value for timing
let startTime = new Date();
methodName ="buildDataAttributes_"+dataattributeName.replace(/\s/g, "");

/*
 *  Code Method to Return Data
 */

if(dataattributeName=='accountnumber')
{
    console.log("Invoking Data Generator for Account Numnbers with generic regex")
    // Mixed Regex: ^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$
    // Number Regex: ^[0-9]{9}$
    accountnumbersDtl = buildDataAttributes.generateAccountNumbers("^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$", 500)
    dataOutputting.processDataOutput(accountnumbersDtl, methodName);
}

/*
 *   Error is invocation with rows error
 */
if(dataattributeName=='address-us')
{
    console.log("Invoking generate Addresses US")
    addressDtl = buildDataAttributes.generateAddress_Record_US(500)
    dataOutputting.processDataOutput(addressDtl, methodName);
}
if(dataattributeName=='bankaccounts')
{
    // Number Regex: ^[0-9]{9}$
    console.log("Invoking generate Bank Accounts")
    bankaccountDtl = buildDataAttributes.generateBankAccounts("^[0-9]{9}$",500)
    dataOutputting.processDataOutput(bankaccountDtl, methodName);
}

/*
 *   Error is imsg.join is not a function error
 */

if(dataattributeName=='creditcard')
{
    console.log("Invoking generate Credit Cards")
    // Need to automatically select one credit card randomly
    /*for (let i = 0; i < 20; i++)
    {
        const randomIndex = Math.floor(Math.random() * (2 - 0) + 0);
        const randomSelection = {
            0: `A`,
            1: `B`
        }
        console.log("Value Returned: "+randomSelection[randomIndex]);
    }*/

    /*const randomIndex = Math.floor(Math.random() * (4 - 0) + 0);
    const randomSelection = {
        0: `Visa`,
        1: `Mastercard`,
        2: 'Discover',
        3: 'Visa'
    }
    return randomSelection[randomIndex];
    */
    creditcardDtl = buildDataAttributes.generateCreditCards(5000)
    dataOutputting.processDataOutput(creditcardDtl, methodName);
}

if(dataattributeName=='dob')
{
    console.log("Invoking generate Date of Birth")
    dobDtl = buildDataAttributes.generateDateOfBirths(1950,500)
    dataOutputting.processDataOutput(dobDtl, methodName);
}

if(dataattributeName=='dln')
{
    console.log("Invoking generate Date of Birth")
    dobDtl = buildDataAttributes.generateDLN(1,500)
    dataOutputting.processDataOutput(dobDtl, methodName);
}

if(dataattributeName=='ein')
{
    console.log("Invoking generate EIN - Employer Identification Number")
    dobDtl = buildDataAttributes.generateEIN(5000)
    dataOutputting.processDataOutput(dobDtl, methodName);
}

if(dataattributeName=='phonenumber-us')
{
    console.log("Invoking generate Phone Number - US")
    phonenumberDtl = buildDataAttributes.generatePhoneNumbersUS("us",5000)
    dataOutputting.processDataOutput(phonenumberDtl, methodName);
}

if(dataattributeName=='phonenumber-intl')
{
    console.log("Invoking generate Phone Number - Intl")
    phonenumberDtl = buildDataAttributes.generatePhoneNumbersIntl("uk",5000)
    dataOutputting.processDataOutput(phonenumberDtl, methodName);
}

if(dataattributeName=='serialnumbers')
{
    console.log("Invoking generate Serial Numbers")
    // Mixed Regex: ^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$
    // Number Regex: ^[0-9]{9}$
    serialNumberDtl = buildDataAttributes.generateSerialNumbers_Basic(500)
    //serialNumberDtl = buildDataAttributes.generateSerialNumbers_Complex(5000)
    dataOutputting.processDataOutput(serialNumberDtl, methodName);
}

if(dataattributeName=='ssn')
{
    console.log("Invoking generate SSN")
    socialsecurityDtl = buildDataAttributes.generateSSN(500)
    dataOutputting.processDataOutput(socialsecurityDtl, methodName);
}

if(dataattributeName=='useridentities')
{
    //0: `^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$`,
    //1: `^[0-9]{9}$`
    console.log("Invoking generate User Identities")
    useridentityDtl = buildDataAttributes.generateUserIdentities('[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',500)
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