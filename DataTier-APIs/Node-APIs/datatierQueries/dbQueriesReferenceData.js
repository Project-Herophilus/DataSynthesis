var mysql      = require('mysql');
var randomRecs = require('../general/functions/randomFunctions.js')

// https://evertpot.com/executing-a-mysql-query-in-nodejs/

async function getAllRefDataStatus() {
    var connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : 'Developer123',
        database : 'datasynthesis'
    })
    connection.connect();
    const result = await connection.query('SELECT * from refdata_status');
    return result[0];

}
