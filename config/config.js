var mysql = require('mysql')

var connection = mysql.createConnection({
    host: 'sql8.freemysqlhosting.net',
    user: 'sql8694205',
    password: 'ysq2jP99iW',
    database: 'sql8694205',
    port:3306
});

/*
var connection = mysql.createConnection({
    host: 'simra-db.cwtgw4wh8ldi.eu-west-1.rds.amazonaws.com',
    user: 'admin',
    password: 'simra.tut.ac.za',
    database: 'simra_db',
    port: 3306
});
*/
connection.connect((err) => {
    if (!err)
        console.log('Connection Established Successfully');
    else
        console.log('Connection Failed!' + JSON.stringify(err, undefined, 2));
});

module.exports = connection;