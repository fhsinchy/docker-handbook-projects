module.exports = class NotesService {
  constructor(Note) {
    this.Note = Note;
  }

  async index() {
    return await this.Note.query();
  }

  async store(params) {
    return await this.Note.query().insert({
      title: params.title,
      content: params.content,
    });
  }

  async show(id) {
    const note = await this.Note.query().findById(id);

    if (!note) {
      const err = new Error('Not Found!');
      err.status = 404;
      throw err;
    }

    return note;
  }

  async update(id, params) {
    const note = await this.Note.query().findById(id).patch({
      title: params.title,
      content: params.content,
    });

    if (!note) {
      const err = new Error('Not Found!');
      err.status = 404;
      throw err;
    }

    return note;
  }

  async destroy(id) {
    const note = await this.Note.query().deleteById(id);

    if (!note) {
      const err = new Error('Not Found!');
      err.status = 404;
      throw err;
    }
    
    return note;
  }
};
