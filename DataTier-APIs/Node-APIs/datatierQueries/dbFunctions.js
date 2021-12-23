var mysql      = require('mysql');
var connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Developer123',
    database : 'datasynthesis'
});
connection.connect();

connection.query('SELECT * FROM refdata_status', function(err, rows, fields)
{
    if (err) throw err;
    var rowLength = rows.length;
    console.log(rows[0]);
    // console.log(result[i].column_name);
    console.log("Number Rows:"+rowLength);
});

connection.end();