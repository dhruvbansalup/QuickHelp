

import express from 'express';
const router = express.Router();

//Importing Controllers
import { serviceControllers } from '../controllers/index.js';

router.get('/categories', serviceControllers.listServiceCategories);


export default router;