const dotenv = require('dotenv');
//dotenv.config({path: `../../.env`})
const moment = require('moment');
var RandExp = require('randexp'); // must require on node
const auditingKafka = require("../../connectivity/general/connectors/kafka-producer")
let auditingType = process.env.auditing
let auditingTopicName = process.env.auditingTopicName

module.exports = {
    generate_auditrecord(count, component, application, startTime, EndTime) {
        //Datw Code
        let date_ob = new Date();
        let time_ob = date_ob.toJSON().split('T')[1];
        time_ob = time_ob.toString();
        time_ob = time_ob.substring(1,time_ob.length -1);

        auditObj = new Object()
        auditObj.count = count;
        auditObj.component = component;   // Alternative
        auditObj.application = application;
        auditObj.eventdate = date_ob.toJSON().substring(0,10);
        auditObj.startTime = startTime;
        auditObj.endTime = endTime;
        auditObj.runTime = endTime - startTime;
        //auditObj.eventtime = time_ob;
        // Invoke Kafka To Send to
        //if (auditingType=="true")
        //{
            auditingKafka(auditingTopicName,auditObj);
        //}
        //return auditObj
    }
}
//console.log(module.exports.generate_auditrecord(1,'component','app'))
