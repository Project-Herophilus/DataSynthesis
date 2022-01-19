const dotenv = require('dotenv');
dotenv.config({path: `../.env`})
const moment = require('moment');

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
    generateAddress_Record_US(rows, count, sending_app, sending_fac){
        const random_number = Math.floor(Math.random() * (count - 0) + 0);
        // How do we create a random number 4 in length always between 1 and 9999
        // generating random integers within a range
        const minLocationNumber = 1
        const maxLocationNumber = 9999
        const result = Math.random()*(maxLocationNumber - minLocationNumber) + minLocationNumber
        //console.log(Math.floor(result))
        const streetDirection = ["N", "S", "E", "W", "NE","NW","SE","SW"];
        const random_streetDirection = alphabet[Math.floor(Math.random() * streetDirection.length)];
        const streetTypes = ["Lane", "Way", "Drive", "Avenue"];
        const random_streetTypes = alphabet[Math.floor(Math.random() * streetTypes.length)];
        /*
        How can we create three formats that randomly we can reformat the data into
         There are a few formats US address formats:
         number streetname(lastname) streetType
         number streetDirection streetname(lastname) streetType
         */
            rows.forEach(row=>{
                const sending_application = sending_app
                const sending_facility = sending_fac
                const timestamp = moment().format("yyyyMMDDHHMMSS");
                // 1. pull in a random list of 15k last names for usage into an array
                // 2. Loop through that array and consruct a variable that will use an
                // 2. Build all potential relevant parts
                // number street direction  streetTypes
                // 3. Randomize the output format from
                // number streetname(lastname) streetType
                // number streetDirection streetname(lastname) streetType
                // 4. build the specific street address output
                // 5. Hand off to persistence-output tier
                // Street Name is from LastName randomized
                const streetname = row.LastName
                //CONCAT ALL THREE
                const address = `${firstname}^${middlename}^${lastname}`
                //CONCAT DATAEXISTING_ADDRESS AND ZIPCODEUS
                const fullpatientaddress = `${row.AddressStreet}^${row.City}^${row.State}^${row.ZipCode}^${row.State}`
                //DATAGENERETED_DATEOFBIRTH AGE >10
                const date = new Date(row.DateOfBirth)
                const dt_birth = moment(date).format("yyyyMMDD")
                //DATAEXISTING_FIRSTNAME/LASTNAME
            })
            return demographic_messages
    },
    generateAddressByState_Record(rows, count, sending_app, sending_fac){

    }

}
