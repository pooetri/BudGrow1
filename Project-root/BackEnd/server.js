const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

// Middleware
app.use(bodyParser.json());
app.use(cors());

// Routes
app.get('/', (req, res) => {
    res.send('Welcome to the Simple Search API');
});

// Search Route
app.get('/search', (req, res) => {
    const query = req.query.q;
    // Since there's no database, always return "Not Found"
    res.status(404).send('Product not found');
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
