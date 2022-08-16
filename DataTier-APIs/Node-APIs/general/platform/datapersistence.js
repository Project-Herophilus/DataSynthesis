const dotenv = require('dotenv');
//dotenv.config({path: `../../.env`})
const moment = require('moment');
var RandExp = require('randexp'); // must require on node
const datapersistenceKafka = require("../../connectivity/general/connectors/kafka-producer")
//let auditingType = process.env.auditing
let datapersistenceTopicName = process.env.iDaaS_DataSymthesis_Kafka;

module.exports = {
    generate_datapersistence_record(component, application, dataStructureName,data, requestGUID) {
        //Datw Code
        let date_ob = new Date();
        date_ob = date_ob.toString().substring(0,15);
        //console.log(date_ob)
        let time_ob = new Date();
        time_ob.toString();
        time_ob = time_ob.toString().substring(15,24);
        //console.log(time_ob)
        //time_ob = time_ob.substring(1,time_ob.length -1);

        dataStructure = dataStructureName.split('_');
        datapersistenceObj = new Object()
        //datapersistenceObj.component = component;
        datapersistenceObj.component = dataStructure[0];
        datapersistenceObj.application = application;
        datapersistenceObj.requestID = requestGUID;
        datapersistenceObj.eventdate = date_ob.toString();
        datapersistenceObj.eventTime = time_ob.toString();
        datapersistenceObj.datastructurename = dataStructure[1];
        //datapersistenceObj.datageneratoriondtl ="";
        datapersistenceObj.datadetail = data;

        datapersistenceKafka(datapersistenceTopicName,datapersistenceObj);

    }
}
//console.log(module.exports.generate_auditrecord(1,'component','app'))