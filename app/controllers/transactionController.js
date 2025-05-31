import Joi from 'joi';
import { transactions } from '../models/transactionModel.js';

const schema = Joi.object({
  userId: Joi.string().required(),
  amount: Joi.number().positive().required(),
  currency: Joi.string().valid('USD', 'EUR', 'GBP').required(),
  type: Joi.string().valid('deposit', 'withdrawal').required()
});

export const createTransaction = (req, res, next) => {
  const { error, value } = schema.validate(req.body);
  if (error) return next(error);

  const newTx = {
    id: transactions.length + 1,
    ...value,
    timestamp: new Date()
  };

  transactions.push(newTx);
  res.status(201).json(newTx);
};

// Optional: Export as default if needed
// export default { createTransaction };