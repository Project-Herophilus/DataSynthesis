const db= require("../../../General/dbConnections/mysqlConnect")
const queryBuilder = require('../../querybuilderDataExisting');
const express = require("express");
const router = express.Router();
const datastructuresBuilder = require("../../../Builders/buildDataExisting");
const fs = require("fs");
const queryMap = require("../../querymap");

router.get("/ababanking", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  //DOC TYPE = ADT
  const table = req.query.tableName || "dataexisting_ababanking";
  const status = req.query.status || "1";
  //const sending_app = req.query.sending_app || "datasynthesis";
  //const sending_fac = req.query.sending_fac || "datafacility"
 
  db.query(queryMap(table, status), (err, rows, fields)=>{
      if(err) throw err;
      console.log(rows)
  })

    //dataResults = datastructuresBuilder.pullActiveRecords_ababanking(rows,count)
    //res.send(dataResults);

});

module.exports = router;
