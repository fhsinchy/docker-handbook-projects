/* eslint-disable no-undef */

const request = require('supertest');

const app = require('../../../app');

describe('GET /', () => {
  test('Responds with 200 status code and a message', async () => {
    const response = await request(app).get('/');

    expect(response.status).toBe(200);
    expect(response.body.message).toEqual('Bonjour, mon ami');
  });
});
