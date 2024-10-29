const User = require("../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const dotenv = require('dotenv');
dotenv.config();
const JWT_SECRET = process.env.JWT_SECRET; 

exports.register = async (req, res) => {
  try {
    const { username, name, email, password, rollNo } = req.body;

    if (!username || !email || !password || !rollNo || !name) {
      return res.status(400).json({
        message: "Bad request",
        status: 400,
      });
    }

    const existingUser = await User.findOne({
      email,
    });
    const salt = 10;
    const hashedPassword = await bcrypt.hash(password, salt);

    if (existingUser) {
      return res.status(409).json({
        message: "User with email already exists",
        status: 409,
      });
    }

    const createUser = await User.create({
      username,
      email,
      password: hashedPassword,
      name,
      rollNo
    });

    return res.status(200).json({
      message: "User created successfully",
      createUser,
      status: 200,
    });
  } catch (error) {
    return res.status(500).json({
      message: "Internal Server Error",
      status: 500,
    });
  }
};



exports.login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check for email and password in request
    if (!email || !password) {
      return res.status(400).json({
        message: "Bad request: missing email or password",
        status: 400,
      });
    }

    // Find user by email
    const findUser = await User.findOne({ email });
    if (!findUser) {
      return res.status(404).json({
        message: "User not found",
        status: 404,
      });
    }

    // Check if the password is correct
    const isPasswordCorrect = await bcrypt.compare(password, findUser.password);
    if (!isPasswordCorrect) {
      return res.status(401).json({
        message: "Incorrect password",
        status: 401,
      });
    }

    // Create a JWT token
    const token = jwt.sign(
      {
        id: findUser._id,
        email: findUser.email,
      },
      JWT_SECRET,
      { expiresIn: "1h" } 
    );

    return res.status(200).json({
      message: "User logged in successfully",
      token,
      user: {
        username: findUser.username,
        email: findUser.email,
      },
      status: 200,
    });
  } catch (error) {
    console.error(error); 
    return res.status(500).json({
      message: "Internal Server Error",
      status: 500,
    });
  }
};

exports.getUser = async (req, res) => {
  try {
    const { username } = req.body;
    const findUser = await User.findOne({ username });

    if (!findUser) {
      return res.status(404).json({
        message: "User not found",
        status: 404,
      });
    }

    return res.status(200).json({
      message: "User found",
      findUser,
      status: 200
    });
  } catch (error) {
    console.error("Error finding user:", error);
    return res.status(500).json({
      message: "Internal Server Error",
      status: 500
    });
  }
};


exports.update = async (req, res) => {
  try {
    const { _id } = req.params; 
    const trimmedId = _id.trim(); 
    const { username, name, rollNo } = req.body;

    console.log('Fetching user with ID:', trimmedId);

    if (!username || !name || !rollNo || !trimmedId) {
      return res.status(400).json({
        message: "Bad request. Missing required fields.",
        status: 400
      });
    }

    const findUser = await User.findById(trimmedId);
    if (!findUser) {
      return res.status(404).json({
        message: "User not found",
        status: 404
      });
    }

    const updatedUser = await User.findByIdAndUpdate(
      trimmedId,
      { username, rollNo, name },
      { new: true } // Return the updated user
    );

    return res.status(200).json({
      message: "User updated successfully",
      updatedUser,
      status: 200
    });
  } catch(error){
    return res.status(500).json({
      error: "Internal Server Error",
      status: 500
    })
  }
};
