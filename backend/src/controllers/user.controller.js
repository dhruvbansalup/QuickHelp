//Controller for user authentication and registration
import userServices from "../services/user.service.js";
import asyncErrorHandler from "../utils/asyncErrorHandler.js";
import uploadFile from "../utils/upload.helper.js";


const registerUser = asyncErrorHandler(async (req, res, next) => {
  const { phone, email, name, role, password } = req.body;

  if (role == "admin") {
    return res.status(400).json({ message: "Admin registration is not allowed" });
  }

  const user = await userServices.createUser({
    email,
    password,
    phone,
    name,
    role,
  });
  delete user._doc.password; // Remove password from the response

  res.status(201).json({ message: "User registered successfully!" });
});


const loginUser = asyncErrorHandler(async (req, res, next) => {
  const { email, password, role } = req.body;
  if (!password) {
    return res.status(400).json({ message: "Password is required" });
  }

  const user = await userServices.findUser({
    email,
    role,
  });

  const isPassVerified = await user.checkPassword(password);
  if (!isPassVerified) {
    return res.status(401).json({ message: "Invalid password" });
  }

  const token = user.generateAuthToken();
  res.cookie("token", token, {
    maxAge: 7 * 24 * 60 * 60 * 1000, // 7 days
  });
  res.status(200).json({ message: "User logged in successfully!", token });
});


const logoutUser = asyncErrorHandler(async (req, res, next) => {
  res.clearCookie("token");
  const token = req.cookies.token || req.headers.authorization?.split(" ")[1];

  await userServices.blacklistToken(token);

  res.status(200).json({ message: "User logged out successfully!" });
});



const getUserProfile = asyncErrorHandler(async (req, res, next) => {
  const user = req.user;
  res.status(200).json({ message: "User profile retrieved successfully!", user });
});


const doesEmailExists = asyncErrorHandler(async (req, res, next) => {
  const { email, role } = req.body;

  const user = await userServices.findUser({ email,role });
  if (user) {
    return res.status(200).json({ message: `Email already registered as ${role}` });
  } else {
    return res.status(401).json({ message: `Email not registered as ${role}` });
  }
});

// Controller for uploading profile pictures
const uploadProfilePicture = asyncErrorHandler(async (req, res, next) => {
  // uploadMiddleware should be applied to the route before this controller
  // All file validations are already done in the middleware
  
  const userId = req.user.id; // Assuming have auth middleware that sets req.user
  
  // Upload file to cloudinary with custom folder
  const uploadResult = await uploadFile(req, res, 'profile-pictures');
  
  if (!uploadResult.success) {
    return res.status(500).json({
      message: "Failed to upload profile picture",
      error: uploadResult.error
    });
  }

  // Update user profile with new image URL
  const updatedUser = await userServices.updateUser(userId, {
    profilePic: {
      url: uploadResult.data.url,
      public_id: uploadResult.data.public_id
    }
  });

  res.status(200).json({
    message: "Profile picture updated successfully",
    data: {
      user: updatedUser,
      upload: uploadResult.data
    }
  });
});

// Exporting the controller functions
const userControllers = {
  registerUser,
  loginUser,
  logoutUser,
  getUserProfile,
  doesEmailExists,
  uploadProfilePicture, // Add the new upload method
};

export default userControllers;
