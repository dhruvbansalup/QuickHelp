import { body } from 'express-validator';

const registerUser = [

  body('email')
    .notEmpty().withMessage("Email is Required").bail()
    .isEmail().withMessage('Invalid email format'),
  body('password')
    .notEmpty().withMessage("Password is Required").bail()
    .isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
  body('role')
    .notEmpty().withMessage("Role is Required").bail()
    .isIn(['consumer', 'service_provider', 'admin']).withMessage('Role must be one of consumer, service_provider, or admin'),
  body('phone').optional().isNumeric().withMessage('Phone number must be numeric'),
  body('name').optional().isString().withMessage('Name must be a string'),
];

const loginUser = [
  body('email')
    .notEmpty().withMessage("Email is Required").bail()
    .isEmail().withMessage('Invalid email format'),
  body('password')
    .notEmpty().withMessage("Password is Required").bail()
    .isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
  body('role')
    .notEmpty().withMessage("Role is Required").bail()
    .isIn(['consumer', 'service_provider', 'admin']).withMessage('Role must be one of consumer, service_provider, or admin'),
];


// Exporting the validator functions
const userValidators = {
  registerUser,
  loginUser,
};

export default userValidators;
