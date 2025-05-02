// File: backend/src/config/db.js

// Importing required modules
import mongoose from "mongoose";

// Connecting to MongoDB
const connectDB = async () => {
    try{
        const conn = await mongoose.connect(process.env.MONGO_URI);
        console.log(`MongoDB Connected: ${conn.connection.host}`);
    } catch (error) {
        console.error(`MongoDB Error: ${error.message}`);
        process.exit(1); // Exit process with failure
    }
};


export default connectDB;
