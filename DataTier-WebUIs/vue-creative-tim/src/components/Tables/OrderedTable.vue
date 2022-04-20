<template>
  <div>
    <v-data-table :headers="headers" :items="items">
      <template v-slot:item="row">
        <tr>
          <td>{{ row.item.tablename }}</td>
          <td>{{ row.item.tableinformation }}</td>
          <td>
            <v-btn
              color="white"
              @click="onButtonClick(row.item)"
            >
            <a style="white"> View </a>
            </v-btn>
          </td>
        </tr>
      </template>
    </v-data-table>
    <v-dialog v-model="showModal" width="400">
      <v-card class="modal">
        <v-card-title class="modal-title">Selection Options</v-card-title>
        <v-card-text></v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            text
            @click="onButtonClick()"
            >Confirm</v-btn
          >
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
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
  },
  data() {
    return {
      selected: [],
      headers: [],
      showModal: false
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
    onButtonClick() {
      this.showModal = !this.showModal;
    },
  },
  beforeMount() {
    setTimeout(this.populated_table_data(), 2000);
  },
};
</script>
