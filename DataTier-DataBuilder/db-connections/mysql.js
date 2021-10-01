const mysql = require('mysql');
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../.env') })
const con = mysql.createConnection({
  host: process.env.mysql_host,
  user: process.env.mysql_user,
  password: process.env.mysql_password,
  database: process.env.mysql_db,
  multipleStatements: true,
  queryTimeout: 6000,
  connectTimeout: 60000
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
module.exports = con;