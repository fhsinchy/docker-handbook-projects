const { Model } = require('objection');

class Note extends Model {
  static get tableName() {
    return 'notes';
  }
}

module.exports = Note;
