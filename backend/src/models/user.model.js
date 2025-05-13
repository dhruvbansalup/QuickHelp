// File: backend/src/models/user.js

import mongoose from "mongoose";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import AddressSchema from "./address.model.js";

const userSchema = new mongoose.Schema({
  email: { type: String, lowercase: true, required: true },
  password: { type: String, required: true, select: false, minlength: [6, "Password must be at least 6 characters long"] },
  phone: { type: Number },
  name: String,
  role: { type: String, enum: ["consumer", "service_provider", "admin"], required: true },
  isphoneverified: { type: Boolean, default: false },
  isemailverified: { type: Boolean, default: false },
  addresses: [AddressSchema],
  profilePic: { type: String },
}, {
  timestamps: true // Automatically manage createdAt and updatedAt fields
});

// Method to generate JWT token for the user
userSchema.methods.generateAuthToken = function () {
  const user = this;

  const token = jwt.sign({ _id: user._id }, process.env.JWT_SECRET, { expiresIn: "7d" });

  return token;
};

userSchema.methods.checkPassword = async function (password) {
  const user = await this.constructor.findById(this._id).select("+password");
  const isMatch = await bcrypt.compare(password, user.password);
  return isMatch;
};

userSchema.statics.hashPassword = async function (password) {
  const salt = await bcrypt.genSalt(10);
  return await bcrypt.hash(password, salt);
};

export const User = mongoose.model("User", userSchema);
