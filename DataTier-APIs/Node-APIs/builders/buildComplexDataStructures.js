/* 
1. Select from platform_datastructures_ids 
2. Use the id as a key to platform_datastructurestoattributes
3. 







*/ 

module.exports = {
    buildComplexDataStructure(datastructure, no_recs){
        //query platform_datastructures where datastructure == datastructure
        //return matching platform_datastructure_id and pass to next query
        //next query will be to platform_datastructurestoattributees
        //return matching platform platformdataattributesid and randomize each attribute 
        //pass platformdataattributesid to platform_dataattributes to return matching table 
        //pull from the relevant table through the api and randomize based on the no_recs required
        //merge appropriate datastructure tables together (Person Demographics) and then return randomized merged set 
    }
}