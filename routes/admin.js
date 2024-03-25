const express = require('express');
const router = express.Router();
const mysql = require('mysql2/promise');

// Create a connection pool
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'simra_db'
  });

// GET all events
router.get('/getEvents', async (req, res) => {
    try {
      const [rows] = await pool.query('SELECT * FROM events');
      res.status(200).json(rows);
    } catch (error) {
      console.error('Failed to retrieve events:', error.message);
      res.status(400).json({ error: 'Failed to retrieve events!' });
    }
  });
  
  // DELETE event by ID for admin
  router.delete('/deleteEvent', async (req, res) => {
    const { eventId } = req.params;
    try {
      await pool.query('DELETE FROM events WHERE id = ?', [eventId]);
      res.json({ message: 'Event deleted successfully' });
    } catch (error) {
      console.error('Error deleting event:', error.message);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  // DELETE user's event by ID
  router.delete('/deleteEventMun', async (req, res) => {
    const { eventId } = req.params;
    const { userId } = req.body;
    try {
      await pool.query('DELETE FROM events WHERE id = ? AND userId = ?', [eventId, userId]);
      res.json({ message: 'Event deleted successfully' });
    } catch (error) {
      console.error('Error deleting event:', error.message);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  // PUT update event by ID for admin
  router.put('/updateEvent', async (req, res) => {
    const { eventId } = req.params;
    const { title, description, date, venue, image, muni_name, muni_id, userId } = req.body;
    try {
      await pool.query(
        'UPDATE events SET title=?, description=?, date=?, venue=?, image=?, muni_name=?, muni_id=?, userId=? WHERE id = ?',
        [title, description, date, venue, image, muni_name, muni_id, userId, eventId]
      );
      res.json({ message: 'Event updated successfully' });
    } catch (error) {
      console.error('Error updating event:', error.message);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  // PUT update user's event by ID
  router.put('/updateEventMun', async (req, res) => {
    const { eventId } = req.params;
    const { title, description, date, venue, image, muni_name, muni_id, userId } = req.body;
    try {
      await pool.query(
        'UPDATE events SET title=?, description=?, date=?, venue=?, image=?, muni_name=?, muni_id=? WHERE id = ? AND userId = ?',
        [title, description, date, venue, image, muni_name, muni_id, eventId, userId]
      );
      res.json({ message: 'Event updated successfully' });
    } catch (error) {
      console.error('Error updating event:', error.message);
      res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  module.exports = router;
