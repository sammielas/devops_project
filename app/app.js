import express from 'express';
import morgan from 'morgan';
import dotenv from 'dotenv';
import swaggerUi from 'swagger-ui-express';
import swaggerDoc from './swagger/swagger.json';

dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));

import transactionRoutes from './routes/transactions.js';
import userRoutes from './routes/users.js';
import analyticsRoutes from './routes/analytics.js';
import errorHandler from './middleware/errorHandler.js';

app.use('/api/transactions', transactionRoutes);
app.use('/api/users', userRoutes);
app.use('/api/analytics', analyticsRoutes);
app.use('/api/docs', swaggerUi.serve, swaggerUi.setup(swaggerDoc));
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`FinTech API is running on port ${PORT}`);
});
