const express = require('express');
const { Sequelize, DataTypes } = require('sequelize');
const app = express();

// Database setup
const sequelize = new Sequelize({
  dialect: 'sqlite',
  storage: './data/books.db',
  logging: false
});

// Define Book model
const Book = sequelize.define('Book', {
  title: {
    type: DataTypes.STRING,
    allowNull: false
  },
  author: {
    type: DataTypes.STRING,
    allowNull: false
  }
});

// Sync database
sequelize.sync();

app.use(express.json());

// Routes
app.get('/', (req, res) => {
  res.json({ message: "Book Review API is running!" });
});

app.post('/books', async (req, res) => {
  try {
    const book = await Book.create(req.body);
    res.status(201).json(book);
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
});

app.get('/books', async (req, res) => {
  const books = await Book.findAll();
  res.json(books);
});

app.get('/books/:id', async (req, res) => {
  const book = await Book.findByPk(req.params.id);
  if (book) {
    res.json(book);
  } else {
    res.status(404).json({ error: "Book not found" });
  }
});

const port = process.env.PORT || 8000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
