const express = require("express");
const connectDB = require("./config/database");
const authRoutes = require("./routes/auth");
const noteRoutes = require("./routes/notes");
const cors = require('cors');
const rateLimit = require('express-rate-limit');
const app = express();

// Connect to MongoDB
connectDB();

// Middleware
app.use(express.json());

// Routes
app.use("/api/auth", authRoutes);
app.use("/api/notes", noteRoutes);

// CORS Middleware Setup
const corsOptions = {
  origin: ['*'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  optionsSuccessStatus: 200
};

app.use(cors(corsOptions));

// Rate Limiting Setup
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // Limit each IP to 100 requests per windowMs
  message: "Too many requests from this IP, please try again after 15 minutes."
});

app.use(limiter);

// Routes
app.get('/', (req, res) => {
  res.send('Welcome to the API!');
});

app.post('/data', (req, res) => {
  res.json({ message: 'This is a POST request response' });
});

// Start the Server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

module.exports = app;
