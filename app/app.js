import express from 'express';
import morgan from 'morgan';
import dotenv from 'dotenv';
import client from 'prom-client'; 

dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));

// 🔥 Prometheus setup
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics();

app.get('/metrics', async (req, res) => {
  res.set('Content-Type', client.register.contentType);
  res.end(await client.register.metrics());
});

import transactionRoutes from './routes/transactions.js';
import userRoutes from './routes/users.js';
import analyticsRoutes from './routes/analytics.js';
import errorHandler from './middleware/errorHandler.js';

app.use('/api/transactions', transactionRoutes);
app.use('/api/users', userRoutes);
app.use('/api/analytics', analyticsRoutes);
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`FinTech API is running on port ${PORT}`);
});
