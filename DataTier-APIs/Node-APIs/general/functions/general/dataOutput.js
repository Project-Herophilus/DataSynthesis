// Include all APIs and components to pull data
const dotenv = require('dotenv');
const path = require("path");
const uuid = require('uuid');
const crypto = require('crypto');
const config = process.env
dotenv.config({ path: path.resolve(__dirname, './.env') })
const express = require("express");
const router = express.Router();
const buildDataAttributes = require("../../../builders/buildDataAttributes");
const buildComplexDataStructures = require("../../../builders/buildComplexDataStructures");
const auditing = require("../auditing");
const fs = require("fs");
const topicOutput = require("../../../connectivity/general/connectors/kafka-producer");

module.exports = {
    /*
     *  Method to output data
     */
    processDataOutput(msg,datastructureName) {
        let outputType = config.outputAdapter;
        const dataoutput =[];
        systemOutputName = datastructureName.replace(/\s/g, "");
        if (outputType == "kafka") {
            dataoutput.forEach(msg => {
                // topicOutput(topicName,msg)
                topicOutput(systemOutputName, msg)
            })
        }
        if (outputType == "file") {
            dataoutput.forEach(msg => {
                fs.appendFileSync(componentName + '_' + systemOutputName + '.dat', JSON.stringify(msg) + "\n", (err) => {
                    if (err) {
                        console.log(err);
                    }
                });
            })
        }
    }
}