const express = require('express');
const connection = require("../config/config");
const router = express.Router();


router.post('/sampling_data', (req, res) => {
    var sql = `insert into samplingdata(userId,weatherCondition, sampling_date_created)
    values(?, ?,?)`
    var bodyParams = [req.body.userId, req.body.weatherCondition, new Date()]
   
    connection.query(sql, bodyParams, (err, result) => {
        if (err) throw err;

        if (result.affectedRows != 0) {
            console.log(result.insertId)
            var insertedId = result.insertId
            res.send({ success: true, message: "sampling data recoded...", insertedId })
            console.log({ success: true, message: "sampling data recoded...", insertedId })
            /*var waterSourceSql = `insert into watersource(type, waterAccessability, samplingId)
            values(?,?,?)`
            var waterSourceBody = [req.body.type, req.body.waterAccessability, result.insertId]
            connection.query(waterSourceSql, waterSourceBody, (error, rows) => {
                if (error) throw err
                console.log("waterSourceBody", rows)
            })

            var h2sSql = `insert into hydrogensulfide(status,risk_type, samplingId)
            values(?,?,?);`
            var h2sBody = [req.body.status, req.body.risk_type, result.insertId]
            connection.query(h2sSql, h2sBody, (error, rows) => {

            })*/
        }
        else {
            res.send({ success: false, message: "unable to record sampling data..." })
        }
    })
})

router.post("/watersource", (req, res) => {
    var watersourceSql = `insert into watersource(type,waterAccessability, samplingId)
    values(?,?,?)`
    var watersourceBody = [req.body.type, req.body.waterAccessability, req.body.samplingId]
    connection.query(watersourceSql, watersourceBody, (err, rows) => {
        if (err) throw err
        console.log("watersource", rows)
        res.send({message:"adedd watersource", rows})
    })
})

router.post("/coordinates", (req, res) => {
    var coordinateSql = `insert into coordinate(longitude,latitude, samplingId)
    values(?,?,?)`
    var coordinateBody = [req.body.longitude, req.body.latitude, req.body.samplingId]
    connection.query(coordinateSql, coordinateBody, (err, rows) => {
        if (err) throw err
        console.log("coordinateBody", rows)
        res.send({message:"adedd coordinates", rows})
    })
})

router.post("/hydrogensulfide", (req, res) => {
    var h2sSql = `insert into hydrogensulfide(status,risk_type, samplingId)
            values(?,?,?);`
    var h2sBody = [req.body.status, req.body.risk_type, req.body.samplingId]
    connection.query(h2sSql, h2sBody, (err, rows) => {
        if(err) throw err
        console.log("hydrogensulfide", rows)
        res.send({message:"adedd hydrogensulfide", rows})
    })
})

router.post('/sanitary_inspection_survey', (req, res) => {
    var total_avarage = 0
    var risk_type = ""
    if(req.body.pitLatrine == true){total_avarage = total_avarage+1}
    if(req.body.domesticAnimal == true){total_avarage = total_avarage+1}
    if(req.body.diaperDisposal == true){total_avarage = total_avarage+1}
    if(req.body.wasteWaterRelease == true){total_avarage = total_avarage+1}
    if(req.body.openDefaction == true){total_avarage = total_avarage+1}
    if(req.body.unprotectedWaterSource == true){total_avarage = total_avarage+1}
    if(req.body.agriculturalActivity == true){total_avarage = total_avarage+1}
    if(req.body.observerLaundryActivity == true){total_avarage = total_avarage+1}
    
    total_avarage = (total_avarage/8)*100
    
    if(total_avarage <26){risk_type ="low risk"}
    else if(total_avarage > 25 && total_avarage < 51){risk_type ="medium risk"}
    else if(total_avarage > 50 && total_avarage < 76){risk_type ="high risk"}
    else{risk_type ="very high risk"}
   
    var sql = `insert into sanitaryinpectionquestion(pitLatrine,domesticAnimal,diaperDisposal,wasteWaterRelease,openDefaction,
        unprotectedWaterSource,agriculturalActivity,observerLaundryActivity,samplingId,risk_type,total_avarage)
        VALUES(?,?,?,?,?,?,?,?,?,?,?)`
    var sanitaryRequests = [req.body.pitLatrine, req.body.domesticAnimal, req.body.diaperDisposal, req.body.wasteWaterRelease,
        req.body.openDefaction, req.body.unprotectedWaterSource, req.body.agriculturalActivity ,req.body.observerLaundryActivity, 
        req.body.samplingId, risk_type, total_avarage]
    connection.query(sql,sanitaryRequests,(err,results)=>{
        if(err) throw err
        if (results.affectedRows != 0) {
        console.log("sanitary survey", results)
        res.send({message:"adedd sanitary survey", total_avarage,risk_type, success:true})
        }
        else{
        res.send({message:"unable to add sanitary to database", success:false})

        }
    });
})



module.exports = router