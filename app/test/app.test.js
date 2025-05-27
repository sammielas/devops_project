// test/app.test.js
const { assert } = require('chai');
const request = require('supertest');
const express = require('express');
const userRoutes = require('../routes/users');

const app = express();
app.use(express.json());
app.use('/users', userRoutes);

describe('User Routes', () => {
  it('GET /users should work', (done) => {
    request(app)
      .get('/users')
      .expect(200, done);
  });
});