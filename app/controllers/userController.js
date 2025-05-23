const Joi = require('joi');
const { users } = require('../models/userModel');

exports.getUsers = (req, res) => {
  res.json(users);
};

exports.createUser = (req, res, next) => {
  const schema = Joi.object({
    name: Joi.string().required(),
    email: Joi.string().email().required()
  });

  const { error, value } = schema.validate(req.body);
  if (error) return next(error);

  const newUser = {
    id: users.length + 1,
    ...value,
    createdAt: new Date()
  };

  users.push(newUser);
  res.status(201).json(newUser);
};
