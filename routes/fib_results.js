const express = require('express');
const connection = require("../config/config");
const router = express.Router();

router.get('/h2s_province', (req, res) => {
    var sql = `SELECT prov.province_id, COUNT(mun.province_id) as muni_count, province_name
                FROM hydrogensulfide hyd, samplingdata sam, municipality mun, province prov
                where hyd.samplingId = sam.samplingId
                and mun.muni_id = sam.muni_id
                and prov.province_id = mun.province_id
                group by  mun.province_id;`

    connection.query(sql, (err, results) => {
        if (err) console.log(err)
        if (results.length > 0) {
            res.send({ success: true, results })
        } else {
            res.send({ success: false, message: "could not found the results" })
        }
    })
});

router.get('/fib_province', (req, res) => {
    var sql = `SELECT prov.province_id, COUNT(mun.province_id) as muni_count,indicator_id,province_name
                FROM fib_indicator fib, qmra qm, samplingdata sam, municipality mun, province prov
                where fib.qmra_id = qm.qmra_id 
                and qm.samplingId = sam.samplingId
                and mun.muni_id = sam.muni_id
                and prov.province_id = mun.province_id
                group by  mun.province_id;`

    connection.query(sql, (err, results) => {
        if (err) console.log(err)
        if (results.length > 0) {
            res.send({ success: true, results })
           
        } else {
            res.send({ success: false, message: "could not found the results" })
           
        }
    })
});

router.get('/fib_municipality/:province_id', (req, res) => {
    var sql = `SELECT COUNT(fib.indicator_id) as count_risk, mun.muni_id, muni_name
                FROM fib_indicator fib,qmra qm, samplingdata sam, municipality mun
                where fib.qmra_id=qm.qmra_id
                and qm.samplingId = sam.samplingId
                and mun.muni_id = sam.muni_id
                and mun.province_id = ?
                group by mun.muni_id;`

    connection.query(sql, req.params.province_id, (err, results) => {
        if (err) console.log(err)
        if (results.length > 0) {
            res.send({ success: true, results })
        } else {
            res.send({ success: false, message: "could not found the results" })
        }
    })
});

router.get('/h2s_municipality/:province_id', (req, res) => {
    var sql = `SELECT COUNT(status) as count_risk, mun.muni_id, muni_name
                FROM hydrogensulfide hyd, samplingdata sam, municipality mun
                where hyd.samplingId = sam.samplingId
                and mun.muni_id = sam.muni_id
                and mun.province_id = ?
                group by mun.muni_id;`

    connection.query(sql, req.params.province_id, (err, results) => {
        if (err) console.log(err)
        if (results.length > 0) {
            res.send({ success: true, results })
        } else {
            res.send({ success: false, message: "could not found the results" })
        }
    })
});
router.get('/fib_risk_results/:muni_id', (req, res) => {

    var sql = `SELECT COUNT(estimated_count) as count_risk, estimated_count, indicator, muni_id
                FROM fib_indicator fib,qmra qm, samplingdata sam
                where fib.qmra_id=qm.qmra_id
                and qm.samplingId = sam.samplingId
                and muni_id = ?
                group by estimated_count, muni_id;`

    connection.query(sql, req.params.muni_id, (err, results) => {
        if (err) console.log(err)
        if (results.length > 0) {
            res.send({ success: true, results })
        } else {
            res.send({ success: false, message: "could not found the results" })
        }
    })
})

router.get('/h2s_risk_results/:muni_id', (req, res) => {

    var sql = `SELECT COUNT(status) as count_risk, status, risk_type, muni_id
                FROM hydrogensulfide hyd, samplingdata sam
                where hyd.samplingId = sam.samplingId
                and muni_id = ?
                group by status, muni_id;`

    connection.query(sql, req.params.muni_id, (err, results) => {
        if (err) console.log(err)
        if (results.length > 0) {
            res.send({ success: true, results })
        } else {
            res.send({ success: false, message: "could not found the results" })
        }
    })
})
///get all indicators
router.get('/get_fib_indicator', (req, res) => {
    var sql = "select DISTINCT indicator from fib_indicator ";
    connection.query(sql, req.params.id, (err, results) => {
        if (err) throw err

        res.send({ success: true, results })
    })
})



module.exports = router