
export default (err, req, res, next) => {
  console.error(err.message);
  res.status(400).json({ error: err.message });
};