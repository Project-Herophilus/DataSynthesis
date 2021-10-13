const db= require("../../general/dbConnections/mysqlConnect")
const queryBuilder = require('../query-builder');
const express = require("express");
const router = express.Router();
const hl7Builder = require("../../builders/buildmsgHL7");
const fs = require("fs");

router.get("/hl7-doc-generator", async(req, res) => {
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
      dataResults = hl7Builder.generateHL7_Record(modifiedTuples, doc_type, trigger_event, count, state, sending_app, sending_fac)
      console.log("dataresults" + dataResults)
      fs.writeFileSync('hl7-test.hl7', dataResults, 'utf8')
      res.send(dataResults)
  })

  
  // const result = hl7Builder.generateHL7_Record(rows, doc_type, trigger_event, count, state, sending_app, sending_fac)
  // console.log(result)
  // fs.writeFileSync('hl7-test.hl7', result.replace(/[\n\r]/g, '\r'), 'utf8')

  // res.sendFile('hl7-test.hl7', {root: path.join(__dirname, "../../")}, (err,data)=>{
  //     if(err){
  //         console.err(err)
  //     }
  //     if(data){
  //         console.log(data)
  //     }

  // })
});

router.get("/fhir-doc-generator", (req, res) => {});

router.get("/ccda-doc-generator", (req, res) => {});

module.exports = router;
