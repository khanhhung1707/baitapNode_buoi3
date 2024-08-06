const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); // Import kết nối database

const RateRes = sequelize.define('RateRes', {
  rate_res_id: {
    type: DataTypes.INTEGER,
    autoIncrement: true,
    primaryKey: true,
  },
  user_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'users',
      key: 'user_id',
    },
  },
  res_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'restaurants',
      key: 'res_id',
    },
  },
  amount: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
  date_rate: {
    type: DataTypes.DATE,
    allowNull: false,
  },
}, {
  tableName: 'rate_res',
  timestamps: false,
});

module.exports = RateRes;
