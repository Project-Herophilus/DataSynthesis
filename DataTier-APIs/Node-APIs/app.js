const api = require("./api/routes")
//const dotenv = require('dotenv');
const express = require('express')
const app = express();
const bodyParser = require('body-parser')
//dotenv.config({path: `${__dirname}/.env`})
// Global Variable for usage in platform
//global.__basedir = __dirname;

var port = process.env.http_port //|| 3002;
//need to invoke config functions to store all configuration necessary in memory at start up or refresh 
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(function (req, res, next) {
    /*var err = new Error('Not Found');
     err.status = 404;
     next(err);*/
     // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', '*');
    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'Access-Control-Allow-Headers, Origin,Accept, ' +
        'X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers,' +
        'X-Access-Token,XKey,Authorization');
    res.setHeader('Content-Type', 'application/json; charset=utf-8')
    next();
  });
app.use('/', api);

const server = app.listen(port, function () {
    console.log("=========================")
    console.log("System Values Set:")
    console.log("Server running on port [http_port]: " + port)
    console.log("Data Geenration Quantity [runQuantity]: "+process.env.runQuantity)
    console.log("Auditing Values Set:")
    console.log("Auditing [auditing]: "+process.env.auditing)
    console.log("Publish Auditing Topic Name [kic_dataintgrtntransactions]: "+process.env.auditingTopicName)
    console.log("Outputting Values Set:")
    console.log("Output Adapter [outputAdapter]: "+process.env.outputAdapter)
    console.log("Kafka Server [kafka_server]: "+process.env.kafka_server)
    console.log("RDBMS Values Set:")
    console.log("RDBMS [rdbms]: "+process.env.rdbms)
    console.log("=========================")

});

module.exports = server;