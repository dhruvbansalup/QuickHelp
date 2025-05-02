import { User } from '../models/user.model.js';

const createUser = async ({
    phone,
    email,
    name,
    role,
}) => {
    if (!phone) {
        throw new Error('Phone number is required');
    }

    const user = new User({
        phone,
        email,
        name,
        role,
    });
    await user.save();

    return user;

};


const findUserWithPhone = async ({
    phone,
    role,
}) => {
    if (!phone && !email) {
        throw new Error('Phone number or email is required');
    }
    if (!role) {
        throw new Error('Role is required');
    }

    const user = await User.findOne({ phone, role });
    if (!user) {
        throw new Error('User not found');
    }

    return user;
}


//Exporting the service functions
const userServices = {
    createUser,
    findUserWithPhone,
};
export default userServices;


