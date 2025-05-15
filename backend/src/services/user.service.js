import User from '../models/user.model.js';
import { BlacklistToken } from '../models/blacklistToken.model.js';

const createUser = async ({
    email,
    password,
    phone,
    name,
    role,
}) => {
    if (!email){
        throw new Error('Email is required');
    };
    if (!password) {
        throw new Error('Password is required');
    }

    const existingUser = await User.findOne({ email, role });
    if (existingUser) {
        throw new Error('This email is already registered as a ' + role);
    }

    const hashedPassword = await User.hashPassword(password);

    const user = new User({
        phone,
        email,
        name,
        role,
        password: hashedPassword,
    });
    await user.save();

    return user;

};


const findUser = async ({
    email,
    role
}) => {
    if (!email) {
        throw new Error('Email is required');
    }
    if (!role) {
        throw new Error('Role is required');
    }
    
    const user = await User.findOne({ email, role });
    if (!user) {
        throw new Error(`${role} not found with this email`);
    }

    return user;
}

const blacklistToken= async (token) => {
    const blacklistedToken = new BlacklistToken({ token });
    await blacklistedToken.save();
}



// Exporting the service functions
const userServices = {
    createUser,
    findUser,
    blacklistToken,
};
export default userServices;


