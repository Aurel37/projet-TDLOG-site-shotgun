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

function analyse_word(word) {
	var res = '';
	var n = word.length;
	var i = 0;
	while (word[i] != '\n' && i<n)
	{
		res += word[i];
		i++;
	}
	return res
}
	

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

function query_first_l(data, callback) {	
	if (typeof(data) != 'undefined')
	{
	var word = analyse_word(data);
	con.query('SELECT Cours.libelle FROM Cours JOIN langue ON Cours.id_langue = langue.id WHERE langue.libelle = ?', [word], 
			function (err, result, fields) {
			if (err)
			{
				callback(err, null);
			}
			else
			{
				callback(null,  result);
			}	
			});
			
	}
}

function get_sport(callback){
	con.query('SELECT Sports.Libelle FROM Sports',
	function (err, result, fields) {
		if (err)
		{
			callback(err, null);
		}
		else
		{
			callback(null, result);
		}
	});
}
function get_langue( callback){
	con.query('SELECT libelle FROM langue',
	function (err, result, fields) {
		if (err)
		{
			callback(err, null);
		}
		else
		{
			callback(null, result);
		}
	});
}
function get_promo( callback){
	con.query('SELECT libele FROM promo',
	function (err, result, fields) {
		if (err)
		{
			callback(err, null);
		}
		else
		{
			callback(null, result);
		}
	});
}


function push_cookie(cookie, name, data) {
	if (data != '') {
		cookie[name] = data;
	}
};

exports.db_manager = con;
exports.add_data = add_data_form_1;
exports.get_sport = get_sport;
exports.get_langue = get_langue;
exports.get_promo = get_promo;
exports.query_first_l = query_first_l;
exports.push_cookie = push_cookie;

//con.end((err) => {});

