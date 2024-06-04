const express = require('express');
const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'your_username',
    password: 'budgrow123',
    database: 'budgrow'
});

connection.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

const app = express();
const port = process.env.PORT || 3000;

app.get('/search/:query', (req, res) => {
    const query = req.params.query;
    const searchTerm = `%${query}%`;

    const sql = `SELECT * FROM your_table WHERE name LIKE ?`;

    connection.query(sql, [searchTerm], (err, results) => {
        if (err) {
            console.error('Error fetching search results:', err);
            res.status(500).send({ error: err });
            return;
        }

        res.json({ results });
    });
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});