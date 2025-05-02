// File: backend/src/routes/authRoutes.js
// Routes for authentication


import express from "express";
const router = express.Router();

//Importing Validators
import userValidators from "../middlewares/user.validator.js";
import { handleValidationErrors } from "../middlewares/validationHandler.js";


// Importing controllers
import userControllers from "../controllers/user.controller.js";


router.get("/", (req, res) => {
  res.send("Welcome to the authentication API!");
});

router.post("/register", userValidators.registerUser, handleValidationErrors, userControllers.registerUser);
router.post("/login", userValidators.loginUser, handleValidationErrors, userControllers.loginUser);


export default router;
