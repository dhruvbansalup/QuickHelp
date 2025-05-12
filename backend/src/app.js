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
import routes from "./routes/index.js";
app.use(routes);


// Error handling middleware
import errorHandler from "./middlewares/errorHandler.js";
app.use(errorHandler);

export default app;

