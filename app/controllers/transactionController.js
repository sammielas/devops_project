const Joi = require('joi');
const { transactions } = require('../models/transactionModel');

const schema = Joi.object({
  userId: Joi.string().required(),
  amount: Joi.number().positive().required(),
  currency: Joi.string().valid('USD', 'EUR', 'GBP').required(),
  type: Joi.string().valid('deposit', 'withdrawal').required()
});

exports.createTransaction = (req, res, next) => {
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
