import express from 'express';
import morgan from 'morgan';
import dotenv from 'dotenv';
import swaggerUi from 'swagger-ui-express';

// Dynamic import with error handling
let swaggerDoc;
try {
  swaggerDoc = await import('./swagger/swagger.json', {
    assert: { type: 'json' }
  });
} catch (err) {
  console.error('❌ Failed to load Swagger JSON:', err);
  process.exit(1);
}

dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));

// Routes
import transactionRoutes from './routes/transactions.js';
import userRoutes from './routes/users.js';
import analyticsRoutes from './routes/analytics.js';
import errorHandler from './middleware/errorHandler.js';

app.use('/api/transactions', transactionRoutes);
app.use('/api/users', userRoutes);
app.use('/api/analytics', analyticsRoutes);
app.use('/api/docs', swaggerUi.serve, swaggerUi.setup(swaggerDoc.default));
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 FinTech API running on port ${PORT}`);
});