/* eslint-disable no-undef */

const request = require('supertest');

const app = require('../../../../app');
const { Knex } = require('../../../../services');

require('dotenv').config();

beforeEach(() => {
  return Knex.migrate.latest();
});

afterEach(() => {
  return Knex.migrate.rollback();
});

afterAll(() => {
  return Knex.destroy();
});

describe('GET /notes', () => {
  test('Responds with 200 status code', async () => {
    const response = await request(app).get('/notes');

    expect(response.status).toBe(200);
    expect(response.body.data);
  });
});

describe('POST /notes', () => {
  test('Creates an new note in the database', async () => {
    const note = {
      title: 'Lorem ipsum',
      content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    };
    const response = await request(app).post('/notes').send(note);

    expect(response.status).toBe(201);
  });
});

describe('GET /notes/1', () => {
  test('Returns a single note from the database', async () => {
    const note = {
      title: 'Lorem ipsum',
      content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    };
    await request(app).post('/notes').send(note);

    const response = await request(app).get('/notes/1');

    expect(response.status).toBe(200);
  });
});

describe('PUT /notes/1', () => {
  test('Updates a single note in the database', async () => {
    const note = {
      title: 'Lorem ipsum',
      content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    };
    const updatedNote = {
      title: 'Lorem ipsum [UPDATED]',
      content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    };

    await request(app).post('/notes').send(note);

    const response = await request(app).put('/notes/1').send(updatedNote);

    expect(response.status).toBe(200);
  });
});

describe('DELETE /notes/1', () => {
  test('Deletes a single note from the database', async () => {
    const note = {
      title: 'Lorem ipsum',
      content:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    };

    await request(app).post('/notes').send(note);

    const response = await request(app).delete('/notes/1');

    expect(response.status).toBe(200);
  });
});
