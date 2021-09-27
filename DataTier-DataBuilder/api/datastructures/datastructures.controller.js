const db= require("../../DbConnections/mysql")
const queryBuilder = require('../query-builder');
const express = require("express");
const router = express.Router();
const datastructuresBuilder = require("../../Builders/buildDataStructures");
const fs = require("fs");

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
      fs.writeFileSync('person-demographics.csv', dataResults, 'utf8')
      res.send(dataResults)
  })

});

module.exports = router;