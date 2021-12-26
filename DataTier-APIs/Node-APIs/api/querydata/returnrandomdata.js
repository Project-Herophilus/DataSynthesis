// var dateFunctions = require('./dateTimeFunctions.js');
// var dataOutputFunctions = require('./dataOutputFunctions.js');
// var randomFunctions = require('./randomFunctions.js');
// var sqlDBRecordCountFunction = require('./dbQueries.js');
// var awaitQueryFunctions = require('./dbQueriesReferenceData.js');
// const { eventNames } = require('../dbConnections/mysqlConnect.js');
const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');
const db= require("../../general/dbConnections/mysqlConnect")
const queryBuilder = require('../query-builder');
const express = require("express");
const router = express.Router();

router.get("/industrystds-doc-generator", async(req, res) => {
    let dataResults;
    res.setHeader("Content-Type", "text/plain");
    const count = req.query.count || 100;
    const state = req.query.state || "TX";
//const sending_app = req.query.sending_app || "datasynthesis";
//const sending_fac = req.query.sending_fac || "datafacility"
    /*
    db.query(queryBuilder.getData(count, state), (err, rows, fields)=>{
        if(err) throw err;
        const tuples = [];
        const modifiedTuples = [];
        rows.forEach((row,i)=>{
            row.forEach((object, index)=>{
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
        //dataResults = hl7Builder.generateHL7_Record(modifiedTuples, doc_type, trigger_event, count, state, sending_app, sending_fac)
        //console.log("dataresults" + dataResults)
        //fs.writeFileSync('industrystds-test.industrystds', dataResults, 'utf8')
        //res.send(dataResults)
        res.end(JSON.stringify(results));
    })*/
});

module.exports = router;