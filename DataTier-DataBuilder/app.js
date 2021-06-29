var dateFunctions = require('./dateTimeFunctions.js');
var dataOutputFunctions = require('./dataOutputFunctions.js');
var randomFunctions = require('./randomFunctions.js');
var sqlDBRecordCountFunction = require('./dbQueries.js');
var awaitQueryFunctions = require('./dbQueries2.js');

var msg = 'String Text Output Parser';

// Console Output
console.log(msg);
console.log(dateFunctions.data.currentDate());
console.log(dateFunctions.data.currentTime());

console.log("Starting String Building");
console.log(dataOutputFunctions.data.mshSegment("MCTN","MyApp"));

console.log("starting Random")
for (i = 1; i < 20; i++) {
    console.log(randomFunctions.data.randomInt(1, 100));
}

// https://stackoverflow.com/questions/44004418/node-js-async-await-using-with-mysql/51690276
async function getAllBlogPost() {
    var connection = mysql.createConnection({
        host     : 'localhost',
        user     : 'root',
        password : 'Developer123',
        database : 'datasynthesis'
    })
    connection.connect();
    const result = await connection.query('SELECT * from refData_Status');
    return result[0];
}
getAllBlogPost();

//console.log("starting Specific Record Query")
//let RecordRetrievalNumber = 10001
//var responseData = sqlDBRecordCountFunction.data.RecordSpecificResponse("Select * from dataexisting_namefirst where FirstNameID="+RecordRetrievalNumber,RecordRetrievalNumber);
//console.log("Data Record Pulled: "+responseData);
//console.log("starting Random Data Pull")
//
// console.log(sqlDBRecordCountFunction.data.RandomRecordResponse("Select * from dataexisting_namefirst",10));






