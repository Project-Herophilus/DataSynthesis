//const db= require("../../connectivity/general/connectors/dbConnections/postgresqlConnect")
const dbConnection = require("../../connectivity/general/connectors/dbConnections/dbGenericConnector")
const queryBuilder = require('../../general/datatier/reusableQueries');
const express = require("express");
const router = express.Router();
const hl7Builder = require("../../builders/buildmsgHL7");
const fs = require("fs");

router.get("/generator-hl7", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  //DOC TYPE = ADT
  const doc_type = req.query.doc_type || "ADT";
  //TRIGGER EVENT = AO1,AO8,AO3
  const trigger_event = req.query.trigger_event || "AO1";
  const count = req.query.count || 100;
  const state = req.query.state || "TX";
  const sending_app = req.query.sending_app || "datasynthesis";
  const sending_fac = req.query.sending_fac || "datafacility"
 
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
      //Return a formatted payload with seperate messages for prettiness
      //dataResults = dataResults.join('\n')

      res.send(dataResults)
  })
});

router.get("/fhir-doc-generator", (req, res) => {});

router.get("/ccda-doc-generator", (req, res) => {});

module.exports = router;
