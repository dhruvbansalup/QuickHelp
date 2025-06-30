// File: server.js
import dotenv from 'dotenv';

// Load .env File
dotenv.config();

// Importing the express app
import app from './src/app.js';

// Database Connection
import connectDB from './src/config/db.config.js';
connectDB();

//Get the port or use 5000 as default
const PORT = process.env.PORT || 5000;

//Run the server
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
