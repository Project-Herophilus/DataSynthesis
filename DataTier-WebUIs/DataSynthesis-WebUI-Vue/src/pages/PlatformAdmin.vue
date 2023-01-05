<template>
  <div data-app class="content">
    <div class="md-layout">
      <div
        class="md-layout-item md-medium-size-100 md-xsmall-size-100 md-size-50"
      >
        <md-card>
          <md-card-header data-background-color="orange">
            <h4 class="title">Data Structures List</h4>
          </md-card-header>
          <md-card-content>
            <span class="right-align">
              <md-button
                class="md-icon-button"
                @click="dialog = true"
                style="align-content: right"
              >
                <md-icon>add</md-icon>
              </md-button>
            </span>
            <ordered-table
              :items="data_tables"
              :reference_table="true"
              :platform_table="true"
              table-header-color="orange"
              v-if="data_tables.length > 0"
              @tableclicked="populateResultsTable"
              style="max-height: 600px; overflow: scroll"
            ></ordered-table>
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
            <ordered-table
              :items="result_fields"
              :reference_table="false"
              :platform_table="true"
              table-header-color="orange"
              v-if="result_fields.length > 0"
              style="max-height: 600px; overflow: scroll"
            ></ordered-table>
          </md-card-content>
        </md-card>
      </div>
    </div>
    <v-dialog v-model="dialog" persistent max-width="400px">
      <v-card>
        <v-card-title>
          <span class="text-h5">Data Structure</span>
        </v-card-title>
        <v-card-text>
          <v-form v-model="valid">
            <v-container>
              <v-row>
                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-text-field
                    v-model="form_data.datastructurename"
                    label="Data Structure Name"
                    required
                  ></v-text-field>
                </v-col>

                <v-col cols="12" sm="6" md="6" lg="6">
                  <v-text-field
                    v-model="form_data.sensitivityflag"
                    label="Sensitivity Flag"
                    hint="1-undefined,2-PHI, 3-PII, 4-reference data, 5-general data"
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="blue darken-1" text @click="dialog = false">
            Close
          </v-btn>
          <v-btn color="blue darken-1" text @click="createDataStructure()">
            Save
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import api from "../services/api.js";
import { OrderedTable } from "@/components";

export default {
  components: {
    OrderedTable,
  },
  data() {
    return {
      data_tables: [],
      result_fields: [],
      table_chosen: "",
      dialog: false,
      form_data: {
        datastructurename: "",
        sensitivityflag: ""
      }
    };
  },
  methods: {
    populatedDataTables(data_response) {
      this.data_tables = data_response;
      console.log(this.data_tables);
    },
    populateResultsTable(datastructurename) {
      this.result_fields = [];
      console.log(datastructurename);
      api.getDataStructureDetails(datastructurename).then((resp) => {
        console.log(resp);
        this.result_fields = resp.data;
      });
    },
    createDataStructure() {
      this.dialog = false;
      api.createDataStructures(this.form_data).then(resp=>{
        window.alert(resp)
      })
    },
  },
  mounted() {
    api
      .getDataStructures()
      .then((resp) => {
        this.populatedDataTables(resp.data);
      })
      .catch((error) => {
        console.log(`error: ${error}`);
      });
  },
};
</script>
<style>
.right-align {
  text-align: right;
  margin-left: auto;
  margin-right: auto;
}
</style>