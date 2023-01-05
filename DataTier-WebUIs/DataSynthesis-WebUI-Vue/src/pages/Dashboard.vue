<template>
  <div class="content">
    <div class="md-layout">
      <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-50"
      >
        <md-card>
          <md-card-header data-background-color="orange">
            <h4 class="title">Platform Tables Reference List</h4>
          </md-card-header>
          <md-card-content>
            <ordered-table v-if="data_tables && data_tables.length > 0" :items="data_tables" :reference_table="true" :platform_table="false" table-header-color="orange" @tableclicked="populateResultsTable" style="max-height:600px; overflow:scroll"></ordered-table>
          </md-card-content>
        </md-card>
      </div>
      <div
        class="md-layout-item md-xlarge-size-100 md-xsmall-size-100 md-size-50"
      >
              <md-card>
          <md-card-header data-background-color="orange">
            <h4 class="title">Table Results</h4>
          </md-card-header>
          <md-card-content>
            <ordered-table  v-if="result_fields && result_fields.length > 0" :items="result_fields" :reference_table="false" :platform_table="true" table-header-color="orange" style="max-height:600px; overflow:scroll"></ordered-table>
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
    populateResultsTable(table){
      this.result_fields = [];
      api.getTableResults(table).then(resp=>{
        this.result_fields = resp.data;
        console.log(this.result_fields)
      })
    }
  },
  mounted(){
    api.getDomainTables().then(resp=>{
      this.data_tables = resp.data;
    }).catch(error=>{
      console.log(`error: ${error}`)
    })

  }
};
</script>
