//const dbConnection = require("../../connectors/dbConnections/mysqlConnect");
const dbConnection = require("../../connectors/dbConnections/postgresqlConnect");
var mysql      = require('mysql');
var randomRecs = require('../general/randomFunctions.js')

var methods = {
    commonRecordCount: function (strQuery,value) {
        /*var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'root',
            password : 'Developer123',
            database : 'datasynthesis'
        })*/
            dbConnection.connect();
            dbConnection.query(strQuery, function(err, rows, fields)
            {
                if (err) throw err;
                rowLength = rows.length;
                //console.log(rows[0]);
                console.log(rowLength);
            });
        dbConnection.end();
        return rowLength;
    },
    RecordSpecificResponse: function (strQuery, RecordNumber, callback) {
        /*var connection = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: 'Developer123',
            database: 'datasynthesis'
        })*/
        var responseData = null;
        dbConnection.connect();
        dbConnection.query(strQuery, [true], (err, results, fields) => {
        //connection.query(strQuery, function (err, rows, fields, results) {
            if (err) throw err;
            //console.log(rows[RecordNumber]);
            //console.log(results);
            return callback(results);
            //responseData = rows[RecordNumber];
            //console.log(rowLength);
        });
        dbConnection.end();
        //return results;
    },
    RandomRecordResponse: function (strQuery, recordCount) {
       /* var connection = mysql.createConnection({
            host     : 'localhost',
            user     : 'root',
            password : 'Developer123',
            database : 'datasynthesis'
        })*/
        dbConnection.connect();
        dbConnection.query(strQuery, function(err, rows, fields)
        {
            if (err) throw err;
            let rowLength = rows.length;

            //Loop for records requested
            for (i = 1; i < recordCount; i++) {
                // Find Random Recordbased on requested count
                let x = randomRecs.data.randomInt(1,rowLength);
                console.log(rows[x]);
            }

            //console.log(rows[0]);
            //console.log(rowLength);
        });
        dbConnection.end();
    },

};

exports.data = methods;