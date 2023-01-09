import HTTP from "./HTTP";
// import apimap from "../configs/table_to_api_map";
const apimap = {
  "dataexisting_ababanking": '/api/querydata/dataexisting/ababanking',
  "dataexisting_areacode": "/api/querydata/dataexisting/areacode",
  "dataexisting_areacodeintl":"/api/querydata/dataexisting/areacodeintl",
  "dataexisting_companies": "/api/querydata/dataexisting/companies",
  "dataexisting_upccodes": "/api/querydata/dataexisting/upcodes",
  "dataexisting_namefirst": "/api/querydata/dataexisting/namefirst",
  "dataexisting_namelast": "/api/querydata/dataexisting/namelast",
  "datagenerated_accountnumbers": "/api/querydata/datagenerated/accountnumbers",
  "dataexisting_zipcodeus": "/api/querydata/dataexisting/zipcodeus",
  "dataexisting_zipcodeintl": "/api/querydata/dataexisting/zipcodeintl",
  "datagenerated_serialnumbers": "/api/generatedata/generate/serialnumber-complex"
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
    return HTTP().get(`${apimap[table]}?limit=50`)
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