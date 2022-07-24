/* https://node-postgres.com/features/connecting */
const { Pool, Client } = require('pg');
const path = require('path')
//require('dotenv').config({ path: path.resolve(__dirname, '../../../../' + '.env') })

let connectionString= process.env.dbURL;
/*
const pool = new Pool({
    connectionString,
})
*/
const client = new Client({
    connectionString,
})



client.connect(function(err) {
    if (err) throw err;
    console.log("Connected to Postgress DB !");
});
module.exports = client;
