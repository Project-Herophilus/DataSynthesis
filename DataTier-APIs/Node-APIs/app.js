const api = require("./api/routes")
const dotenv = require('dotenv');
const express = require('express')
const app = express();
dotenv.config({path: `${__dirname}/.env`})

app.use('/', api);

var port = process.env.PORT || 3001;
//need to invoke config functions to store all configuration necessary in memory at start up or refresh 

const server = app.listen(port, function () {
    console.log("server running on port: " + port)
});

module.exports = server;