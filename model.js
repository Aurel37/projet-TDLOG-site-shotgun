var mysql = require('mysql');

var con = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : 'root',
	socketPath : '/Applications/MAMP/tmp/mysql/mysql.sock'
});

con.connect(function(err) {
	if (err) throw err;
	console.log('connected !');
});

exports.db_manager = con;



