<template>
  <div class="content">
    <div class="md-layout">
      <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-50"
      >
        <md-card>
          <md-card-header data-background-color="orange">
            <h4 class="title">Data Structures List</h4>
          </md-card-header>
          <md-card-content>
            <ordered-table :items="data_tables" :reference_table="true" :platform_table="true" table-header-color="orange" v-if="data_tables.length > 0" @tableclicked="populateResultsTable" style="max-height:600px; overflow:scroll"></ordered-table>
          </md-card-content>
        </md-card>
      </div>
      <div
        class="md-layout-item md-xlarge-size-100 md-xsmall-size-100 md-size-50"
      >
              <md-card>
          <md-card-header data-background-color="orange">
            <h4 class="title">Data Attributes</h4>
          </md-card-header>
          <md-card-content>
            <ordered-table :items="result_fields" table-header-color="orange" v-if="result_fields.length > 0" style="max-height:600px; overflow:scroll"></ordered-table>
          </md-card-content>
        </md-card>
      </div>
    </div>
  </div>
</template>

<script>
import api from '../services/api.js';
import {
  OrderedTable,
} from "@/components";

export default {
  components: {
    OrderedTable
  },
  data() {
    return {
      data_tables: [],
      result_fields: [],
      table_chosen: ""
    }
  },
  methods: {
    populatedDataTables(data_response){
      this.data_tables = data_response
      console.log(this.data_tables)
    },
    populateResultsTable(datastructurename){
        console.log(datastructurename)
      api.getDataStructureDetails(datastructurename).then(resp=>{
          console.log(resp)
        this.result_fields = resp.data
      })
    }
  },
  mounted(){
    api.getDataStructures().then(resp=>{
      this.populatedDataTables(resp.data.rows)
    }).catch(error=>{
      console.log(`error: ${error}`)
    })

  }
};
</script>
