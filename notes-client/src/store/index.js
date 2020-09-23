import Vue from 'vue';
import Vuex from 'vuex';
import axios from '../libs/axios';
import router from '../router';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    notes: [],
  },
  mutations: {
    insertNote(state, payload) {
      state.notes.push(payload);
    },
    deleteNote(state, payload) {
      state.notes.splice(state.notes.indexOf(payload), 1);
    },
  },
  actions: {
    async fetchNotes(context) {
      try {
        const response = await axios.get('/notes');

        response.data.data.notes.map((note) => context.commit('insertNote', note));
      } catch (error) {
        // eslint-disable-next-line no-console
        console.log(error);
      }
    },
    async createNote(context, payload) {
      try {
        const response = await axios.post('/notes', payload);

        context.commit('insertNote', response.data.data.note);

        router.push('/');
      } catch (error) {
        // eslint-disable-next-line no-console
        console.log(error);
      }
    },
    async deleteNote(context, payload) {
      try {
        await axios.delete(`/notes/${payload.id}`);

        context.commit('deleteNote', payload);
      } catch (error) {
        // eslint-disable-next-line no-console
        console.log(error);
      }
    },
  },
  modules: {
  },
});
