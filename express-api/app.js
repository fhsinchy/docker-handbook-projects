const express = require('express');

const app = express();

app.use((req, res) => {
    res.status(200).json({
        error: false,
        message: 'Bonjour, mon ami',
    });
});

app.listen(3000, () => {
    console.log('app running -> http://127.0.0.1:3000');
});