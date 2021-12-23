const db= require("../../general/dbConnections/mysqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
const queryMap = require("../querymap");

router.get("/general", async(req, res) => {
  let dataResults;
  res.setHeader("Content-Type", "text/plain");
  const table = req.query.tableName || "dataexisting_ababanking";
  const status = req.query.status || "1";
 
  db.query(queryMap(table, status), (err, rows, fields)=>{
      if(err) throw err;
      //console.log(rows)
      res.send(rows)
  })

});

module.exports = router;
