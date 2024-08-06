import express from 'express'
import mysql2 from "mysql2"
import likeRoutes from './src/routes/likeRoutes.js';
import rateRoutes from './src/routes/rateRoutes.js';
import orderRoutes from './src/routes/orderRoutes.js';
const app = express();
app.listen(8080)

const connection  = mysql2.createConnection({
    host:"localhost",
    user:"root",
    password:"123456",
    port:"3307",
    database:"db_food"
})

import cors from 'cors'
app.use(cors())
app.use(express.json());


app.use('/api', likeRoutes);
app.use('/api/ratings', rateRoutes);
app.use('/api', orderRoutes);
export default connection;
