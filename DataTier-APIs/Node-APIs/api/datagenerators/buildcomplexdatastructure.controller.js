//const db= require("../../general/connectors/dbConnections/mysqlConnect")
const db= require("../../general/connectors/dbConnections/postgresqlConnect")
const queryBuilder = require('../../general/functions/datatier/query-builder');
const express = require("express");
const router = express.Router();
const datastructuresBuilder = require("../../builders/buildComplexDataStructures");
const fs = require("fs");
//will contain all insert/upsert logic from data that is generated and synthesized

router.get("/demographics-generator", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  //DOC TYPE = ADT
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
      dataResults = datastructuresBuilder.generateDemographic_Record(modifiedTuples, count, state, sending_app, sending_fac)
      dataResults.forEach(line=>{
        fs.appendFileSync('person-demographics.csv', line, 'utf8')
      })
      res.send(dataResults)
  })

});

router.post("/data-generator", async(req, res) => {
    req.query.count;
    req.query.type;
    //1. invoke buildDataGeneratedMethods
    //database methods invoked 
    //[{"address":"address1", "dob": dob1, "dln":dln1}]
    //persist objects return from builders in a common format that the datbase accept
})

module.exports = router;
