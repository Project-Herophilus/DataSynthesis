const path = require('path')
require('dotenv').config({ path: path.resolve(__dirname, '../../../' + '.env') })
module.exports = {
        getData(count, state){
            let query_string = "";
            const schema = process.env.PostgreSQL_URL.split('/')[3]
            const tables = ['dataexisting_areacode','dataexisting_namefirst',
            'dataexisting_namelast','dataexisting_zipcodeus',
            'datagenerated_addresses','datagenerated_accountnumbers', 
            'datagenerated_dateofbirth','datagenerated_driverslicenses',
            'datagenerated_socialsecuritynumber','datagenerated_useridentities',
            'datagenerated_phonenumber'
        ]
            tables.forEach(table=>{
            query_string += ` select * from ${table} limit ${count} ;`
            })
            return query_string;
        },
        getDataFromTable(table, limit){
            return `select * from ${table} order by random() limit ${limit};`
        },
        getDataGenConfig(){
            return `select * from platform_config_datagen a,refdata_datagentypes b
            where a.datagentypeid=b.datagentypeid`
        },
    getDataGenConfig_WithDataGenTypeRelationship(){
        return `select * from platform_config_datagen a,refdata_datagentypes b, platform_dataattributes c
            where a.datagentypeid=b.datagentypeid and a.datagentypeid= b.datagentypeid and
         a.dataattributeid = c.platformdataattributesid`
    },
    getDataGenConfig_WithoutDataGenTypeRelationship() {
        return `select *
                from platform_config_datagen a,
                     platform_dataattributes b
                where a.dataattributeid = b.platformdataattributesid
                  and a.datagentypeid IS NULL`
    }
}
