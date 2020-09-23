<template>
  <form method="POST" @submit.prevent="submit">
    <fieldset>
        <legend>Create Note</legend>
        <div class="input-group fluid vertical">
            <label for="title">Title</label>
            <input v-model="note.title" type="text" id="title"/>
        </div>
        <div class="input-group fluid vertical">
            <label for="content">Content</label>
            <textarea v-model="note.content" style="resize: none;"
            id="content" cols="20" rows="10" />
        </div>
        <button class="primary" type="submit">Save</button>
    </fieldset>
  </form>
</template>

<script>
export default {
  name: 'Create',
  data() {
    return {
      note: {
        title: '',
        content: '',
      },
    };
  },
  methods: {
    submit() {
      this.$store.dispatch('createNote', this.note);
    },
  },
};
</script>
