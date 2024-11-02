import jwt from "jsonwebtoken"; // Sử dụng import cho jwt
import User from "../models/user.js"; // Đừng quên thêm .js vào đường dẫn

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) {
      return res.status(401).json({ msg: "No auth token, access denied" });
    }

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) {
      return res.status(401).json({ msg: "Token verification failed, authorization denied." });
    }
    
    const user = await User.findById(verified.id);
    if (user.type === "user" || user.type === "seller") {
      return res.status(401).json({ msg: "You are not an admin!" });
    }
    
    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export default admin; // Xuất mặc định hàm admin
