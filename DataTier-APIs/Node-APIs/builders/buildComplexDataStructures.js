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
  async buildComplexDataStructure(datastructure, no_recs) {
    let merged_array = [];
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
    const result = await db.RecordSpecificResponse(data_structure_query).then(async res => {
      let sql_query = "";
      res.rows.forEach(datastructure=>{
          const table_filter = table_to_field_name.filter(table => table.platformtablename == datastructure.platformtablename)
          sql_query += `select ${table_filter[0].platformfieldname} from ${table_filter[0].platformtablename} order by random() limit ${no_recs};`
          //console.log(sql_query)
      })
      await db.RecordSpecificResponse(sql_query).then(resp=>{
        resp.forEach(data=>{
            data_structure_complete.push(data.rows)
        })
        merged_array = Array.from({
          length: data_structure_complete[0].length
        }, (_, index) => Object.assign({}, ...data_structure_complete.map(({[index]: obj}) => obj)))
        })
        return merged_array
        });
        return result;
  }
};