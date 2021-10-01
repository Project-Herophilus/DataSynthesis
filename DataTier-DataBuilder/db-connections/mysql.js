const mysql = require('mysql');
const dbconfig = require('./config');

const con = mysql.createConnection({
  host: dbconfig.mysql_host,
  user: dbconfig.mysql_user,
  password: dbconfig.mysql_password,
  database: dbconfig.mysql_db,
  multipleStatements: true,
  queryTimeout: 6000,
  connectTimeout: 60000
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
module.exports = con;