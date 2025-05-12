
import mongoose from 'mongoose';

const ServiceProviderGallerySchema = new mongoose.Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    about: { type: String },
    images: [{ type: String, required: true }],
}, {
    timestamps: true
});

const Gallery = mongoose.model('Gallery', ServiceProviderGallerySchema);
export default Gallery;
