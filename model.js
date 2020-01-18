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

function get_last_name(name, callback) {
	if (typeof(name) != 'undefined') {
		var word = analyse_word(name);
		con.query('SELECT last_name FROM Students WHERE last_name  = ?', 
			[word],
			function(err, result) {
				if (err)
				{
					return callback(err, null);
				}
				else
				{
					return callback(null, result);
				}
			});
	}
}



function add_data_student_id(data) {
	if (typeof(data) != 'undefined') {
		con.query('INSERT INTO Students(first_name, last_name, year, number_class, sport) VALUES (?, ?, (SELECT id FROM Year WHERE libelle = ?), ?, (SELECT id FROM Sports WHERE libelle = ?))',
			data,
			function (err) {
				if  (err) throw err;
				console.log("1 record inserted");
			});
		
	}

};

function select_add_class(data, name, i) {
		con.query('SELECT id FROM Students WHERE last_name = ?', [name],
			function(err, result)  {
				if (err) throw err;
				var id_student = result[0].id;
				var head_data = data.pop();
				con.query('SELECT id FROM Cours WHERE libelle = ?', [head_data],
				function(err, result) {
					if (err) throw err;
					var id_class = result[0].id;
					con.query('INSERT INTO Choices(id_students, id_class, rank) VALUES (?, ?, ?)', 
					[id_student, id_class, i], 
					function(err) {
						if (err) throw err;
						console.log('1 record inserted');
					});
				});
			});
}

function add_data_class(data, name) {
	if (typeof(data) != 'undefined') {
		var n = data.length;
		var cursor = data.length;
		while (cursor > 0) {
			select_add_class(data, name, cursor);
			cursor--;
		}
	}
}

function add_data_langue(data) {
	if (typeof(data) != 'undefined')
	{
	con.query('INSERT INTO Language_wanted(id_students, id_language) VALUES ((SELECT id FROM Students WHERE last_name = ?), (SELECT id FROM Langue WHERE libelle = ?))', data,
		function (err) {
			if (err) throw err;
			console.log('1 record inserted');
		});
	}
}

function query_first_l(data, callback) {	
	if (typeof(data) != 'undefined')
	{
	var word = analyse_word(data);
	con.query('SELECT Cours.libelle FROM Cours JOIN Langue ON Cours.id_langue = Langue.id WHERE Langue.libelle  = ?', [word], 
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
	con.query('SELECT libelle FROM Sports',
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
	con.query('SELECT libelle FROM Langue',
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
	con.query('SELECT libelle FROM Year',
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
exports.get_last_name = get_last_name;
exports.add_data_student_id = add_data_student_id;
exports.add_data_class = add_data_class;
exports.add_data_langue = add_data_langue;
exports.get_sport = get_sport;
exports.get_langue = get_langue;
exports.get_promo = get_promo;
exports.query_first_l = query_first_l;
exports.push_cookie = push_cookie;

//con.end((err) => {});

