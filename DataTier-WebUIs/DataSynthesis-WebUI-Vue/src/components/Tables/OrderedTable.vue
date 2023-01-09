<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="items"
      v-if="reference_table && !platform_table"
    >
      <template v-slot:item="row">
        <tr>
          <td>{{ row.item.tablename }}</td>
          <td>{{ row.item.tableinformation }}</td>
          <td v-if="reference_table">
            <v-btn color="white" @click="onButtonClick(row.item.tablename)">
              <a style="white"> View </a>
            </v-btn>
          </td>
        </tr>
      </template>
    </v-data-table>
    <v-data-table
      :headers="headers"
      :items="items"
      v-if="reference_table && platform_table"
    >
      <template v-slot:item="row">
        <tr>
          <td>{{ row.item.datastructurename }}</td>
          <td v-if="reference_table">
            <v-btn
              color="white"
              @click="onButtonClick(row.item.datastructurename)"
            >
              <a style="white"> View </a>
            </v-btn>
          </td>
        </tr>
      </template>
    </v-data-table>
    <v-data-table
      :headers="headers"
      :items="items"
      :search="search"
      v-if="!reference_table"
    >
      <template v-slot:top>
        <v-btn text @click="downloadFile()">Export</v-btn>
        <!-- <v-text-field
          v-model="search"
          label="Search (UPPER CASE ONLY)"
          class="mx-4"
        ></v-text-field> -->
      </template>
    </v-data-table>
    <v-dialog v-model="showModal" width="400">
      <v-card class="modal">
        <v-card-title class="modal-title">Selection Options</v-card-title>
        <v-card-text></v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text @click="onButtonClick()">Confirm</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import exportFromJSON from "export-from-json";
export default {
  name: "ordered-table",
  props: {
    tableHeaderColor: {
      type: String,
      default: "",
    },
    items: {
      type: Array,
      default: () => {
        return [];
      },
    },
    reference_table: {
      type: Boolean,
      default: false,
    },
    platform_table: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      selected: [],
      headers: [],
      showModal: false,
      search: "",
    };
  },
  computed: {},
  methods: {
    populated_table_data() {
      const keys = Array.from(
        this.items.reduce((a, c) => {
          Object.keys(c).forEach((e) => a.add(e));
          return a;
        }, new Set())
      );
      keys.forEach((item) => {
        console.log(item);
        this.headers.push({
          text: item,
          align: "left",
          sortable: true,
          value: item,
        });
      });
    },
    onButtonClick(table) {
      this.$emit("tableclicked", table);
      this.showModal = !this.showModal;
    },
    downloadFile() {
      const data = this.items;
      const fileName = "data_export";
      const exportType = exportFromJSON.types.csv;
      if (data) exportFromJSON({ data, fileName, exportType });
    },
  },
  beforeMount() {
    setTimeout(this.populated_table_data(), 2000);
  },
};
</script>
