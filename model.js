var mysql = require('mysql');

var con = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : 'root',
	socketPath : '/Applications/MAMP/tmp/mysql/mysql.sock',
	database : 'td_log_db'
});

con.connect(function(err) {
	if (err) throw err;
	console.log('connected !');
});

function add_data(data) {
	if (data != '') 
	{
		//if (first) {
		//	var sql = 'INSERT INTO ' +  table + ' (' + column + ') '  +  "VALUES" + ' (' + data + ')';
		//}
		/*else
		{
			var sql = 'INSERT INTO ' +  table + ' (' + column + ') '  +  "VALUES" + ' (' + data + ') WHERE '  ;
		}*/
		con.query('INSERT INTO student(name, year, class1) VALUES (?, ?, ?)',
		data,
		function (err, result) {
		if  (err) throw err;
		console.log("1 record inserted");
		});
	}

};


exports.db_manager = con;
exports.add_data = add_data;



