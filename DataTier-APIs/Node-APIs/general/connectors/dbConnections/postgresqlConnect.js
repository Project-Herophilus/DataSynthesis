/* https://node-postgres.com/features/connecting */
const { Pool, Client } = require('pg');
const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../../../' +
        '.env') })

const client = new Client({
    user: 'postgres',
    password: 'Developer123',
    host: 'localhost',
    database: 'datasynthesis',
    port: '5432',
    /*
      user: process.env.dbuser,
    password: process.env.dbpassword,
    host: process.env.dbhost,
    database: process.env.dbname,
    port: process.env.dbport,
     */
});

client.connect(function(err) {
    if (err) throw err;
    console.log("Connected to Postgress DB !");
});
module.exports = client;
