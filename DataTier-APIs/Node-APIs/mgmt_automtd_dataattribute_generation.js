// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const config = process.env
dotenv.config({ path: path.resolve(__dirname, '.env') })
//const db = require("./connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("./connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('./general/datatier/reusableQueries');
const queryProcessor = require('./general/datatier/dbQueries');
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("./builders/buildDataAttributes");
const buildComplexDataStructure = require("./builders/buildComplexDataStructures");
const fs = require("fs");
const datasattributesGenerator = require("./builders/buildDataAttributes");
const rng = require("./builders/numberGenerators");
const auditingDetail = require("./general/platform/auditing")
const dataGenConfigurationDetails = [];
// Global Variable for usage in platform
global.__basedir = __dirname;

async function datagenerationConfigFunction_WithDataGenType() {
    sqlQuery1 = queryBuilder. getDataGenConfig_WithDataGenTypeRelationship();
    results1 = await queryProcessor.RunSpecificQuery(sqlQuery1);
    //results = results1+results2;
    return results1;
}

async function datagenerationConfigFunction_WithOutDataGenType() {
    sqlQuery2 = queryBuilder. getDataGenConfig_WithoutDataGenTypeRelationship();
    results2 = await queryProcessor.RunSpecificQuery(sqlQuery2);
    //results = results1+results2;
    return results2;
}

/*
 *
 *  This processes all the data returned from the async function
 *  datagenerationConfigFunction_WithDataGenType
 *
 */
datagenerationConfigFunction_WithDataGenType().then(resp=>{
    // log entire respose
    //console.log(resp)
    console.log('Retrieving Information Needed for Data Generation');
    resp.rows.forEach(row=>{
        // Only Active Records
        if (row.statusid = 1)
        {
            /*
             *   Use this to see the detailed data coming back from the data model

            console.log('Record Details for Data Generation');
            console.log('----------------------------------');
            console.log("Data Generation Config ID: "+ row.datagenconfigid)
            console.log("Data Generation Type Desc: "+ row.datagentypedescription)
            console.log("Data Attribute: "+ row.dataattributeid)
            console.log("Data Attribute Name: "+ row.dataattributename)
            console.log("DataType: "+ row.datagentypeid)
            console.log("Data Type Config Name: "+row.datatypegenconfigname)
            console.log("Defintion: "+ row.definition)
            console.log("Application ID: "+ row.applicationid)
            console.log('----------------------------------');
            console.log('Invoking Data Attribute Building Based on Data Configured for Generation');
            console.log('');
            */
            console.log("Data Attribute ID: "+ row.dataattributeid);
            strAttribute = null;
            strAttribute = row.dataattributeid;
            if (strAttribute == 14)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Account Numbers');
            }
            if (strAttribute == 7)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Bank Accounts');
            }
            if (strAttribute == 6)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Credit Cards');
            }
            if (strAttribute == 15)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': User Identities');
            }
            if (strAttribute == 9)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Drivers License Number');
            }
            /*
             *  Need to create entries in platform_config_datagen for the following
             */
            if (strAttribute == 3)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Addresses');
            }
            if (strAttribute == 8)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Date of Birth');
            }
            if (strAttribute == 13)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Employer Identification Number');
            }
            if (strAttribute == 5)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': US Phone Number');
            }
           /*
           * Need to create entry for in dataattributes
           * if (strAttribute.equals("Serial Number"))
            {

            }*/
            if (strAttribute == 10)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Social Security Number');
            }
            if (strAttribute == 17)
            {
                console.log('Data Generation ID# :'+row.datagenconfigid+
                    ' Generating Data for Data Attribute #: '+strAttribute+ ': Intl Phone Numbers');
            }
        }
    })
})
/*
 *
 *  This processes all the data returned from the async function
 *  datagenerationConfigFunction_WithOutDataGenType
 *
 */
datagenerationConfigFunction_WithOutDataGenType().then(resp=> {
    // log entire respose
    //console.log(resp)
    console.log('Retrieving Information Needed for Data Generation');
    resp.rows.forEach(row => {
        // Only Active Records
        if (row.statusid = 1) {
            /*
             *   Use this to see the detailed data coming back from the data model

            console.log('Record Details for Data Generation');
            console.log('----------------------------------');
            console.log("Data Generation Config ID: "+ row.datagenconfigid)
            console.log("Data Generation Type Desc: "+ row.datagentypedescription)
            console.log("Data Attribute: "+ row.dataattributeid)
            console.log("Data Attribute Name: "+ row.dataattributename)
            console.log("DataType: "+ row.datagentypeid)
            console.log("Data Type Config Name: "+row.datatypegenconfigname)
            console.log("Defintion: "+ row.definition)
            console.log("Application ID: "+ row.applicationid)
            console.log('----------------------------------');
            console.log('Invoking Data Attribute Building Based on Data Configured for Generation');
            console.log('');
            */
            console.log("Data Attribute ID: " + row.dataattributeid);
            strAttribute = null;
            strAttribute = row.dataattributeid;
            if (strAttribute == 14) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Account Numbers');
            }
            if (strAttribute == 7) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Bank Accounts');
            }
            if (strAttribute == 6) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Credit Cards');
            }
            if (strAttribute == 15) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': User Identities');
            }
            if (strAttribute == 9) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Drivers License Number');
            }
            /*
             *  Need to create entries in platform_config_datagen for the following
             */
            if (strAttribute == 3) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Addresses');
            }
            if (strAttribute == 8) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Date of Birth');
            }
            if (strAttribute == 13) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Employer Identification Number');
            }
            if (strAttribute == 5) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': US Phone Number');
            }
            /*
            * Need to create entry for in dataattributes
            * if (strAttribute.equals("Serial Number"))
             {

             }*/
            if (strAttribute == 10) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Social Security Number');
            }
            if (strAttribute == 17) {
                console.log('Data Generation ID# :' + row.datagenconfigid +
                    ' Generating Data for Data Attribute #: ' + strAttribute + ': Intl Phone Numbers');
            }
        }
    })
})

// Run This on an interval the timeout amount is in milliseconds so 10000 is 10 seconds
//setInterval(intervalFunc,10000)

