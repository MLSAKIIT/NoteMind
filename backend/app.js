const express = require("express");
const connectDB = require("./config/database");
const authRoutes = require("./routes/auth");
const noteRoutes = require("./routes/notes");
const mindMapRoutes = require("./routes/mindMaps");
const cookieParser = require('cookie-parser');
const morgan = require('morgan');
const limiter = require('./middleware/rate-limit')

const app = express();

// Connect to MongoDB
connectDB();

// Middleware
app.use(express.json());
app.use(cookieParser());
app.use(morgan('dev'));
app.use(limiter);

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/notes", noteRoutes);
app.use("/api/mindMaps", mindMapRoutes);

module.exports = app;
