
const express = require('express');
const { sequelize } = require('./models');
const likesRoutes = require('./routes/likes');

const app = express();
app.use(express.json());

// Sử dụng các route
app.use('/api', likesRoutes);

sequelize.authenticate()
  .then(() => {
    console.log('Database connected...');
    app.listen(3000, () => {
    //   console.log('Server is running on port 3000');
    });
  })
  .catch(err => {
    // console.error('Unable to connect to the database:', err);
  });
