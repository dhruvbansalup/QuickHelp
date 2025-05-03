// File: backend/src/app.js
// Description: This file sets up the express application and middleware.

import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());


// Importing routes
import userRoutes from "./routes/user.route.js";

app.use("/user",userRoutes);


// Error handling middleware
import errorHandler from "./middlewares/errorHandler.js";
app.use(errorHandler);

export default app;

