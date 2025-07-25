// File: backend/src/routes/authRoutes.js
// Routes for authentication


import express from "express";
const router = express.Router();

//Importing Validators
import userValidators from "../middlewares/user.validator.js";
import { handleValidationErrors } from "../middlewares/validationHandler.js";

import authMiddleware from "../middlewares/auth.middleware.js";
import uploadMiddleware from "../middlewares/upload.middleware.js";

// Importing controllers
import userControllers from "../controllers/user.controller.js";


router.get("/", (req, res) => {
  res.send("Welcome to the authentication API!");
});

router.post("/register", userValidators.registerUser, handleValidationErrors, userControllers.registerUser);
router.post("/login", userValidators.loginUser, handleValidationErrors, userControllers.loginUser);
router.get("/profile",authMiddleware.authUser,userControllers.getUserProfile);
router.get("/logout",authMiddleware.authUser,userControllers.logoutUser);
router.get("/verifyToken",authMiddleware.authUser,(req, res)=>{res.status(200).json({message:"Token is valid!"})});
router.post("/doesEmailExists/",userValidators.doesEmailExists,handleValidationErrors,userControllers.doesEmailExists);

// Route to upload profile picture
router.post("/profile/picture", 
  authMiddleware.authUser,           // Authenticate user first
  uploadMiddleware,                  // Handle file upload and validation
  userControllers.uploadProfilePicture // Your controller method
);


export default router;
