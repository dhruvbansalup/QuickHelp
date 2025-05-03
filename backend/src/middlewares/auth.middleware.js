import { User } from '../models/user.model.js';
import { BlacklistToken } from '../models/blacklistToken.model.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import asyncErrorHandler from '../utils/asyncErrorHandler.js';


const authUser = asyncErrorHandler(async (req, res, next) => {
    const token = req.cookies.token || req.headers.authorization?.split(' ')[1];
    if (!token) {
        return res.status(401).json({ message: 'Unauthorized' });
    }

    const isBlacklisted = await BlacklistToken.findOne({ token });
    if (isBlacklisted) {
        return res.status(401).json({ message: 'User already logged out.' });
    }

    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.findById(decoded._id);
    req.user = user;

    return next();
});

const authMiddleware = {
    authUser
};

export default authMiddleware;