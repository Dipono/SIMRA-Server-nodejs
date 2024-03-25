const express =require('express');
const bodyparser=require('body-parser');
const cors = require('cors');
const router = express.Router();
const app=express();
const jwt = require('jsonwebtoken');
const jwtMiddleware=require('./jwtMiddleware')
app.use(cors());
app.use(bodyparser.json());

const connection = require("../config/config");



router.put('/updatePassword',jwtMiddleware,(req, res)=>{
    const user = req.decoded;

    const userPass = user.password;

    const id = user.userId
    if (userPass) {
        console.log(userPass);
        //instatiating user variables
        const password = req.session.Users.password;
        const entered_password =req.body.entered_password;
        const new_password =req.body.new_password;
        const re_password =req.body.re_enter_password;


        console.log(password)
        if(userPass === entered_password){
            //retrieve the student if the student exists
            let sql = "UPDATE user SET password = ? where userId = ?";
            console.log(id);
            let data = [new_password,id];


            
            connection.query(sql, data,(err, results)=>{
                if(err){
                    return res.status(200).send("Failed to load data!"+err);
                }
                else{
                        return res.status(200).send("Password updated");

                    }
            });

       
        }else{
            return res.status(401).send("You entered the wrong password"); 
        }
    } else {
        res.status(500)
    }
});

module.exports = router;