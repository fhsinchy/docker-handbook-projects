<template>
  <div class="card fluid">
    <h3>{{ note.title }}</h3>
    <p>{{ note.content }}</p>
    <button @click="destroy" class="secondary">Delete</button>
  </div>
</template>

<script>
export default {
  name: 'Note',
  props: {
    note: Object,
  },
  methods: {
    destroy() {
      this.$store.dispatch('deleteNote', this.note);
    },
  },
};
</script>
