/* https://node-postgres.com/features/connecting */
const { Pool, Client } = require('pg');
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../../../' +
        '.env') })

const client = new Client({
    user: process.env.dbuser,
    host: process.env.dbhost,
    database: process.env.dbname,
    password: process.env.dbpassword,
    port: process.env.dbport,
});

client.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});
module.exports = client;
