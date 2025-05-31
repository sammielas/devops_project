import { transactions, users } from '../models/transactionModel.js';

export const getAnalytics = (req, res) => {
  const totalTransactions = transactions.length;
  const totalVolume = transactions.reduce((acc, tx) => acc + tx.amount, 0);
  const userCount = users.length;

  res.json({ totalTransactions, totalVolume, userCount });
};

// Optional: Export as default if needed elsewhere
// export default { getAnalytics };