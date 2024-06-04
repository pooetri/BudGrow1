const express = require('express');
const fs = require('fs');
const path = require('path');
const csv = require('csv-parser');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware untuk mengizinkan CORS
app.use(cors());

// Baca data dari file CSV
let foods = [];
fs.createReadStream(path.join(__dirname, 'data.csv'))
  .pipe(csv())
  .on('data', (row) => {
    foods.push(row);
  })
  .on('end', () => {
    console.log('CSV file successfully processed');
  });

// Endpoint untuk pencarian data
app.get('/search', (req, res) => {
  const query = req.query.q.toLowerCase();
  const results = foods.filter(food => 
    food['Nama Makanan'].toLowerCase().includes(query) || 
    food['Merek'].toLowerCase().includes(query)
  );
  res.json(results);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
