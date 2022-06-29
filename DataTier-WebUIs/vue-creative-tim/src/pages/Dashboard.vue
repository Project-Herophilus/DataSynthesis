<template>
  <div class="content">
    <div class="md-layout">
      <!-- <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-33"
      >
        <chart-card
          :chart-data="dailySalesChart.data"
          :chart-options="dailySalesChart.options"
          :chart-type="'Line'"
          data-background-color="blue"
        >
          <template slot="content">
            <h4 class="title">Daily Sales</h4>
            <p class="category">
              <span class="text-success"
                ><i class="fas fa-long-arrow-alt-up"></i> 55%
              </span>
              increase in today sales.
            </p>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon>access_time</md-icon>
              updated 4 minutes ago
            </div>
          </template>
        </chart-card>
      </div> -->
      <!-- <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-33"
      >
        <chart-card
          :chart-data="emailsSubscriptionChart.data"
          :chart-options="emailsSubscriptionChart.options"
          :chart-responsive-options="emailsSubscriptionChart.responsiveOptions"
          :chart-type="'Bar'"
          data-background-color="red"
        >
          <template slot="content">
            <h4 class="title">Email Subscription</h4>
            <p class="category">Last Campaign Performance</p>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon>access_time</md-icon>
              updated 10 days ago
            </div>
          </template>
        </chart-card>
      </div> -->
      <!-- <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-33"
      >
        <chart-card
          :chart-data="dataCompletedTasksChart.data"
          :chart-options="dataCompletedTasksChart.options"
          :chart-type="'Line'"
          data-background-color="green"
        >
          <template slot="content">
            <h4 class="title">Completed Tasks</h4>
            <p class="category">Last Campaign Performance</p>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon>access_time</md-icon>
              campaign sent 26 minutes ago
            </div>
          </template>
        </chart-card>
      </div> -->
      <div
        class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25"
      >
        <stats-card data-background-color="green">
          <template slot="header">
            <md-icon>store</md-icon>
          </template>

          <template slot="content">
            <p class="category">Revenue</p>
            <h3 class="title">$34,245</h3>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon>date_range</md-icon>
              Last 24 Hours
            </div>
          </template>
        </stats-card>
      </div>
      <div
        class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25"
      >
        <stats-card data-background-color="orange">
          <template slot="header">
            <md-icon>content_copy</md-icon>
          </template>

          <template slot="content">
            <p class="category">Used Space</p>
            <h3 class="title">
              49/50
              <small>GB</small>
            </h3>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon class="text-danger">warning</md-icon>
              <a href="#pablo">Get More Space...</a>
            </div>
          </template>
        </stats-card>
      </div>
      <div
        class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25"
      >
        <stats-card data-background-color="red">
          <template slot="header">
            <md-icon>info_outline</md-icon>
          </template>

          <template slot="content">
            <p class="category">Fixed Issues</p>
            <h3 class="title">75</h3>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon>local_offer</md-icon>
              Tracked from Github
            </div>
          </template>
        </stats-card>
      </div> 
      <div
        class="md-layout-item md-medium-size-50 md-xsmall-size-100 md-size-25"
      >
        <stats-card data-background-color="blue">
          <template slot="header">
            <i class="fab fa-twitter"></i>
          </template>

          <template slot="content">
            <p class="category">Folowers</p>
            <h3 class="title">+245</h3>
          </template>

          <template slot="footer">
            <div class="stats">
              <md-icon>update</md-icon>
              Just Updated
            </div>
          </template>
        </stats-card>
      </div>
      <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-50"
      >
        <md-card>
          <md-card-header data-background-color="orange">
            <h4 class="title">Platform Tables Reference List</h4>
          </md-card-header>
          <md-card-content>
            <ordered-table :items="data_tables" :reference_table="true" table-header-color="orange" v-if="data_tables.length > 0" @tableclicked="populateResultsTable" style="max-height:600px; overflow:scroll"></ordered-table>
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
    },
    populateResultsTable(table){
      console.log(table)
      api.getTableResults(table).then(resp=>{
        this.result_fields = resp.data.rows;
        console.log(this.result_fields)
      })
    }
  },
  mounted(){
    api.getDomainTables().then(resp=>{
      this.populatedDataTables(resp.data.rows)
    }).catch(error=>{
      console.log(`error: ${error}`)
    })

  }
};
</script>
