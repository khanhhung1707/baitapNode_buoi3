import express from 'express';
import connection from '../../server.js'; // Điều chỉnh đường dẫn nếu cần

const router = express.Router();

router.post('/order', (req, res) => {
    const { user_id, restaurant_id, food_id, quantity } = req.body;

    if (!user_id || !restaurant_id || !food_id || !quantity) {
        return res.status(400).json({ message: 'Thiếu thông tin đơn hàng' });
    }

    const query = 'INSERT INTO orders (user_id, restaurant_id, food_id, quantity, order_date) VALUES (?, ?, ?, ?, NOW())';
    connection.query(query, [user_id, restaurant_id, food_id, quantity], (error, results) => {
        if (error) {
            return res.status(500).json({ message: 'Lỗi khi thêm đơn hàng' });
        }
        res.status(201).json({ message: 'Đơn hàng đã được tạo thành công', orderId: results.insertId });
    });
});

export default router;