const express = require('express');
const app = express();
const mysql = require('mysql');
const cors = require('cors');
const bodyParser = require('body-parser');

// Gunakan middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Buat koneksi ke database
const db = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'budgroow'
});

// Menangani kesalahan koneksi
db.connect(err => {
  if (err) {
    console.error('Database connection failed:', err.stack);
    process.exit(1); // Keluar dari aplikasi jika koneksi gagal
  }
  console.log('Connected to database.');
});

// Endpoint untuk mengambil data produk berdasarkan groceryID
app.get('/search', (req, res) => {
  const searchKey = req.query.q;
  const query = `
    SELECT groceryName, brand, weight, groceryPrice
    FROM GroceryItem
    WHERE groceryName LIKE ?`;

  db.query(query, [`%${searchKey}%`], (err, results) => {
    if (err) {
      console.error('Error fetching product:', err.stack);
      res.status(500).json({ error: 'Error fetching product' });
      return;
    }
    res.json(results);
  });
});

// Penanganan rute yang tidak ditemukan
app.use((req, res, next) => {
  res.status(404).json({ error: 'Route not found' });
});

// Penanganan kesalahan umum
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something broke!' });
});

const PORT = process.env.PORT || 3010;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
