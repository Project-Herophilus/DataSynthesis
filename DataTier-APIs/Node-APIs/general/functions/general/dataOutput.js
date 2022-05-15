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
        systemOutputName = datastructureName;
        if (outputType == "kafka") {
            msg.forEach(msg => {
                // topicOutput(topicName,msg)
                topicOutput(systemOutputName, msg)
            })
        }
        if (outputType == "file") {
            let text = msg.join('\n');
            fs.appendFileSync(datastructureName + '.dat', text, (err) => {
                if (err) {
                    console.log(err);
                }
            });
        }
    }
}