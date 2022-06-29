// Goal here is to provide general queries and retrieve data based ONLY on StatusID value
// Status of 1 is Active and any other status is specific to defined business needs.
// the default is to show ONLY active records unless otherwise defined.
const buildBasicQueryMap = function(table, status) {
    const statusType = status=="Active"? "statusid=1" : "statusid>=1"
    const querymap = {
        "dataexisting_ababanking":`select * from dataexisting_ababanking where ${statusType}`,
        "dataexisting_areacode":`select * from dataexisting_areacode where ${statusType}`,
        "dataexisting_areacodeintl":`select * from dataexisting_areacodeintl where ${statusType}`,
        "dataexisting_companies":`select * from dataexisting_companies where ${statusType}`,
        "dataexisting_zipcode":`select * from dataexisting_zipcodeus where ${statusType}`,
        "dataexisting_zipcodeintl":`select * from dataexisting_zipcodeintl where ${statusType}`
    }
    //console.log(querymap[table])
    return querymap[table]
}
/*const buildBasicQueryMapWithState = function(table, status, statecode) {
    const statusType = status=="Active"? "statusid=1" : "statusid>=1"
    const stateCode = statecode="*" ? "statecode=TN" : "statecode=TN"
    const querymap2 = {
        "dataexisting_ababanking":`select * from dataexisting_ababanking where ${statusType},${stateCode}`,
        "dataexisting_zipcode":`select * from dataexisting_zipcode where ${statusType},${stateCode}`
    }
    //console.log(querymap[table])
    return querymap[table]
}*/

module.exports = buildBasicQueryMap
    //,buildBasicQueryMapWithState

