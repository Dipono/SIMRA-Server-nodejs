const express = require('express');
const connection = require("../config/config");
const router = express.Router();

router.get('/coordinates', (req, res)=>{
    var sql = 'select longitude as "long", latitude as lat from coordinate';

    connection.query(sql, (err,results)=>{
        if(err) console.log(err)
        if(results.length > 0){
            res.send({success:true, results})
        }
        else{
            res.send({success:false, message:'Could not found coordinates'})
        }
    })
})

module.exports = router