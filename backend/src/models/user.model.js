// File: backend/src/models/user.js

import mongoose from "mongoose";
import jwt from "jsonwebtoken";

const userSchema = new mongoose.Schema({
  phone: { type: Number, unique: true, required: true },
  email: { type: String, unique: true, lowercase: true },
  name: String,
  role: { type: String, enum: ["consumer", "service_provider", "admin"], default: "consumer" },
  isphoneverified: { type: Boolean, default: false },
  isemailverified: { type: Boolean, default: false },
}, {
  timestamps: true // Automatically manage createdAt and updatedAt fields
});

// Method to generate JWT token for the user
userSchema.methods.generateAuthToken = function () {
  const user = this;
  
  const token = jwt.sign({ _id: user._id, role: user.role }, process.env.JWT_SECRET, { expiresIn: "7d" });
  
  return token;
};


export const User = mongoose.model("User", userSchema);
