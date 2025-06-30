//This saves the uploaded file to a local directory and validates that the file was uploaded successfully.

import multer from "multer"; // multer is used for handling multipart/form-data.
import fs from "fs"; // fs is used for file system operations
import path from "path";


const uploadsDir = "uploads/";

// Local storage configuration
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, uploadsDir); // specify the directory to store uploaded files
    },
    filename: (req, file, cb) => {
        // Generate unique filename to prevent conflicts
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const fileExtension = path.extname(file.originalname);
        const fileName = path.basename(file.originalname, fileExtension) + '-' + uniqueSuffix + fileExtension;
        cb(null, fileName);
    }
});

// multer instance
const upload = multer({
    storage: storage,
    limits: {
        fileSize: 10 * 1024 * 1024, // 10MB limit
    },
    fileFilter: (req, file, cb) => {
        // Allow common image and document formats
        const allowedMimes = [
            'image/jpeg',
            'image/jpg',
            'image/png',
            'image/gif',
            'image/webp',
            'application/pdf',
            'application/msword',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
        ];

        if (allowedMimes.includes(file.mimetype)) {
            cb(null, true);
        } else {
            cb(new Error('Invalid file type. Only images and documents are allowed.'), false);
        }
    }
});


// Middleware to handle file uploads
const uploadMiddleware = (req, res, next) => {
    
    // Ensure uploads directory exists
    if (!fs.existsSync(uploadsDir)) {
        fs.mkdirSync(uploadsDir, { recursive: true });
    }
    
    upload.single('file')(req, res, (err) => {
        // Handle multer errors
        if (err instanceof multer.MulterError) {
            if (err.code === 'LIMIT_FILE_SIZE') {
                return res.status(400).json({
                    message: "File too large. Maximum size is 10MB."
                });
            }
            return res.status(400).json({
                message: "File upload error: " + err.message
            });
        } else if (err) {
            return res.status(400).json({
                message: err.message
            });
        }

        // Check if file was uploaded
        if (!req.file) {
            return res.status(400).json({
                message: "No file uploaded. Please select a file."
            });
        }

        // Validate file exists on disk
        if (!fs.existsSync(req.file.path)) {
            return res.status(500).json({
                message: "File upload failed. File not found on server."
            });
        }

        // Add default folder if not provided
        if (!req.body.folder) {
            req.body.folder = 'general';
        }

        // All validations passed, proceed to next middleware/route
        next();
    });
};

// Export the upload middleware for use in routes
export default uploadMiddleware;
