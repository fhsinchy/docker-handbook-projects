<template>
  <div id="app">
    <header>
        <router-link to="#" class="logo">Notes</router-link>
        <router-link :to="{ name: 'Home' }" class="button">Home</router-link>
        <router-link :to="{ name: 'Create' }" class="button">Create</router-link>
    </header>
    <router-view />
  </div>
</template>

<script>
export default {
  mounted() {
    this.$store.dispatch('fetchNotes');
  },
};
</script>
