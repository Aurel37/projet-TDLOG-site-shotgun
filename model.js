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

function add_data_form_1(data) {
	if (data != '') 
	{
		con.query('INSERT INTO Students(Name, Sport, Promo) VALUES (?, ?, ?)',
		data,
		function (err, result) {
		if  (err) throw err;
		console.log("1 record inserted");
		});
	}

};

function query_first_l(data, list) {	
	if (data != '')
	{
	 con.query('SELECT Cours.libelle FROM Cours JOIN langue ON Cours.id_langue = langue.id WHERE langue.libelle = ?', data, 
			function (err, result, fields) {
			if (err) throw err;
			list.push(result);
			//console.log(list);	
			});
			
	}
}

function push_cookie(cookie, name, data) {
	if (data != '') {
		cookie[name] = data;
	}
};

exports.db_manager = con;
exports.add_data = add_data_form_1;
exports.query_first_l = query_first_l;
exports.push_cookie = push_cookie;

//con.end((err) => {});

