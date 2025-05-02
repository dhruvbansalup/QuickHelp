// File: backend/src/models/user.js

// Importing required modules
import mongoose from "mongoose";

// Schema for User
const userSchema = new mongoose.Schema({
  phone: { type: Number, unique: true, required: true },
  email: { type: String, unique: true, lowercase: true },
  name: String,
  role: { type: String, enum: ["consumer", "service_provider", "admin"], default: "consumer" }
}, {
  timestamps: true // Automatically manage createdAt and updatedAt fields
});

// Exporting the User model

export const User = mongoose.model("User", userSchema);
