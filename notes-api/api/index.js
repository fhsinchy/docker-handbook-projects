const { Router } = require('express');

const routes = Router();

routes.get('/', (req, res) => {
  res.status(200).json({
    error: false,
    message: 'Bonjour, mon ami',
  });
});

require('./routes/notes')(routes);

module.exports = routes;
