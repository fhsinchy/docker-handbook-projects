/* eslint-disable func-names */

exports.up = function (knex) {
  return knex.schema.createTable('notes', (table) => {
    table.increments();
    table.string('title').notNullable();
    table.text('content').notNullable();
  });
};

exports.down = function (knex) {
  return knex.schema.dropTable('notes');
};
