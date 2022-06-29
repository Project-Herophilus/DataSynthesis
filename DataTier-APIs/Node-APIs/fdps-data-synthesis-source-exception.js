const dataOutputting = require("./general/functions/general/dataOutput")
var csv = require("csvtojson");

// Convert a csv file with csvtojson

csvFilePath='/Users/jonathanmyer/Desktop/cognitive-classifier-resources/_europe2_mcha-20180801203628256.csv'
csv()
.fromFile(csvFilePath)
.then(function(jsonArrayObj){ //when parse finished, result will be emitted here.
    dataOutputting.processDataOutput('erpsource3',jsonArrayObj,6);
})

