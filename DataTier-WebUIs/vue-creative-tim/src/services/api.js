import HTTP from "./HTTP";

export default {
  getDomainTables() {
    return HTTP().get(`/api/querydata/datamodel/datatables`);
  }
}