import express from "express";
import uploadMiddleware from "../middlewares/upload.middleware.js";
import uploadFile from "../utils/upload.helper.js";

const router = express.Router();

// Route to upload a file - now super simple!
router.post("/", uploadMiddleware, (req, res, next) => uploadFile(req, res, null, next));


export default router;
