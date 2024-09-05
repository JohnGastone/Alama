// Backend API (Node.js with Express and Mongoose)
const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const app = express();

app.use(express.json());

// MongoDB connection
mongoose.connect('mongodb://localhost/your_database', {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// User model
const UserSchema = new mongoose.Schema({
  email: { type: String, required: true, unique: true },
  phoneNumber: { type: String, required: true, unique: true },
  password: { type: String, required: true },
});

const User = mongoose.model('User', UserSchema);

// Sign-up route
app.post('/signup', async (req, res) => {
  try {
    const { email, phoneNumber, password } = req.body;

    // Check if user already exists
    const existingUser = await User.findOne({ $or: [{ email }, { phoneNumber }] });
    if (existingUser) {
      return res.status(400).json({ message: 'User already exists' });
    }

    // Hash password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    // Create new user
    const user = new User({
      email,
      phoneNumber,
      password: hashedPassword,
    });

    await user.save();

    res.status(201).json({ message: 'User created successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error creating user', error: error.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));