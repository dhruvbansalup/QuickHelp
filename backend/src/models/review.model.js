import mongoose from 'mongoose';

const ReviewSchema = new mongoose.Schema({
  bookingId: { type: mongoose.Schema.Types.ObjectId, ref: 'Booking' },
  reviewerId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  rating: { type: Number, min: 1, max: 5 },
  comment: String
},{
  timestamps: true // Automatically manage createdAt and updatedAt fields
});

const Review = mongoose.model('Review', ReviewSchema);
export default Review;
