import express from 'express';
import morgan from 'morgan';
import dotenv from 'dotenv';
import swaggerUi from 'swagger-ui-express';
import { readFile } from 'fs/promises';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';

dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));

// Get the current module's directory path
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Load Swagger JSON file
let swaggerDoc;
try {
  const swaggerPath = join(__dirname, 'swagger', 'swagger.json');
  const fileContent = await readFile(swaggerPath, 'utf-8');
  swaggerDoc = JSON.parse(fileContent);
} catch (error) {
  console.error('Failed to load Swagger documentation:', error);
  process.exit(1);
}

// Import routes
import transactionRoutes from './routes/transactions.js';
import userRoutes from './routes/users.js';
import analyticsRoutes from './routes/analytics.js';
import errorHandler from './middleware/errorHandler.js';

// Setup routes
app.use('/api/transactions', transactionRoutes);
app.use('/api/users', userRoutes);
app.use('/api/analytics', analyticsRoutes);
app.use('/api/docs', swaggerUi.serve, swaggerUi.setup(swaggerDoc));
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`FinTech API is running on port ${PORT}`);
});