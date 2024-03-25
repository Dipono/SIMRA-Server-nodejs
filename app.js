require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const Connection = require('./config/config')

const app = express();
app.use(cors());
app.use(express.json());
app.use(bodyParser.json()); 

app.use(bodyParser.urlencoded({ extended: false }));

app.use('/api', require('./routes/user'));
app.use('/api', require('./routes/level1'));
app.use('/api', require('./routes/fib'));
app.use('/api', require('./routes/qmra_mst'));
app.use('/api', require('./routes/mapping'));
app.use('/api', require('./routes/updatePassword'));
app.use('/api', require('./routes/updateProfile'));
app.use('/api', require('./routes/municipality'));
app.use('/api', require('./routes/h2s_results'));
app.use('/api', require('./routes/survey_results'));
app.use('/api', require('./routes/fib_results'));


app.use('/', (req, res) =>{
    res.send('Endpoint')
});


app.listen(process.env.PORT, () => {
    console.log('Server started at port ' + process.env.PORT)
})