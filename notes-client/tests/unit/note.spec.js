import { shallowMount } from '@vue/test-utils';
import Note from '@/components/Note.vue';

describe('Note.vue', () => {
  it('renders props.note when passed', () => {
    const note = {
      title: 'Lorem ipsum',
      content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    };
    const wrapper = shallowMount(Note, {
      propsData: { note },
    });
    expect(wrapper.props().note).toBe(note);
  });
});
