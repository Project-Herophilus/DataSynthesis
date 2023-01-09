const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');
var Chance = require('chance');
const rng = require('./numberGenerators');
generator = require('creditcard-generator')
var RandExp = require('randexp'); // must require on node
const crypto = require("crypto");
const {promises} = require("fs");
const db = require("../general/datatier/dbQueries");
const dbQueries = require("../general/datatier/reusableQueries");

// Instantiate Chance so it can be used
var chance = new Chance();

const DelimsCommon = {
    fieldSeperator : "|",
    segmentSeperator : "\n",
    subcomponentSeperator : "^"
}

const demographic_messages = [];
module.exports = {
    /*
     *  Generic Method for reuse that enables generation of a defined count of messages
     *  Based on a provided regex
     */
    generateGenericRegex(regExpression, count){
        const generateddata = []
        for(i=0; i<count; i++){
            generateddata.push(new RandExp(regExpression).gen());
        }
        return generateddata
    },
    /*
     *   Generate Account Numbers based on a specific regular expression and count provided
     */
    generateAccountNumbers(regExpression, count){
       /* const accountnumbers = []
        for(i=0; i<count; i++){
            accountnumbers.push(new RandExp(regExpression).gen());
        }
        return accountnumbers*/
        return this.generateGenericRegex(regExpression, count)
    },
    async generateAddress_Record_US(rows) {

        const randomLastNames = []
        randomizer = function (array) {
            return array[Math.floor(Math.random() * array.length - 0) + 0]
        }
        sqlQueryLastNames = `select lastname from dataexisting_namelast order by random() limit ${rows};`
        //console.log(sqlQueryLastNames)
        // Process Query for Random Last Names
        lastnames = await db.RecordSpecificResponse(sqlQueryLastNames)
        //console.log(lastnames.rows)
        const minLocationNumber = 1
        const maxLocationNumber = 9999
        //console.log(Math.floor(result))
        const streetDirection = ["N", "S", "E", "W", "NE", "NW", "SE", "SW"];
        const streetTypes = ["Lane", "Way", "Drive", "Avenue"];
        const fullstreetaddress = []
        const random_street_template = function (lastname, streetNumber) {
            const random_index = Math.floor(Math.random() * (2 - 0) + 0);
            const address_templates = {
                0: `${streetNumber} ${lastname} ${randomizer(streetTypes)}`,
                1: `${streetNumber} ${randomizer(streetDirection)} ${lastname} ${randomizer(streetTypes)}`
            }
            return address_templates[random_index]
        }
        lastnames.rows.forEach(row => {
            const random_index = Math.floor(Math.random() * (maxLocationNumber - minLocationNumber) + minLocationNumber);
            fullstreetaddress.push(random_street_template(row.lastname, random_index))
        })
        return fullstreetaddress
    },
    generateBankAccounts(regExpression, count){
        return this.generateGenericRegex(regExpression, count)
    },
    generateCreditCards(number_of_cards, ccName){
        // https://www.npmjs.com/package/creditcard-generator
        // check typeof object
        //console.log(typeof object)
        const creditcard_numbers = [];
        var ccSplitValue = null;   
        if (ccName=="all")
        {
            ccSplitValue = Math.floor(number_of_cards/4);
            creditcard_numbers.push({
                "cc_type": "AMEX",
                "cc_count": ccSplitValue, 
                "cc_numbers": generator.GenCC("Amex", ccSplitValue)
            });
            creditcard_numbers.push({
                "cc_type": "Visa",
                "cc_count": ccSplitValue, 
                "cc_numbers": generator.GenCC("VISA", ccSplitValue)
            });
            creditcard_numbers.push({
                "cc_type": "Mastercard",
                "cc_count": ccSplitValue, 
                "cc_numbers": generator.GenCC("Mastercard", ccSplitValue)
            });
            creditcard_numbers.push({
                "cc_type": "Discover",
                "cc_count": ccSplitValue, 
                "cc_numbers": generator.GenCC("Discover", ccSplitValue)
            });

        }
        else if (ccName == "AMEX"){
            return generator.GenCC("Amex",number_of_cards)
        }
        else if (ccName == "Visa"){
            return generator.GenCC("VISA",number_of_cards)
        }
        else if (ccName == "Mastercard"){
            return generator.GenCC("Mastercard",number_of_cards)
        }
        else if (ccName == "Discover"){
            return generator.GenCC("Discover",number_of_cards)
        }
        else {
         console.log("Card type not recognized")
         return "Card type not recgonized"
        }
        return creditcard_numbers
    },
    generateDLN(number_of_dlns, usstate){
        // 1. read config (state code and regex pattern)
        // 2. generate random set of numbers/characters based on regex pattern
        const dln_numbers = [];
        if (usstate == "AK"){
            regDLNExpression = '^[0-9]{7}$'
            dln_numbers.push(this.generateGenericRegex(regDLNExpression, number_of_dlns))
        }
        if (usstate == "AL"){
            regDLNExpression = '^[0-9]{7,8}$'
            dln_numbers.push(this.generateGenericRegex(regDLNExpression, number_of_dlns))
        }
        if (usstate == "AR"){
            regDLNExpression = '^[0-9]{9}$'
            dln_numbers.push(this.generateGenericRegex(regDLNExpression, number_of_dlns))
        }
        if (usstate == "AZ"){
            regDLNExpression = '^[A-Z]{1}[0-9]{8}$'
            dln_numbers.push(this.generateGenericRegex(regDLNExpression, number_of_dlns))
        }
        if (usstate == "CA"){
            regDLNExpression = '^[A-Z]{1}[0-9]{7}$'
            dln_numbers.push(this.generateGenericRegex(regDLNExpression, number_of_dlns))
        }
        return dln_numbers;
        //return new RandExp('^[A-Z]{1}[0-9]{8}$').gen();

    },
    generateDateOfBirths(beginyear, count){
        const dobs = [];
        const start =  new Date(beginyear, 0, 1)
        const end = new Date();
        for(i=0; i<count; i++){
            const DOB = new Date(start.getTime()+Math.random() * (end.getTime() - start.getTime()))
            dobs.push(DOB.toJSON().substring(0,10))
        }
        return dobs
    },
    generateEIN(count){
        const einNumbers = [];
        for (i=0; i<count; i++)
        {
            let ein_first = rng.generateRandomNumbers(99, 10)
            let ein_second = rng.generateRandomNumbers(999999999, 10)
            einNumbers.push(`${ein_first}-${ein_second}`)
        }
        return einNumbers
    },
    generatePhoneNumbersUS(country, count ){
        // check typeof object
        //console.log(typeof object)
        const phone_numbers = [];
        for (i=0; i<count; i++){
            if (country == "us"){
                //phone_numbers.push(chance.phone({ country: "us" }).split(' ')[1])
                phone_numbers.push(chance.phone({ country: 'us' }))
            }
            else {
                // https://chancejs.com/location/phone.html
                phone_numbers.push(chance.phone({ country: country }))
            }
        }
        return phone_numbers
    },
    generatePhoneNumbersIntl(country, count ){
        // check typeof object
        //console.log(typeof object)
        const phone_numbers = [];
        for (i=0; i<count; i++){
            if (country == "fr"){
                phone_numbers.push(chance.phone({ country: country }))
            }
            else if (country == "uk") {
                // https://chancejs.com/location/phone.html
                phone_numbers.push(chance.phone({ country: country }))
            }
            else if (country == "nz") {
                // We create our own custom logic as this is unaupported in existing library
                //phone_numbers.push(chance.phone({ country: country }))
            }
            else if (country == "in") {
                // https://chancejs.com/location/phone.html
                //phone_numbers.push(chance.phone({ country: country }))
            }
        }
        return phone_numbers
    },
    generateSerialNumbers_Basic(regExpression,count)
    {
        return this.generateGenericRegex(regExpression, count)
    },
    generateSerialNumbers_Complex(count)
    {
        const serialNumbers = [];
        for (i=0; i<count; i++)
        {
            let serialnumbervalue = crypto.randomBytes(8).toString("hex");
            serialNumbers.push({"serialnumber": serialnumbervalue})
        }
        return serialNumbers
    },
    generateSSN(count)
    {
        const ssnNumbers = [];
        for (i=0; i<count; i++)
        {
            let ssn_first = rng.generateRandomNumbers(999, 100)
            let ssn_second = rng.generateRandomNumbers(99, 10)
            let ssn_third = rng.generateRandomNumbers(9999, 1000)
            ssnNumbers.push(`${ssn_first}-${ssn_second}-${ssn_third}`)
        }
        //return new Promise(ssnNumbers)
        return ssnNumbers
    },
    generateUserIdentities(regExpression, count){
        const accountnumbers = []
        for(i=0; i<count; i++){
            accountnumbers.push(new RandExp(regExpression).gen());
        }
        return accountnumbers
    },

    generateAddressByState_Record(rows, count, sending_app, sending_fac){

    }


}

// console.log(module.exports.generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',10));
// console.log(module.exports.generateSerialNumbers_Complex(10));
// console.log(module.exports.generateSSN(10))
// console.log(module.exports.generateEIN(10))
// console.log(module.exports.generateDateOfBirths(1960, 10))
// console.log(module.exports.generateCreditCards(12,'Discover'))
// console.log(module.exports.generateDLN('blah','blah'))
// console.log(module.exports.generateAccountNumbers('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25))
// console.log(module.exports.generateUserIdentities('^[%#@&]{1}[A-Z]{3}[%#@&]{1}[0-9]{1}[A-Z]{2}$',25))
// console.log(module.exports.generateIntlPhoneNumbers('in',1000))