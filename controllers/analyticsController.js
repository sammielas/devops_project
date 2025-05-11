const { transactions } = require('../models/transactionModel');
const { users } = require('../models/userModel');

exports.getAnalytics = (req, res) => {
  const totalTransactions = transactions.length;
  const totalVolume = transactions.reduce((acc, tx) => acc + tx.amount, 0);
  const userCount = users.length;

  res.json({
    totalTransactions,
    totalVolume,
    userCount
  });
};
