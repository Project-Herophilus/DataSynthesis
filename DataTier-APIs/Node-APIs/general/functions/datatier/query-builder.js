module.exports = {
        getData(count, state){
            let query_string = "";
            const schema = "datasynthesis"
            const tables = ['dataexisting_areacode','dataexisting_namefirst',
            'dataexisting_namelast','dataexisting_zipcodeus',
            'datagenerated_addresses','datagenerated_accountnumbers', 
            'datagenerated_dateofbirth','datagenerated_driverslicenses',
            'datagenerated_socialsecuritynumber','datagenerated_useridentities',
            'datagenerated_phonenumber'
        ]
            tables.forEach(table=>{
            query_string += ` select * from ${schema}.${table} limit ${count} ;`
            })
            return query_string;
        },
        getDataFromTable(table, limit){
            return `select * from ${table} order by random() limit ${limit};`
        },
        getDataGenConfig(){
            return `select * from platform_config_datagen a,refdata_datagentypes b where a.datagentypeid=b.datagentypeid`
        }

}
