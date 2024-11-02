// IMPORTS FROM PACKAGES
import express from 'express';
import mongoose from 'mongoose';
import authRouter from './routes/auth.js';
import adminRouter from './routes/admin.js'; 
import productRouter from './routes/product.js'; 
import userRouter from './routes/user.js'; 

// INIT
const PORT = process.env.PORT || 3000;
const DB =
  "mongodb+srv://thinhghoang:thinh12345@cluster0.m5g8n.mongodb.net/";

// middleware
const app = express();
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter); 
app.use(userRouter); 

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
