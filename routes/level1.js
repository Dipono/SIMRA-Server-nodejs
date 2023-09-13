const express = require('express');
const connection = require("../config/config");
const router = express.Router();


router.post('/sampling_data', (req, res)=>{
    var sql = ``
})

router.post('/sanitary_inspection_survey', (req,res)=>{
    var sql = ``
    var sanitaryRequests = []
    connection.query();
})

 

module.exports = router