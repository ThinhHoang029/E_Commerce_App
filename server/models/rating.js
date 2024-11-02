import mongoose from 'mongoose';

const ratingSchema = mongoose.Schema({
  userId: {
    type: String,
    required: true,
  },
  rating: {
    type: Number,
    required: true,
  },
});

// Xuất ratingSchema bằng cú pháp ES module
export default ratingSchema; 
