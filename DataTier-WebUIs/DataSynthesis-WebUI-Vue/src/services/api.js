import HTTP from "./HTTP";
// import apimap from "../configs/table_to_api_map";
const apimap = {
  "dataexisting_ababanking": '/dataexisting/ababanking',
  "dataexisting_areacode": "/dataexisting/areacode",
  "dataexisting_areacodeintl":"/dataexisting/areacodeintl",
  "dataexisting_companies": "/dataexisting/companies",
  "dataexisting_upccodes": "/dataexisting/upcodes",
  "dataexisting_namefirst": "/dataexisting/namefirst",
  "dataexisting_namelast": "/dataexisting/namelast",
  "datagenerated_accountnumbers": "/datagenerated/accountnumbers",
  "dataexisting_zipcodeus": "/dataexisting/zipcodeus",
  "dataexisting_zipcodeintl": "/dataexisting/zipcodeintl"
}
export default {
  getDomainTables() {
    return HTTP().get(`/api/querydata/datamodel/datatables`);
  },
  getDataStructures(){
    return HTTP().get(`/api/querydata/dataplatform/datastructures`)
  },
  getTableResults(table){
    console.log(table)
    return HTTP().get(`/api/querydata${apimap[table]}?limit=50`)
  },
  getDataStructureDetails(datastructure){
    console.log(datastructure)
    return HTTP().get(`/api/generatedata/generatedatastructures/namedstructure?count=5000&datastructurename=${datastructure}`)
  },
  createDataStructures(data){
    console.log(data)
    return HTTP().post(`/api/upsertdata/datamanagement/createdatastructure`,JSON.stringify(data))
  }
}