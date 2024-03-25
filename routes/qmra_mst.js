
const express = require('express');
const connection = require("../config/config");
const router = express.Router();

const calculateExponentialForCryptosporidium = (r, count) => {
    // Implement the exponential calculation for Cryptosporidium parvum

    const calculatedResult = 1 - Math.pow(2.71828, -r * count);
    return calculatedResult;
};

const calculateExponentialForGiardia = (k, count) => {
    // Implement the exponential calculation for Giardia lambia 
    const calculatedResult = 1 - Math.pow(2.71828, -k * count);
    return calculatedResult;
};

function calculateBetaPoisson(alpha, beta, count) {
    // Perform the Beta-Poisson calculation here
    const calculatedResult = (1 - (1 + (count / beta)) ** - alpha);
    // console.log(calculatedResult)
    return calculatedResult;
};

const calculateEntamoebaColi = (alpha, nFifty, count) => {
    // Perform the Entamoeba Coli calculation here
    const calculatedResult = 1 - (1 + (count / nFifty) * (Math.pow(2, (1 / alpha)) - 1));
    return calculatedResult;
};

const calculateProbabiltyInfection = (probInfect, numofExposure) => {
    // Perform the calculation for Pi here
    const calculatedResult = 1 - Math.pow((1 - probInfect), -numofExposure);
    if (calculatedResult <= 0) {
        //No feacal contamination
    } else if (calculatedResult >= 1) {
        //action plan 
    }
    return calculatedResult;
};

router.post('/add_indicator_qmra', (req, res) => {
    let is_customize_Pathogen = req.body.is_customize_Pathogen;
    let pathogen = req.body.pathogen;
    let n50 = req.body.n50;
    let constant = req.body.constant;
    let alpha = req.body.alpha;
    let beta = req.body.beta;
    let totalQmra = 0;
    var samplingId = req.body.samplingId;
    let best_fit_model = req.body.best_fit_model

    let indicator = req.body.indicator;
    let ratio = req.body.ratio;
    let count_indicator = req.body.count_indicator;
    let estimated_count = req.body.estimated_count;
    let is_customized_indicator = req.body.is_customized_indicator;

    if (best_fit_model.toLocaleLowerCase() == 'exponential'.toLocaleLowerCase()) {
        totalQmra = calculateExponentialForGiardia(constant, estimated_count);
    }
    else {
        if (beta != null || beta != undefined) {
            // add_indicator_qmra
            totalQmra = calculateBetaPoisson(alpha, beta, estimated_count)
        }
        else {
            totalQmra = calculateEntamoebaColi(alpha, n50, estimated_count)
        }
    }

    var duration_type = req.body.duration_type;
    var likeliOfInfection = null
    var qmra_body = [pathogen, best_fit_model, alpha, beta, constant, n50, totalQmra, likeliOfInfection, duration_type, is_customize_Pathogen, samplingId]
    var qmra_sql = `INSERT INTO qmra(pathogen,best_fit_model,alpha,beta,constant,n50,probability_of_infection,likelihood_of_infection,duration_type,is_customize_Pathogen,samplingId)
                                VALUES(?,?,?,?,?,?,?,?,?,?,?)`

    connection.query(qmra_sql, qmra_body, (err, results) => {
        if (err) {
            return res.status(200).send("Failed to load data!" + err);
        }
        else {
            if (results.affectedRows > 0) {
                var qmra_id = results.insertId
                console.log(results)
                console.log(qmra_id)
                // Prepare insertion of QMRA
                var fibIndicatorBody = [indicator, ratio, count_indicator, estimated_count, is_customized_indicator, qmra_id]
                var fib_sql = `INSERT INTO fib_indicator(indicator,ratio,count_indicator,estimated_count,is_customized_indicator,qmra_id)
                VALUES(?,?,?,?,?,?)`;
                connection.query(fib_sql, fibIndicatorBody, (error, row) => {
                    if (error) {
                        console.log(error)
                        throw err
                    };

                    if (row.affectedRows > 0) {
                        console.log(qmra_id)
                        res.send({ success: true, totalQmra, qmra_id })
                    }
                })

            }
            else {
                res.status(200).json({ success: false, message: "Something went wrong try again later" });
            }

        }
    });

})

router.put('/likelihood_test/:qmra_id', (req, res) => {
    var duration_type = req.body.duration_type;
    var probability_of_infection = req.body.probability_of_infection
    var duration_number = 0;
    if (duration_type.toLocaleLowerCase() === 'daily') {
        duration_number = 1
    }
    else if (duration_type.toLocaleLowerCase() === 'wekkly') {
        duration_number = 7
    }
    else if (duration_type.toLocaleLowerCase() === 'monthly') {
        duration_number = 31
    }
    else if (duration_type.toLocaleLowerCase() === 'quartely') {
        duration_number = 90
    }
    else {
        duration_number = 365
    }
    var likelihood_of_infection = Math.round(1 - Math.pow((1 - probability_of_infection), -duration_number))
    //var likelihood_of_infection = ((1 - (1 - probability_of_infection)) ** (-duration_number)).toFixed(2)

    if (likelihood_of_infection === Infinity || likelihood_of_infection === Number.NEGATIVE_INFINITY) {
        likelihood_of_infection = 0
    }
    var likelihood_body = [likelihood_of_infection, duration_type, req.params.qmra_id]
    var sql = `UPDATE qmra
                SET likelihood_of_infection = ?, duration_type =?
                WHERE qmra_id = ?;`
    connection.query(sql, likelihood_body, (err, results) => {
        if (err) throw err;
        if (results.affectedRows > 0) {
            res.send({ success: true, likelihood_of_infection })
        }
        else {
            res.send({ success: false, message: "could not perform likelihood of infection" })
        }
    })
})

router.post('/reference_pathogens_test', (req, res) => {
    let is_customize_Pathogen = req.body.is_customize_Pathogen;
    let pathogen = req.body.pathogen;
    let n50 = req.body.n50;
    let constant = req.body.constant;
    let alpha = req.body.alpha;
    let beta = req.body.beta;
    let totalQmra = 0;
    var samplingId = req.body.samplingId;
    let best_fit_model = req.body.best_fit_model
    let count = req.body.count

    if (best_fit_model.toLocaleLowerCase() == 'exponential'.toLocaleLowerCase()) {
        totalQmra = calculateExponentialForGiardia(constant, count);
    }
    else {
        if (beta != null || beta != undefined) {
            totalQmra = calculateBetaPoisson(alpha, beta, count)
        }
        else {
            totalQmra = calculateEntamoebaColi(alpha, n50, count)
        }
    }

    var duration_type = req.body.duration_type;
    var likeliOfInfection = null
    var qmra_body = [pathogen, best_fit_model, alpha, beta, constant, n50, totalQmra, likeliOfInfection, duration_type, is_customize_Pathogen, samplingId]
    var qmra_sql = `INSERT INTO qmra(pathogen,best_fit_model,alpha,beta,constant,n50,probability_of_infection,likelihood_of_infection,duration_type,is_customize_Pathogen,samplingId)
                                    VALUES(?,?,?,?,?,?,?,?,?,?,?)`

    connection.query(qmra_sql, qmra_body, (err, results) => {
        if (err) {
            return res.status(200).send("Failed to load data!" + err);
        }
        else {
            if (results.affectedRows > 0) {
                var qmra_id = results.insertId
                var fibIndicatorBody = [count, is_customize_Pathogen, qmra_id]
                var fib_sql = `INSERT INTO reference_path(count,is_customize_Pathogen,qmra_id)
VALUES(?,?,?)`;
                connection.query(fib_sql, fibIndicatorBody, (error, row) => {
                    if (error) {
                        console.log(error)
                        throw err
                    };
                    if (row.affectedRows > 0) {
                        res.send({ success: true, totalQmra, qmra_id })
                    }
                })
            }
            else {
                res.status(200).json({ success: false, message: "Something went wrong try again later" });
            }

        }
    });

})

router.post('/mst', (req, res) => {
    let is_customize_Pathogen = req.body.is_customize_Pathogen;
    let pathogen = req.body.pathogen;
    let n50 = req.body.n50;
    let constant = req.body.constant;
    let alpha = req.body.alpha;
    let beta = req.body.beta;
    let totalQmra = 0;
    var samplingId = req.body.samplingId;
    let best_fit_model = req.body.best_fit_model

    let estimated_count = req.body.estimated_count
    let count = req.body.count
    let is_customized_mst = req.body.is_customized_mst
    let ratio = req.body.ratio
    let maker = req.body.maker

    if (best_fit_model.toLocaleLowerCase() == 'exponential'.toLocaleLowerCase()) {
        totalQmra = calculateExponentialForGiardia(constant, estimated_count);
    }
    else {
        if (beta != null || beta != undefined) {
            totalQmra = calculateBetaPoisson(alpha, beta, estimated_count)
        }
        else {
            totalQmra = calculateEntamoebaColi(alpha, n50, estimated_count)
        }
    }


    var duration_type = req.body.duration_type;
    var likeliOfInfection = null
    var qmra_body = [pathogen, best_fit_model, alpha, beta, constant, n50, totalQmra, likeliOfInfection, duration_type, is_customize_Pathogen, samplingId]
    var qmra_sql = `INSERT INTO qmra(pathogen,best_fit_model,alpha,beta,constant,n50,probability_of_infection,likelihood_of_infection,duration_type,is_customize_Pathogen,samplingId)
                                VALUES(?,?,?,?,?,?,?,?,?,?,?)`
    connection.query(qmra_sql, qmra_body, (err, results) => {
        if (err) {
            return res.status(200).send("Failed to load data!" + err);
        }
        else {
            if (results.affectedRows > 0) {
                var qmra_id = results.insertId
                var fibIndicatorBody = [count, ratio, estimated_count, maker, is_customized_mst, qmra_id]
                var fib_sql = `INSERT INTO mst(count,ratio,estimated_count,maker,is_customized_mst,qmra_id)
                VALUES(?,?,?,?,?,?)`;
                connection.query(fib_sql, fibIndicatorBody, (error, row) => {
                    if (error) {
                        console.log(error)
                        throw err
                    };
                    if (row.affectedRows > 0) {
                        res.send({ success: true, totalQmra, qmra_id })
                    }
                })
            }
            else {
                res.status(200).json({ success: false, message: "Something went wrong try again later" });
            }

        }
    });
})

router.get('/qmra_group_results', (req, res) => {
    var group_sql = `select *
    from qmra
    group by samplingId`

    connection.query(group_sql, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ results, success: true })
        }
        else {
            res.send({ message: "No data found", success: false })
        }

    })
})

router.get('/qmra_results', (req, res) => {

    var select_all_sql = 'select * from qmra'

    connection.query(select_all_sql, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ results, success: true })
        }
        else {
            res.send({ message: "No data found", success: false })
        }

    })

})

router.get('/qmra_group', (req, res) => {
    var sql = 'select count(samplingId), samplingId count_per_sample from  qmra group by samplingId;'
    connection.query(sql, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})

// all qmra results
router.get('/qmra_results', (req, res) => {
    var sql = `select DATE_FORMAT(sampling_date_created,'%d/%m/%Y') as sample_date, weatherCondition, indicator, ratio, estimated_count, is_customized_indicator, pathogen,best_fit_model, alpha, beta, constant, n50, probability_of_infection, likelihood_of_infection, duration_type,is_customize_Pathogen , type, waterAccessability, mun.muni_id, muni_name
                from samplingdata sam, fib_indicator fib, qmra qmr, watersource wat, municipality mun
                where mun.muni_id = sam.muni_id
                and wat.samplingId = sam.samplingId
                and sam.samplingId = qmr.samplingId
                and fib.qmra_id = qmr.qmra_id;`
    connection.query(sql, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})

// specic user qmra results
router.get('/user_qmra_results/:user_id', (req, res) => {
    var sql = `select province_id, DATE_FORMAT(sampling_date_created,'%W')  as weekday, DATE_FORMAT(sampling_date_created,'%d/%m/%Y') as sample_date, weatherCondition, indicator, ratio, estimated_count, is_customized_indicator, pathogen,best_fit_model, alpha, beta, constant, n50, probability_of_infection, likelihood_of_infection, duration_type,is_customize_Pathogen , type, waterAccessability, mun.muni_id, muni_name
                from samplingdata sam, fib_indicator fib, qmra qmr, watersource wat, municipality mun
                where mun.muni_id = sam.muni_id
                and wat.samplingId = sam.samplingId
                and sam.samplingId = qmr.samplingId
                and fib.qmra_id = qmr.qmra_id
                and userId =?`
    connection.query(sql, req.params.user_id, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})

router.get('/user_qmra_results/:start/:end/:user_id', (req, res) => {
    var sql = `select province_id, DATE_FORMAT(sampling_date_created,'%W')  as weekday, DATE_FORMAT(sampling_date_created,'%d/%m/%Y') as sample_date, weatherCondition, indicator, ratio, estimated_count, is_customized_indicator, pathogen,best_fit_model, alpha, beta, constant, n50, probability_of_infection, likelihood_of_infection, duration_type,is_customize_Pathogen , type, waterAccessability, mun.muni_id, muni_name
                from samplingdata sam, fib_indicator fib, qmra qmr, watersource wat, municipality mun
                where mun.muni_id = sam.muni_id
                and wat.samplingId = sam.samplingId
                and sam.samplingId = qmr.samplingId
                and fib.qmra_id = qmr.qmra_id
                and userId =?
                and DATE_FORMAT(sampling_date_created, "%Y-%m-%d") BETWEEN ? AND ?`
    var mst_results = [req.params.user_id, req.params.start, req.params.end]

    connection.query(sql, mst_results, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})

// all mst qmra results
router.get('/mst_results', (req, res) => {
    var sql = `select province_id, DATE_FORMAT(sampling_date_created,'%W')  as weekday, DATE_FORMAT(sampling_date_created,'%d/%m/%Y') as sample_date, weatherCondition, maker, ratio, estimated_count, is_customized_mst, pathogen,best_fit_model, alpha, beta, constant, n50, probability_of_infection, likelihood_of_infection, duration_type,is_customize_Pathogen , type, waterAccessability, mun.muni_id, muni_name
    from samplingdata sam, mst ms, qmra qmr, watersource wat, municipality mun
    where mun.muni_id = sam.muni_id
    and wat.samplingId = sam.samplingId
    and sam.samplingId = qmr.samplingId
    and ms.qmra_id = qmr.qmra_id`
    connection.query(sql, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})

// specific mst qmra results
router.get('/mst_results/:user_id', (req, res) => {
    var sql = `select province_id, DATE_FORMAT(sampling_date_created,'%W')  as weekday, DATE_FORMAT(sampling_date_created,'%d/%m/%Y') as sample_date, weatherCondition, maker, ratio, estimated_count, is_customized_mst, pathogen,best_fit_model, alpha, beta, constant, n50, probability_of_infection, likelihood_of_infection, duration_type,is_customize_Pathogen , type, waterAccessability, mun.muni_id, muni_name
    from samplingdata sam, mst ms, qmra qmr, watersource wat, municipality mun
    where mun.muni_id = sam.muni_id
    and wat.samplingId = sam.samplingId
    and sam.samplingId = qmr.samplingId
    and ms.qmra_id = qmr.qmra_id
    and userId = ?`
    connection.query(sql, req.params.user_id, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})

// get results by specific dates
router.get('/mst_results/:start/:end/:user_id', (req, res) => {

    var sql = `select province_id, DATE_FORMAT(sampling_date_created,'%W')  as weekday,DATE_FORMAT(sampling_date_created,'%d/%m/%Y') as sample_date, weatherCondition, maker, ratio, estimated_count, is_customized_mst, pathogen,best_fit_model, alpha, beta, constant, n50, probability_of_infection, likelihood_of_infection, duration_type,is_customize_Pathogen , type, waterAccessability, mun.muni_id, muni_name
    from samplingdata sam, mst ms, qmra qmr, watersource wat, municipality mun
    where mun.muni_id = sam.muni_id
    and wat.samplingId = sam.samplingId
    and sam.samplingId = qmr.samplingId
    and ms.qmra_id = qmr.qmra_id
    and userId = ?
    and DATE_FORMAT(sampling_date_created, "%Y-%m-%d") BETWEEN ? AND ?`

    var mst_results = [req.params.user_id, req.params.start, req.params.end]
    connection.query(sql, mst_results, (err, results) => {
        if (err) throw err;
        if (results.length > 0) {
            res.send({ success: true, results })
        }
        else {
            res.send({ success: false, message: "cannot find data" })
        }
    })
})


module.exports = router
