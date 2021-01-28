#!/usr/bin/env node

/**
 * Module dependencies.
 */

const http = require('http');
const dotenv = require('dotenv');
const app = require('../app');

dotenv.config();

/**
 * Get port from environment and store in Express.
 */

const host = process.env.HOST || 'http://127.0.0.1';
const port = process.env.PORT || 3000;
app.set('port', port);

/**
 * Create HTTP server.
 */

const server = http.createServer(app);

/**
 * Listen on provided port, on all network interfaces.
 */
// eslint-disable-next-line no-console
console.log(`app running -> ${host}:${port}`);
server.listen(port);
