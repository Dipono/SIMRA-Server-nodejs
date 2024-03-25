const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');
const router = express.Router();
const app = express();
const jwt = require('jsonwebtoken');
const jwtMiddleware = require('./jwtMiddleware');
app.use(cors());
app.use(bodyparser.json());

const connection = require("../config/config");

// Create a route to fetch coordinates
router.get('/coordinates', (req, res) => {
  const query = 'SELECT latitude, longitude, samplingId FROM coordinate';

  console.log(query);

  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json(results);
    }
  });
});

// app.listen(PORT, () => {
//   console.log(`Server is running on port 3001`);
// });

module.exports = router;
// Start the server
