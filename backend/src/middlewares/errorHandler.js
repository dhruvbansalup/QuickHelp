// errorHandler.js
// Global error handler middleware for Express.js applications
// This middleware captures errors thrown in the application and sends a structured response to the client.

const errorHandler = (err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    const message = err.message || "Internal Server Error";
    res.status(statusCode).json({
        status: "error",
        statusCode,
        message,
    });

    console.error(err.stack); // Log the error stack for debugging
};

export default errorHandler;