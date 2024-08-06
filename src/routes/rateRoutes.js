import express from 'express';
import connection from '../../server.js'; 

const router = express.Router();

// Thêm đánh giá
router.post('/rate', (req, res) => {
    const { user_id, res_id, amount, date_rate } = req.body;
    const query = 'INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES (?, ?, ?, ?)';
    
    connection.query(query, [user_id, res_id, amount, date_rate], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi thêm đánh giá', error: err });
        }
        res.status(201).json({ message: 'Đánh giá đã được thêm thành công' });
    });
});

// Lấy danh sách đánh giá theo nhà hàng
router.get('/rates/restaurant/:res_id', (req, res) => {
    const { res_id } = req.params;
    const query = 'SELECT * FROM rate_res WHERE res_id = ?';
    
    connection.query(query, [res_id], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi lấy danh sách đánh giá', error: err });
        }
        res.status(200).json(results);
    });
});

// Lấy danh sách đánh giá theo người dùng
router.get('/rates/user/:user_id', (req, res) => {
    const { user_id } = req.params;
    const query = 'SELECT * FROM rate_res WHERE user_id = ?';
    
    connection.query(query, [user_id], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'Lỗi khi lấy danh sách đánh giá', error: err });
        }
        res.status(200).json(results);
    });
});

export default router;