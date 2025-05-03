import mongoose from 'mongoose';


const blacklistTokenSchema = new mongoose.Schema({
    token: { type: String, required: true, unique: true },
}, {
    timestamps: true, // Automatically manage createdAt and updatedAt fields
    expireAfterSeconds: 7 * 24 * 60 * 60 * 1000, // Set TTL (Time To Live) to 7 days
});

export const BlacklistToken = mongoose.model('BlacklistToken', blacklistTokenSchema);
