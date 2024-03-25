const express = require('express');
const bodyparser = require('body-parser');
const cors = require('cors');
const router = express.Router();
const app = express();
const connection = require("../config/config");
const multer = require('multer');
const path = require('path');
const moment = require('moment-timezone'); // Import moment-timezone
require('dotenv').config();

// Set up Multer to handle file uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/'); // Specify the upload directory
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Use unique filenames
  },
});

const upload = multer({ storage: storage });

// Serve static files from the 'uploads' directory
router.use('/uploads', express.static('uploads'));

router.post('/addEvents', upload.single('image'), (req, res) => {
  const title = req.body.title;
  const description = req.body.description;
  // Parse the date string into a JavaScript Date object
  const clientDate = new Date(req.body.date);

  // Convert the client date to the server's time zone (e.g., 'Africa/Johannesburg')
  const serverDate = moment(clientDate).tz('Africa/Johannesburg').toDate();

  const venue = req.body.venue;
  let image = "";
  if (req.file) {
    image = `http://localhost:${process.env.PORT}/api/uploads/${req.file.filename}`;
  }

  let sql = `INSERT INTO EVENTS(title,description,date,venue,image)
    VALUES('${title}','${description}','${serverDate.toISOString()}','${venue}','${image}')`;

  connection.query(sql, (err, results) => {
    if (err) {
      return res.status(400).send("Failed to add events!" + err);
    } else {
      return res.status(200).send("Events added successfully");
    }
  });
});

//get all events
router.get('/getEvents', (req, res) => {
  let sql = `SELECT * FROM EVENTS`;
  connection.query(sql, (err, results) => {
    if (err) {
      return res.status(400).send("Failed to retrieve events!" + err);
    } else {
      return res.status(200).send(results);
    }
  });
});
// Update event details
router.put('/updateEventMun/:eventId', upload.single('image'), (req, res) => {
  const eventId = req.params.eventId;
  const title = req.body.title;
  const description = req.body.description;
  const clientDate = new Date(req.body.date);
  const serverDate = moment(clientDate).tz('Africa/Johannesburg').toDate();
  const venue = req.body.venue;
  let image = "";

  if (req.file) {
    image = `http://localhost:${process.env.PORT}/api/uploads/${req.file.filename}`;
  }

  let sql = `UPDATE EVENTS
             SET title='${title}', description='${description}', date='${serverDate.toISOString()}', venue='${venue}', image='${image}'
             WHERE id=${eventId}`;

  connection.query(sql, (err, results) => {
    if (err) {
      return res.status(400).send(`Failed to update event with ID ${eventId}! ${err}`);
    } else {
      return res.status(200).send(`Event with ID ${eventId} updated successfully`);
    }
  });
});

// DELETE user's event by ID
router.delete('/deleteEventMun/:id', async (req, res) => {
  const eventId = req.params.id;
  try {
    await connection.query('DELETE FROM events WHERE id = ?', eventId, (err, results)=>{
      if(err) console.log(err)
      if(results.affectedRows != 0){
        res.json({ message: 'Event deleted successfully' });
      }
      else{
        res.json({ message: 'Could not delete the event' });
      }
      
    });
    
  } catch (error) {
    console.error('Error deleting event:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Handle GET request to retrieve an image only by filename
router.get('/uploads/:filename', (req, res) => {
  const { filename } = req.params;
  res.sendFile(path.join(__dirname, 'uploads', filename));
});

module.exports = router;
