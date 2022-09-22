// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
//dotenv.config({ path: path.resolve(__dirname, './.env') })
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("../../builders/buildDataAttributes");
const buildComplexDataStructures = require("../../builders/buildComplexDataStructures");
const auditing = require("./auditing");
const fs = require("fs");
const topicOutput = require("../../connectivity/general/connectors/kafka-producer");
const datapersist = require("./datapersistence");

module.exports = {
    /*
     *  Method to output data
     */
    processDataOutput(msg,datastructureName,requestGUID) {
        let outputType = config.outputAdapter;
        const dataoutput =[];
        systemOutputName = datastructureName;

        if (outputType == "kafka-datapersistence") {
            // This is intended to build out specific kafka topic for data
            datapersist.generate_datapersistence_record(
                "datagenerator","datasynthesis", datastructureName,
                msg, requestGUID)
        }
        if (outputType == "file") {
            /*
             *   Setting Path
             */
            var dirPath = __basedir+path.sep+'api-dataoutput'+path.sep;
            console.log("Directory Path: "+dirPath);
            // Check if exists if not create
            if (fs.existsSync(dirPath)) {
            } else {
                //console.log("DOES NOT exist:", path);
                fs.mkdirSync(dirPath, { recursive: true });
            }
            let text = msg.join('\n');
            var fName = dirPath + datastructureName+'.dat'
            console.log("File Name: "+fName);
            fs.appendFileSync(dirPath+path.sep+ datastructureName + '.dat', text, (err) => {
                if (err) {
                    console.log(err);
                }
            });
        }
    }
}