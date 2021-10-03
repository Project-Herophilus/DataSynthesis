// var dateFunctions = require('./dateTimeFunctions.js');
// var dataOutputFunctions = require('./dataOutputFunctions.js');
// var randomFunctions = require('./randomFunctions.js');
// var sqlDBRecordCountFunction = require('./dbQueries.js');
// var awaitQueryFunctions = require('./dbQueriesReferenceData.js');
// const { eventNames } = require('../dbConnections/mysql.js');
const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');
const con = require("../General/dbConnections/mysqlConnect");

module.exports= {
    pullActiveRecords_ababanking(rows, count) {
        const random_number = Math.floor(Math.random() * (count - 0) + 0);
        const sending_application = sending_app
        const timestamp = moment().format("yyyyMMDDHHMMSS");
        con.query('select * from dataexisting_ababanking where StatusID=1', function (error, results, fields) {
                if (error) throw error;
                res.end(JSON.stringify(results));
                res.status(200).send();
            });
            //ababanking_messages.push(`${sending_application}|${timestamp}|${fullname}|${dt_birth}|${gender}|${fullpatientaddress}|${home_phone}|${business_phone}${ssn}|${drivers_license_num}\n`)
    },
    createRecords_ababanking(rows, count) {
        // Not needed for any dataexisting as these are all public (or were once public sources of data)
    }

}