const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');
var RandExp = require('randexp'); // must require on node

const DelimsCommon = {
    fieldSeperator : "|",
    segmentSeperator : "\n",
    subcomponentSeperator : "^"
}

const demographic_messages = [];
module.exports = {

    generate_auditrecord(count, component, application) {
        let date_ob = new Date();
        let time_ob = date_ob.toJSON().split('T')[1];
        time_ob = time_ob.toString();
        time_ob = time_ob.substring(1,time_ob.length -1);

        auditObj = new Object()
        auditObj.count = count;
        auditObj.component = component;   // Alternative
        auditObj.application = application;
        auditObj.eventdate = date_ob.toJSON().substring(0,10);
        auditObj.eventtime = time_ob;
        return auditObj
    }
}
console.log(module.exports.generate_auditrecord(1,'component','app'))
