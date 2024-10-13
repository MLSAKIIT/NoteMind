const express = require("express");
const connectDB = require("./config/database");
const authRoutes = require("./routes/auth");
const noteRoutes = require("./routes/notes");

const app = express();

// Connect to MongoDB
connectDB();

// Middleware
app.use(express.json());

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/notes", noteRoutes);

module.exports = app;
