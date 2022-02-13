/* 
1. Select from platform_datastructures_ids 
2. Use the id as a key to platform_datastructurestoattributes
3. 
*/
const db = require("../general/functions/datatier/dbQueries");
const table_to_field_name = [
  { platformtablename: "dataexisting_namelast", platformfieldname: "lastname" },
  {
    platformtablename: "dataexisting_namefirst",
    platformfieldname: "firstname",
  },
  {
    platformtablename: "datagenerated_addresses",
    platformfieldname: "addressstreet",
  },
  {
    platformtablename: "dataexisting_zipcodeus",
    platformfieldname: "zipcode",
  },
  {
    platformtablename: "dataexisting_areacode",
    platformfieldname: "areacodevalue",
  },
  {
    platformtablename: "datagenerated_phonenumber",
    platformfieldname: "phonenumbervalue",
  },
  {
    platformtablename: "datagenerated_dateofbirth",
    platformfieldname: "dateofbirth",
  },
  {
    platformtablename: "datagenerated_driverslicenses",
    platformfieldname: "dln, statecode",
  },
  {
    platformtablename: "datagenerated_socialsecuritynumber",
    platformfieldname: "socialsecuritynumbervalue",
  },
];

module.exports = {
  buildComplexDataStructure(datastructure, no_recs) {
    const data_structure_complete = [];
    const data_structure_query = `select
        platform_datastructurestodataattributes.platformdatastructurestodataattributesid,
        platform_datastructurestodataattributes.platformdatastructuresid,
        platform_datastructures.datastructurename,
        platform_datastructurestodataattributes.platformdataattributesid,
        platform_dataattributes.dataattributename,
        platform_dataattributes.platformtablename
        from platform_datastructurestodataattributes, platform_dataattributes,
        platform_datastructures
        where
        platform_datastructurestodataattributes.platformdataattributesid =
        platform_dataattributes.platformdataattributesid
        and
        platform_datastructurestodataattributes.platformdatastructuresid =
        platform_datastructures.platformdatastructuresid
        and
        platform_datastructurestodataattributes.statusid =1
        and platform_datastructures.datastructurename='${datastructure}'
        order by
        platform_datastructurestodataattributes.platformdatastructuresid
        `;
    db.RecordSpecificResponse(data_structure_query).then((res) => {
      let sql_query = "";
      res.rows.forEach(datastructure=>{
          const table_filter = table_to_field_name.filter(table => table.platformtablename == datastructure.platformtablename)
          sql_query += `select ${table_filter[0].platformfieldname} from ${table_filter[0].platformtablename} order by random() limit ${no_recs};`
          console.log(sql_query)
      })
      db.RecordSpecificResponse(sql_query).then(resp=>{
        console.log(resp.rows)
        })
    });
    //query platform_datastructures where datastructure == datastructure
    //return matching platform_datastructure_id and pass to next query
    //next query will be to platform_datastructurestoattributees
    //return matching platform platformdataattributesid and randomize each attribute
    //pass platformdataattributesid to platform_dataattributes to return matching table
    //pull from the relevant table through the api and randomize based on the no_recs required
    //merge appropriate datastructure tables together (Person Demographics) and then return randomized merged set
  },
};
console.log(
  module.exports.buildComplexDataStructure("Person Demographics", 5000)
);
