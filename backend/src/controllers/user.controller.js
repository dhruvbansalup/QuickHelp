//Controller for user authentication and registration
import userServices from "../services/user.service.js";
import asyncErrorHandler from "../utils/asyncErrorHandler.js";


const registerUser = asyncErrorHandler(async (req, res, next) => {
  const { phone, email, name, role } = req.body;
  const user = await userServices.createUser({
    phone,
    email,
    name,
    role,
  });

  const token = user.generateAuthToken();

  res.status(201).json({ message: "User registered successfully!", user, token });
});


const loginUser = asyncErrorHandler(async (req, res) => {
  const { phone, role } = req.body;
  const user = await userServices.findUserWithPhone({
    phone,
    role,
  });

  const token = user.generateAuthToken();

  res.status(200).json({ message: "User logged in successfully!", user, token });
});


// Exporting the controller functions
const userControllers = {
  registerUser,
  loginUser,
};

export default userControllers;
