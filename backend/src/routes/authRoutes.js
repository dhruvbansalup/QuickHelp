// File: backend/src/routes/authRoutes.js
// Routes for authentication

import express from "express";

// Importing controllers
import authController from "../controllers/authController.js";

const router = express.Router();

router.get("/", (req, res) => {
  res.send("Welcome to the authentication API!");
});

router.post("/api/register", authController.register);
router.post("/api/login", authController.login);


export default router;
