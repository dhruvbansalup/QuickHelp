import cloudinary from "../config/cloudinary.config.js";
import fs from "fs"; // fs is used for file system operations

// This helper function handles file uploads to Cloudinary
// It expects the file to be uploaded via a middleware
const handleFileUpload = async (req, res, customFolder = null) => {
    let filePath;

    try {
        // Validate that file was uploaded
        if (!req.file) {
            throw new Error("No file uploaded");
        }

        // Use custom folder if provided, otherwise use the one from middleware/request

        let folder;
        if (customFolder!=null && customFolder!=undefined) {
            folder=String(customFolder).trim();
        }else if (req.body.folder) {
            folder = String(req.body.folder).trim();
        }else {
            folder= "general"; // Default folder if none provided
        }

        filePath = req.file.path;

        // Validate file path
        if (!filePath) {
            throw new Error("File path is not available");
        }

        //Check if the file exists
        if (!fs.existsSync(filePath)) {
            throw new Error("File does not exist at the specified path: " + filePath);
        }

        // Upload the file to Cloudinary
        const result = await cloudinary.uploader.upload(filePath, {
            folder: "QuickHelp" +"/"+ folder,
        });
        return {
            success: true,
            data: {
                url: result.secure_url,
                public_id: result.public_id,
                original_filename: req.file.originalname,
                file_size: req.file.size,
                mime_type: req.file.mimetype
            }
        };

    } catch (error) {
        console.error("Error uploading file:", error);
        throw error;
    } finally {
        // Clean up the file if it exists and upload failed
        if (filePath && fs.existsSync(filePath)) {
            try {
                fs.unlinkSync(filePath);
            } catch (unlinkError) {
                console.error("Error removing file after failed upload:", unlinkError);
            }
        }
    }
};

/**
 * Express middleware wrapper for handleFileUpload
 * Use this as the final middleware in upload routes
 */
const uploadFile = async (req, res, customFolder = null, next) => {
    try {
        const result = await handleFileUpload(req, res, customFolder);

        if (result.success) {
            res.status(200).json({
                message: "File uploaded successfully",
                data: result.data
            });
        } else {
            res.status(500).json({
                message: "Error uploading file to cloud storage",
                error: result.error || "Unknown error occurred"
            });
        }
    } catch (error) {
        console.error("Upload handler error:", error);
        res.status(500).json({
            message: "Error uploading file to cloud storage",
            error: error.message || "Unknown error occurred"
        });
    }
};

export default uploadFile;
