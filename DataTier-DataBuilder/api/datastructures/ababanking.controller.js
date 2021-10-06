const db= require("../../General/dbConnections/mysqlConnect")
const express = require("express");
const router = express.Router();
const fs = require("fs");
const queryMap = require("../querymap");
const datastructuresBuilder = require("../../Builders/buildDataStructures");

router.get("/ababanking", async(req, res) => {
    let dataResults;
    res.setHeader("Content-Type", "text/plain");
    const table = req.query.tableName || "dataexisting_ababanking";
    const status = req.query.status || "1";
    //const sending_app = req.query.sending_app || "datasynthesis";
    //const sending_fac = req.query.sending_fac || "datafacility"
    console.log(table)
    console.log(status)

    db.query(queryMap(table, status), (err, rows, fields)=>{
        if(err) throw err;
        console.log(rows)
        if(err) throw err;
        const tuples = [];
        const modifiedTuples = [];

        res.send(rows)
    })

    //dataResults = datastructuresBuilder.pullActiveRecords_ababanking(rows,count)
    //res.send(dataResults);

});

module.exports = router;
