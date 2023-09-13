const express = require('express');
const connection = require("../config/config");
const router = express.Router();


router.post('/sampling_data', (req, res) => {
    var sql = `insert into samplingdata(userId,weatherCondition, sampling_date_created)
    values(?, ?,?)`
    var bodyParams = [req.body.userId, req.body.weatherCondition, new Date()]
    console.log(bodyParams);
    connection.query(sql, bodyParams, (err, result) => {
        if (err) throw err;

        if (result.affectedRows != 0) {
            console.log(result.insertId)
            var waterSourceSql = `insert into watersource(type, waterAccessability, samplingId)
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

            })
        }
    })
})

router.post("/watersource", (req, res) => {
    var coordinateSql = `insert into coordinate(longitude,latitude, samplingId)
    values(?,?,?)`
    var coordinateBody = [req.body.longitude, req.body.latitude, req.body.samplingId]
    connection.query(coordinateSql, coordinateBody, (error, rows) => {
        if (error) throw err
        console.log("coordinateBody", rows)
    })
})

router.post("/hydrogensulfide", (req, res) => {
    var h2sSql = `insert into hydrogensulfide(status,risk_type, samplingId)
            values(?,?,?);`
    var h2sBody = [req.body.status, req.body.risk_type, req.body.samplingId]
    connection.query(h2sSql, h2sBody, (error, rows) => {
        console.log("hydrogensulfide", rows)
    })
}) 

router.post('/sanitary_inspection_survey', (req, res) => {
    var sql = ``
    var sanitaryRequests = []
    connection.query();
})



module.exports = router