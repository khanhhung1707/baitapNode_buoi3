import express from 'express';
import connection from '../../server.js'; 

const router = express.Router();

// Thêm Like
router.post('/like', (req, res) => {
    const { user_id, res_id } = req.body;

    if (!user_id || !res_id) {
        return res.status(400).json({ error: 'Cần cung cấp user_id và res_id' });
    }

    const query = 'INSERT INTO like_res (user_id, res_id, date_like) VALUES (?, ?, CURDATE()) ON DUPLICATE KEY UPDATE date_like = VALUES(date_like)';
    connection.query(query, [user_id, res_id], (err) => {
        if (err) {
            return res.status(500).json({ error: 'Lỗi khi thêm like' });
        }
        res.status(200).json({ message: 'Like đã được thêm thành công' });
    });
});

// Xóa Like
router.delete('/unlike', (req, res) => {
    const { user_id, res_id } = req.body;

    if (!user_id || !res_id) {
        return res.status(400).json({ error: 'Cần cung cấp user_id và res_id' });
    }

    const query = 'DELETE FROM like_res WHERE user_id = ? AND res_id = ?';
    connection.query(query, [user_id, res_id], (err) => {
        if (err) {
            return res.status(500).json({ error: 'Lỗi khi xóa like' });
        }
        res.status(200).json({ message: 'Like đã được xóa thành công' });
    });
});

// Lấy danh sách Like theo nhà hàng
router.get('/likes/:res_id', (req, res) => {
    const { res_id } = req.params;

    const query = 'SELECT * FROM like_res WHERE res_id = ?';
    connection.query(query, [res_id], (err, results) => {
        if (err) {
            return res.status(500).json({ error: 'Lỗi khi lấy danh sách like' });
        }
        res.json(results);
    });
});

// Lấy danh sách Like theo người dùng
router.get('/user-likes/:user_id', (req, res) => {
    const { user_id } = req.params;

    const query = 'SELECT * FROM like_res WHERE user_id = ?';
    connection.query(query, [user_id], (err, results) => {
        if (err) {
            return res.status(500).json({ error: 'Lỗi khi lấy danh sách like' });
        }
        res.json(results);
    });
});

export default router;