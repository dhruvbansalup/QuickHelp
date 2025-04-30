require('dotenv').config(); // Load .env File
const app = require('./src/app'); // Express App

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
