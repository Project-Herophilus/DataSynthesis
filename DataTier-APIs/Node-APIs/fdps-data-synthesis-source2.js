const dataOutputting = require("./general/functions/general/dataOutput")
var csv = require("csvtojson");

// Convert a csv file with csvtojson
csvFilePath='/Users/jonathanmyer/Desktop/cognitive-classifier-resources/_europe2_mch1-20180801203213836.csv'
csv()
.fromFile(csvFilePath)
.then(function(jsonArrayObj){ //when parse finished, result will be emitted here.
    dataOutputting.processDataOutput('erpsource2',jsonArrayObj,100);
})
