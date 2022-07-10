import HTTP from "./HTTP";
// import apimap from "../configs/table_to_api_map";
const apimap = {
  "dataexisting_ababanking": '/dataexisting/ababanking',
  "<table>": "<path>"
}
export default {
  getDomainTables() {
    return HTTP().get(`/api/querydata/datamodel/datatables`);
  },
  getTableResults(table){
    console.log(table)
    return HTTP().get(`/api/querydata${apimap[table]}?limit=50`)
  }
}