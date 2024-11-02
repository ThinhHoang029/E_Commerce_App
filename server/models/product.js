import mongoose from 'mongoose';
import ratingSchema from './rating.js'; // Nhập ratingSchema từ tệp rating.js

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  quantity: {
    type: Number,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  ratings: [ratingSchema], // Sử dụng ratingSchema
});

// Xuất Product model và productSchema
const Product = mongoose.model("Product", productSchema);
export { Product, productSchema }; // Sử dụng cú pháp export
