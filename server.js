const express = require('express');
const { Sequelize } = require('sequelize');
const { initRouter } = require('./routes/books');

const app = express();
app.use(express.json());

// Database configuration
const sequelize = new Sequelize({
  dialect: 'postgres',
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  username: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
  database: process.env.DB_NAME || 'book_review_db',
  logging: false
});

// Initialize models
require('./models/book')(sequelize);

// Test database connection
const testConnection = async () => {
  try {
    await sequelize.authenticate();
    console.log('Database connection established successfully.');
    await sequelize.sync();
    console.log('Database models synchronized.');
  } catch (error) {
    console.error('Unable to connect to the database:', error);
    process.exit(1);
  }
};

// Add root endpoint
app.get('/', (req, res) => {
  res.json({ 
    message: 'Book Review API is running',
    endpoints: {
      books: '/api/books'
    }
  });
});

// Initialize and use routes
const bookRouter = initRouter(sequelize);
app.use('/api/books', bookRouter);

// Start server
const PORT = process.env.PORT || 8000;
const startServer = async () => {
  await testConnection();
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });
};

startServer();

module.exports = app;
