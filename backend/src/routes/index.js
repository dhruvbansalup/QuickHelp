
import express from 'express';
const router = express.Router();

//Import Routes
import userRoutes from './user.route.js';
import serviceRoutes from './service.route.js';
import uploadRoutes from './upload.routes.js';


router.use('/user', userRoutes);
router.use('/service', serviceRoutes);
router.use('/upload', uploadRoutes);

export default router;
