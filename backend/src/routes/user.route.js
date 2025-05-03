// File: backend/src/routes/authRoutes.js
// Routes for authentication


import express from "express";
const router = express.Router();

//Importing Validators
import userValidators from "../middlewares/user.validator.js";
import { handleValidationErrors } from "../middlewares/validationHandler.js";

import authMiddleware from "../middlewares/auth.middleware.js";


// Importing controllers
import userControllers from "../controllers/user.controller.js";


router.get("/", (req, res) => {
  res.send("Welcome to the authentication API!");
});

router.post("/register", userValidators.registerUser, handleValidationErrors, userControllers.registerUser);
router.post("/login", userValidators.loginUser, handleValidationErrors, userControllers.loginUser);
router.get("/profile",authMiddleware.authUser,userControllers.getUserProfile);
router.get("/logout",authMiddleware.authUser,userControllers.logoutUser);


export default router;
