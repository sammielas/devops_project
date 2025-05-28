const express = require('express');
const morgan = require('morgan');
const dotenv = require('dotenv');
const swaggerUi = require('swagger-ui-express');
const swaggerDoc = require('./swagger/swagger.json');

dotenv.config();

const app = express();
app.use(express.json());
app.use(morgan('dev'));

const transactionRoutes = require('./routes/transactions');
const userRoutes = require('./routes/users');
const analyticsRoutes = require('./routes/analytics');

app.use('/api/transactions', transactionRoutes);
app.use('/api/users', userRoutes);
app.use('/api/analytics', analyticsRoutes);
app.use('/api/docs', swaggerUi.serve, swaggerUi.setup(swaggerDoc));

const errorHandler = require('./middleware/errorHandler');
app.use(errorHandler);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`FinTech API is running on port ${PORT}`);
});
