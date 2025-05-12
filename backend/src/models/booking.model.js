import mongoose from 'mongoose';
import AddressSchema from './address.model.js';

const BookingSchema = new mongoose.Schema({
    requesterId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    serviceProviderId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    
    serviceId: { type: mongoose.Schema.Types.ObjectId, ref: 'Service' },
    isCustomRequest: { type: Boolean, default: false },
    customDetails: String,
    bookingTime: Date,

    location: { type: AddressSchema, required: true },

    chatId: { type: mongoose.Schema.Types.ObjectId, ref: 'Chat' },

    status: {
        type: String,
        enum: ['requested', 'discussion', 'quoted', 'accepted', 'in_progress', 'completed', 'rejected'],
        default: 'requested'
    },
    quotedPrice: Number,
    workBeforeImages: [{ type: String }],
    workAfterImages: [{ type: String }],
},
    {
        timestamps: true // Automatically manage createdAt and updatedAt fields
    });


const Booking = mongoose.model('Booking', BookingSchema);
export default Booking;