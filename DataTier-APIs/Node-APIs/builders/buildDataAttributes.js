const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');
var Chance = require('chance');
const rng = require('./numberGenerators');
generator = require('creditcard-generator')
var RandExp = require('randexp'); // must require on node
const crypto = require("crypto");
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
     *  Data Queries
     *  We will use USState param to pull City, State, ZipCode from dataexisting_usstates
     *  For AreaCodes we will want to pull list of areacodes based on state
     *  We will want to pull 100 FirstNames and Genders in General - These will be used to populate GT1/NK1 values since name will already be known
     *  Clinicians - We will want to pull 120 firstnames and lastnames randomly - dataexisting_lastname, dataexisting_firstname
     *  Names - Pull in 500 complete names randomly, gender will be part of this pull - dataexisting_lastname, dataexisting_firstname
     *  Address - pull 500 Street Addreses - datagenerated_addresses
     *  This will be used and concatenated with random city, state and zip initially pulled
     *  PhoneNumbers - datagenerated_phonenumbers combined with random area codes pulled from State
     *  DatOfBirth - datagenerate_dateofbirth
     *  DLN - datagenerated_droverslicensenumber
     *  SSN - datagenerated_socialsecuritynumber
     *
     */
    generatebasicref(rows, count, sending_app, sending_fac){
        //Create different templates for different types
        const relationships = ["Mother", "Father", "Sister", "Brother", "Aunt", "Uncle"];
        const random_number = Math.floor(Math.random() * (count - 0) + 0);
        const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        const random_letter = alphabet[Math.floor(Math.random() * alphabet.length)];

        rows.forEach(row=>{
            const sending_application = sending_app
            const sending_facility = sending_fac
            const timestamp = moment().format("yyyyMMDDHHMMSS");
            //DATAEXISTING_NAMEFIRST => RANDOMIZED
            const firstname = row.FirstName
            //RANDOMIZE LETTER
            const middlename = random_letter
            //DATAEXISTING_NAMELAST => RANDOMIZED
            const lastname = row.LastName
            //CONCAT ALL THREE
            const fullname = `${firstname}^${middlename}^${lastname}`
            //CONCAT DATAEXISTING_ADDRESS AND ZIPCODEUS
            const fullpatientaddress = `${row.AddressStreet}^${row.City}^${row.State}^${row.ZipCode}^${row.State}`
            //DATAGENERETED_DATEOFBIRTH AGE >10
            const date = new Date(row.DateOfBirth)
            const dt_birth = moment(date).format("yyyyMMDD")
            //DATAEXISTING_FIRSTNAME/LASTNAME
            const gender = row.Gender
            //CONCAT DATAEXISTING_AREACODE + DATAEXISTING_PHONENUMBER =>RANDOMIZE
            const home_phone = `${row.AreaCodeValue}-${row.PhoneNumberValue}`
            //CONCAT DATAEXISTING_AREACODE + DATAEXISTING_PHONENUMBER =>RANDOMIZE
            const business_phone = `${row.AreaCodeValue}-${rows[random_number].PhoneNumberValue}`
            //DATAGENERATED_SOCIALSECURITYNUMBER
            const ssn = row.SocialSecurityNumberValue
            //DATAGENERATED_DRIVERLICENSES
            const drivers_license_num = row.DLN
            demographic_messages.push(`${sending_application}|${sending_facility}|${timestamp}|${fullname}|${dt_birth}|${gender}|${fullpatientaddress}|${home_phone}|${business_phone}${ssn}|${drivers_license_num}\n`)
        })
        return demographic_messages
    },
    generateGenericRegex(regExpression, count){
        const generateddata = []
        for(i=0; i<count; i++){
            generateddata.push(new RandExp(regExpression).gen());
        }
        return generateddata
    },
    generateAccountNumbers(regExpression, count){
       /* const accountnumbers = []
        for(i=0; i<count; i++){
            accountnumbers.push(new RandExp(regExpression).gen());
        }
        return accountnumbers*/
        return this.generateGenericRegex(regExpression, count)
    },
    generateAddress_Record_US(rows){
        randomizer = function(array){
            return array[Math.floor(Math.random()*array.length-0)+0]
         }
        // console.log(rows)
        const minLocationNumber = 1
        const maxLocationNumber = 9999
        //console.log(Math.floor(result))
        const streetDirection = ["N", "S", "E", "W", "NE","NW","SE","SW"];
        const streetTypes = ["Lane", "Way", "Drive", "Avenue"];
        const fullstreetaddress = []
        const random_street_template = function(lastname, streetNumber){
            const random_index = Math.floor(Math.random()*(2-0)+0);
            const address_templates = {
                0: `${streetNumber} ${lastname} ${randomizer(streetTypes)}`,
                1: `${streetNumber} ${randomizer(streetDirection)} ${lastname} ${randomizer(streetTypes)}`
            }
            return address_templates[random_index]
        }

        rows.forEach(row=>{
            const random_index = Math.floor(Math.random()*(maxLocationNumber - minLocationNumber) + minLocationNumber);
            fullstreetaddress.push(random_street_template(row.lastname, random_index))
        })
        return fullstreetaddress
    },
    generateBankAccounts(rows){

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
                "cc_type": "Amex",
                "cc_count": ccSplitValue, 
                "cc_numbers": generator.GenCC("Amex", ccSplitValue)
            });
            creditcard_numbers.push({
                "cc_type": "VISA",
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
        else if (ccName == "Amex"){
            return generator.GenCC("Amex",number_of_cards)
        }
        else if (ccName == "VISA"){
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
    generateDLN(number_of_dls, datagentype){
        // 1. read config (state code and regex pattern)
        // 2. generate random set of numbers/characters based on regex pattern 
        return new RandExp('^[A-Z]{1}[0-9]{8}$').gen();
        /*
         * table platform_config_datagen are all the entries that should be able to be scheduled to run
         * it links via datagentypeid to refdata_datagentypes to the specific formats/regex needed to do the
         * specific task
         *
        */

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
            serialNumbers.push(`${serialnumbervalue}`)
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
        return ssnNumbers
    },
    generateUserIdentities(regExpression, count){
        const accountnumbers = []
        for(i=0; i<count; i++){
            accountnumbers.push(new RandExp(regExpression).gen());
        }
        return accountnumbers
    },
    generateUSPhoneNumbers(country, count ){
        // check typeof object 
        //console.log(typeof object)
        const phone_numbers = [];
        for (i=0; i<count; i++){
            if (country == "us"){
                phone_numbers.push(chance.phone({ country: "us" }).split(' ')[1])
            }
            else {
                phone_numbers.push(chance.phone({ country: country }))
            }
        }
        return phone_numbers
    },
    generateAddressByState_Record(rows, count, sending_app, sending_fac){

    }

}

console.log(module.exports.generateSerialNumbers_Basic('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',10));
//console.log(module.exports.generateSerialNumbers_Complex(10));
// console.log(module.exports.generateSSN(10))
// console.log(module.exports.generateEIN(10))
// console.log(module.exports.generateDateOfBirths(1960, 10))
// console.log(module.exports.generateCreditCards(12,'Discover'))
//console.log(module.exports.generateDLN('blah','blah'))
//console.log(module.exports.generateAccountNumbers('^[A-Z]{2}[%#@&]{1}[0-9]{5}[A-Z]{1}$',25))
//console.log(module.exports.generateUserIdentities('^[%#@&]{1}[A-Z]{3}[%#@&]{1}[0-9]{1}[A-Z]{2}$',25))