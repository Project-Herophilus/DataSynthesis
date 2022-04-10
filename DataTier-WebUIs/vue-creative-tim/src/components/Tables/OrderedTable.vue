<template>
  <div>
    <v-data-table :headers="headers" :items="items"></v-data-table>
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
    };
  },
  computed: {
    headers() {
      const keys = Array.from(
        this.items.reduce((a, c) => {
          Object.keys(c).forEach((e) => a.add(e));
          return a;
        }, new Set())
      );
      console.log(keys)
      return keys
    },
  },
};
</script>
