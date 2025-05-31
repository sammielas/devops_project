import { transactions } from '../models/transactionModel.js';
import { users } from '../models/userModel.js'; 

export const getAnalytics = (req, res) => {
  const totalTransactions = transactions.length;
  const totalVolume = transactions.reduce((acc, tx) => acc + tx.amount, 0);
  const userCount = users.length;

  res.json({ totalTransactions, totalVolume, userCount });
};

