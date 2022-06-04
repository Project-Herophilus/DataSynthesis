//const dbConnection = require("../../general/connectors/dbConnections/mysqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbQueries = require('../../general/datatier/dbQueries');
const express = require("express");
const router = express.Router();
//const fs = require("fs");

router.get('/status', function (req, res) {
    dbConnection.query('select * from refdata_statuses', function (error, results, fields) {
        if (error) throw error;
        res.end(JSON.stringify(results));
    });
});

router.get("/returnGenLastName", async(req, res) => {
    //let dataResults;
    //res.setHeader("Content-Type", "text/plain");
    //const count = req.query.count || 100;
    //const state = req.query.state || "TX";
    //const sending_app = req.query.sending_app || "datasynthesis";
    //const sending_fac = req.query.sending_fac || "datafacility"

    // Query Table
    strQuery = "select count from dataexisting_namefirst";
    //RecordLength - How to Return for a table
    var recordLength = dbConnection.query(dbQueries.commonRecordCount(strQuery));
    //Loops
    //Query Specific Record
    //How to Populate it to an object for usability
    var dataResultsDTL;
    res.send(recordLength);
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