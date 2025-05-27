import Joi from 'joi';
import { users } from '../models/userModel.js';

export const getUsers = (req, res) => {
  res.json(users);
};

export const createUser = (req, res, next) => {
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

// Optional: If you need a default export
// export default { getUsers, createUser };