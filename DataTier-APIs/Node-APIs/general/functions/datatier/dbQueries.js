//const dbConnection = require("../../connectors/dbConnections/mysqlConnect");
//var mysql = require("mysql");
const dbConnection = require("../../../connectivity/general/connectors/dbConnections/postgresqlConnect");
var randomRecs = require("../general/randomFunctions.js");

module.exports = {
  commonRecordCount: function (strQuery, value) {
    dbConnection.connect();
    dbConnection.query(strQuery, function (err, rows, fields) {
      if (err) throw err;
      rowLength = rows.length;
      //console.log(rows[0]);
      console.log(rowLength);
    });
    dbConnection.end();
    return rowLength;
  },
  async RecordSpecificResponse(strQuery) {
    const result = await dbConnection
      .query(strQuery)
      .then((res) => {
        return res
      })
      .catch((err) => {
        return err
      })
      return result
  },
  RunSpecificQuery(strQuery) {
    const result = dbConnection
        .query(strQuery)
        .then((res) => {
          return res
        })
        .catch((err) => {
          return err
        })
    return result
  },
  RandomRecordResponse: function (strQuery, recordCount) {
    dbConnection.connect();
    dbConnection.query(strQuery, function (err, rows, fields) {
      if (err) throw err;
      let rowLength = rows.length;

      //Loop for records requested
      for (i = 1; i < recordCount; i++) {
        // Find Random Recordbased on requested count
        let x = randomRecs.data.randomInt(1, rowLength);
        console.log(rows[x]);
      }
        //console.log(rows[0]);
        //console.log(rowLength);
    });
    dbConnection.end();
  },
};
