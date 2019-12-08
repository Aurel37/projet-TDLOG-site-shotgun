var mysql = require('mysql');

var con = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : 'root',
	socketPath : '/Applications/MAMP/tmp/mysql/mysql.sock',
	database : 'shotgun_website'
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
		con.query('INSERT INTO Students(Name, Sport, Promo) VALUES (?, ?, ?)',
		data,
		function (err, result) {
		if  (err) throw err;
		console.log("1 record inserted");
		});
	}

};

function push_cookie(cookie, name, data) {
	if (data != '') {
		cookie[name] = data;
	}
};

exports.db_manager = con;
exports.add_data = add_data;
exports.push_cookie = push_cookie;


