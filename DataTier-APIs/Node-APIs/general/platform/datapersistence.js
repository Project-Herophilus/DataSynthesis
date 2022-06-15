const dotenv = require('dotenv');
dotenv.config({path: `../../.env`})
const moment = require('moment');
var RandExp = require('randexp'); // must require on node
const datapersistenceKafka = require("../../connectivity/general/connectors/kafka-producer")
//let auditingType = process.env.auditing
let datapersistenceTopicName = process.env.iDaaS_DataSymthesis_Kafka;

module.exports = {
    generate_datapersistence_record(component, application, dataStructureName,data) {
        //Datw Code
        let date_ob = new Date();
        let time_ob = date_ob.toJSON().split('T')[1];
        time_ob = time_ob.toString();
        time_ob = time_ob.substring(1,time_ob.length -1);

        dataStructure = dataStructureNamesplit('_');
        datapersistenceObj = new Object()
        datapersistenceObj.component = component;   // Alternative
        datapersistenceObj.application = application;
        datapersistenceObj.eventdate = date_ob.toJSON().substring(0,10);
        datapersistenceObj.eventTime = time_ob.toString();
        datapersistenceObj.datastructurename = dataStructure[1];
        datapersistenceObj.datageneratoriondtl ="";
        datapersistenceObj.datadetail = data;

        datapersistenceKafka(datapersistenceTopicName,datapersistenceObj);

    }
}
//console.log(module.exports.generate_auditrecord(1,'component','app'))