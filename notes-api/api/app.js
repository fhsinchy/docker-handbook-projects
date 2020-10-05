/**
 * Module dependencies.
 */

const cors = require('cors');
const logger = require('morgan');
const helmet = require('helmet');
const express = require('express');
const { Model } = require('objection');
const { isCelebrate } = require('celebrate');

const routes = require('./api');
const { Knex } = require('./services');

/**
 * ORM initialization.
 */

Model.knex(Knex);

/**
 * app instance initialization.
 */

const app = express();

/**
 * Middleware registration.
 */

app.use(cors());
app.use(helmet());
app.use(logger('dev'));
app.use(express.json());

/**
 * Route registration.
 */

app.use('/', routes);

/**
 * 404 handler.
 */

app.use((req, res, next) => {
  const err = new Error('Not Found!');
  err.status = 404;
  next(err);
});

/**
 * Error handler registration.
 */

// eslint-disable-next-line no-unused-vars
app.use((err, req, res, next) => {
  const status = isCelebrate(err) ? 400 : err.status || 500;
  const message =
    process.env.NODE_ENV === 'production' && err.status === 500
      ? 'Something Went Wrong!'
      : err.message;

  // eslint-disable-next-line no-console
  if (status === 500) console.log(err.stack);

  res.status(status).json({
    status: status >= 500 ? 'error' : 'fail',
    message,
  });
});

module.exports = app;
