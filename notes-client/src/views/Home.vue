<template>
  <div v-if="notes.length > 0" class="container row">
    <note v-for="note in notes" :key="note.id" :note="note" />
  </div>
  <div v-else class="container row">
    <div class="card fluid warning">
      <h3>Empty!</h3>
      <p>Awkward silence!</p>
    </div>
  </div>
</template>

<script>
import Note from '@/components/Note.vue';

export default {
  name: 'Home',
  components: {
    Note,
  },
  computed: {
    notes() {
      return this.$store.state.notes;
    },
  },
};
</script>
