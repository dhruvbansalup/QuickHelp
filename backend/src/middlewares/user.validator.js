import { body } from 'express-validator';

const registerUser = [
  body('phone')
    .notEmpty().withMessage("Phone Number is Required").bail()
    .isNumeric().withMessage('Phone number must be numeric'),
  body('email').optional().isEmail().withMessage('Invalid email format'),
  body('name').optional().isString().withMessage('Name must be a string'),
  body('role').optional().isIn(['consumer', 'service_provider', 'admin']).withMessage('Role must be one of consumer, service_provider, or admin')
];

const loginUser = [
  body('role').notEmpty().withMessage("Role is Required").bail()
    .isIn(['consumer', 'service_provider', 'admin']).withMessage('Role must be one of consumer, service_provider, or admin'),
  body('phone').optional().isNumeric().withMessage('Phone number must be numeric'),
  body('email').optional().isEmail().withMessage('Invalid email format')
];


// Exporting the validator functions
const userValidators = {
  registerUser,
  loginUser,
};

export default userValidators;
