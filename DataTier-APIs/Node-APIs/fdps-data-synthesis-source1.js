const dataOutputting = require("./general/functions/general/dataOutput")
var csv = require("csvtojson");

// Convert a csv file with csvtojson
csvFilePath='/Users/jonathanmyer/Desktop/cognitive-classifier-resources/_europe2_ausp-20180801203752358.csv'
csv()
.fromFile(csvFilePath)
.then(function(jsonArrayObj){ //when parse finished, result will be emitted here.
    dataOutputting.processDataOutput('erpsource1',jsonArrayObj,100);
})
