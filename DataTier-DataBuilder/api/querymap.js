const buildQueryMap = function(table, status) {
    const statusType = status=="Active"? "statusid=1" : "statusid>=1"
    const querymap = {
        "dataexisting_ababanking":`select * from dataexisting_ababanking where ${statusType}`

    }
    //console.log(querymap[table])
    return querymap[table]
}


module.exports = buildQueryMap
