const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');
var Chance = require('chance');
//generator = require('creditcard-generator')

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
    generateAccountNumbers(rows){

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
        console.log(typeof ccName)
        if (ccName="all")
        {
            ccSplitValue = Math.floor(number_of_cards/4);
            generator.GenCC("Amex", ccSplitValue);
            generator.GenCC("VISA", ccSplitValue);
            generator.GenCC("Mastercard", ccSplitValue);
            generator.GenCC("Discover", ccSplitValue);

        }
        else
        {
            for (i=0; i<number_of_cards; i++){
                if (ccName == "Amex"){
                    //phone_numbers.push(chance.phone({ country: "us" }).split(' ')[1])
                }
                if (ccName == "VISA"){
                    //phone_numbers.push(chance.phone({ country: "us" }).split(' ')[1])
                }
                if (ccName == "Mastercard"){
                    //phone_numbers.push(chance.phone({ country: "us" }).split(' ')[1])
                }
                if (ccName == "Discover"){
                    //phone_numbers.push(chance.phone({ country: "us" }).split(' ')[1])
                }
            }
        }
        return creditcard_numbers
    },
    generateDLN(rows, stateCode){
        /*
         * table platform_config_datagen are all the entries that should be able to be scheduled to run
         * it links via datagentypeid to refdata_datagentypes to the specific formats/regex needed to do the
         * specific task
         *
        */

    },
    generateDateOfBirths(rows){

    },
    generateEIN(rows){

    },
    generateSSN(rows)
    {
        /*
         *    ###-##-####
         */
        const ssNumbers = [];

        for (i=0; i<number_of_phone_numbers; i++)
        {
            var firstNumberStart = 1
            var firstNumberEnd = 999
            Math.floor((Math.random() * (firstNumberEnd - firstNumberStart + 1) + firstNumberStart));
            var secondNumberStart = 1
            var secondNumberEnd = 99
            Math.floor((Math.random() * (secondNumberEnd - secondNumberStart + 1) + secondNumberStart));
            var thirdNumberStart = 1
            var thirddNumberEnd = 9999
            Math.floor((Math.random() * (thirdNumberEnd - thirdNumberStart + 1) + thirdNumberStart));
        }
            return ssNumbers
    },
    generateUserIdentities(rows){

    },
    generateUSPhoneNumbers(number_of_phone_numbers, country){
        // check typeof object 
        //console.log(typeof object)
        const phone_numbers = [];
        console.log(typeof number_of_phone_numbers)
        for (i=0; i<number_of_phone_numbers; i++){
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
