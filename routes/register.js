const express =require('express');
const bodyparser=require('body-parser');
const cors = require('cors');
const router = express.Router();
const app=express();
const connection = require("../config/config");



router.post('/register',(req, res)=>{
    const params = req.body;
    let sql ="'INSERT INTO user SET ?', params";

    connection.query('INSERT INTO user SET ?', params,(err, results)=>{
        if(err){
            return res.status(200).send("Failed to load data!"+err);
        }
        else{
                return res.status(200).send("user registered");

            }
    });




})

module.exports = router;