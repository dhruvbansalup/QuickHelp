
import express from 'express';
const router = express.Router();

//Import Routes
import userRoutes from './user.route.js';
import serviceRoutes from './service.route.js';


router.use('/user', userRoutes);
router.use('/service', serviceRoutes);

export default router;
