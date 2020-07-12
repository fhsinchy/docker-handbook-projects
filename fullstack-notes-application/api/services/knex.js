const knex = require('knex');

const config = require('../knexfile');

module.exports = knex(config[process.env.NODE_ENV]);
