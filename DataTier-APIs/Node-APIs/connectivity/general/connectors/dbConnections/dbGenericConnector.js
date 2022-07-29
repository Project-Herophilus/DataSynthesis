// This is intended to be a universal dbConnector that will
// use the environment variable name rdbms to drive the connectiion params used and
// the specific attributes

/* https://node-postgres.com/features/connecting */
const { Pool, Client } = require('pg');
const db = require('mysql');
// var snowflake = require('snowflake-sdk');
const path = require('path')

client = new Client();

if (process.env.rdbms =="postgreSQL") {
    let connectionString = process.env.dbURL;
    client = new Client({
        connectionString,
    })
    client.connect(function (err) {
        if (err) throw err;
        console.log("Connected to Postgress DB !");
    });
}
if (process.env.rdbms =="mySQL")
{
 /*   client = db.createConnection({
        host: process.env.dbHost,
        user: process.env.dbUser,
        password: process.env.dbPassword,
        database: process.env.dbName,
        multipleStatements: true,
        queryTimeout: 6000,
        connectTimeout: 60000
    });

    client.connect(function(err) {
        if (err) throw err;
        console.log("Connected to MySQL/Maria DB!");
    });*/
}
if (process.env.rdbms=="snowflake")
{
    /*
    // Create a Connection object that we can use later to connect.
    var client = snowflake.createConnection( {
            account: account,
            username: user,
            password: password
        }
    );

    // Try to connect to Snowflake, and check whether the connection was successful.
    client.connect(
        function(err, conn) {
            if (err) {
                console.error('Unable to connect to Snowflake: ' + err.message);
            }
            else {
                console.log('Successfully connected to Snowflake.');
                // Optional: store the connection ID.
                connection_ID = conn.getId();
            }
        }
    );
     */
}

module.exports = client;