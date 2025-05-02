// File: backend/src/app.js
// Description: This file sets up the express application and middleware.

import express from "express";
import cors from "cors";

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Importing routes
import authRoutes from "./routes/authRoutes.js";

app.use(authRoutes);

export default app;

