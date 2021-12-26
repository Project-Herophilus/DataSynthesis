const db = require('mysql');
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../../../' +
        '.env') })
const con = db.createConnection({
    host: process.env.dbhost,
    user: process.env.dbuser,
    password: process.env.dbpassword,
    database: process.env.dbname,
    multipleStatements: true,
    queryTimeout: 6000,
    connectTimeout: 60000
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});
module.exports = con;
