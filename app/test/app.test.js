// test/app.test.js
import { assert } from 'chai';
import request from 'supertest';
import express from 'express';
import userRoutes from '../routes/users.js';

const app = express();
app.use(express.json());
app.use('/users', userRoutes);

describe('User Routes', () => {
  it('GET /users should return 200', async () => {
    await request(app)
      .get('/users')
      .expect(200);
  });
});