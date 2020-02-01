/* This is the model, it manages the link with the database
 */
var mysql = require('mysql');

//creation of the linker with the database
var con = mysql.createConnection({
	host : 'localhost',
	user : 'root',
	password : 'root',
	socketPath : '/Applications/MAMP/tmp/mysql/mysql.sock',     //uncomment this line 
								    // if you're using Mamp 
	database : 'shotgun_website'                                //the name of the database imported in MySQL
});

con.connect(function(err) {
	if (err) throw err;
	console.log('connected !');
	//the link is made
	//if you have no data provided in the form check if you have the message 'connected' in the consol
});

function analyse_word(word) {
	/* remove all the unecessary character at the end of a string
	 * to avoid errors when selected data in the database
	 * @param {word} the word to analyse
	 * @return the world analysed
	 */
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
	/* select the names of the students with the name names
	 * @param {name} the name to compare
	 * @param {callback} the callback function to define so as to catch the result
	 */
	if (typeof(name) != 'undefined') 
	{
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
	/* add into the database the id of the student 
	 * @param {data} data to be added
	 */
	if (typeof(data) != 'undefined') 
	{
		con.query('INSERT INTO Students(first_name, last_name, year, number_class, sport) VALUES (?, ?, (SELECT id FROM Year WHERE libelle = ?), ?, (SELECT id FROM Sports WHERE libelle = ?))',
			data,
			function (err) {
				if  (err) throw err;
			});	
	}

};

function select_add_class(data, name, i) {
		/* select the names and libelle for the function add_data
		 * and then insert which class the client wants
		 * @param {data} the data to add, here a class chosen by the client
		 * @param {name} the name of the client
		 * @param {i} the rank of the class 'data'
		 */
		//we select the id of the client
		con.query('SELECT id FROM Students WHERE last_name = ?', [name],
			function(err, result)  {
				if (err) throw err;
				var id_student = result[0].id;
				var head_data = data.pop();
				// then the id of the class
				con.query('SELECT id FROM Cours WHERE libelle = ?', [head_data], 				function(err, result) {
					if (err) throw err;
					var id_class = result[0].id;
					//finally data are inserted
					con.query('INSERT INTO Choices(id_students, id_class, rank) VALUES (?, ?, ?)', 
					[id_student, id_class, i], 
					function(err) {
						if (err) throw err;
					});
				});
			});
}

function add_data_class(data, name) {
	/* Insert the class with their rank of the client inside the database
	 */
	if (typeof(data) != 'undefined') {
		var n = data.length;
		var cursor = data.length;
		while (cursor > 0) {
			select_add_class(data, name, cursor);
			cursor--;
		}
	}
}

function add_data_langue(last_name, data) {
	/* add into the database the last_name of the student 
	 * @param {data} data to be added
	 */

	if (typeof(data) != 'undefined' && typeof(last_name) != 'undefined')
	{
	var n = data.length;
	for (var i = 0; i < n;  i++) {
	con.query('INSERT INTO Language_wanted(id_students, id_language) VALUES ((SELECT id FROM Students WHERE last_name = ?), (SELECT id FROM Langue WHERE libelle = ?))', [last_name, data[i]],
		function (err) {
			if (err) throw err;
		});
	}
	}
}

function get_class(sport, promo, langue, callback){
	/* select the classes according to the data 
	 * @param {data} data provided for the selection
	 * @param {callback} the callback function to catch the result of the selection
	 */

	if (typeof(sport) != 'undefined' && typeof(promo) != 'undefined' && typeof(langue) != 'undefined') 
	{
		con.query('SELECT Cours.libelle FROM Cours JOIN Langue ON Cours.id_langue = Langue.id WHERE Langue.libelle  IN ? AND Cours.id_slot != (SELECT id_slot FROM Sports WHERE libelle = ?) AND Cours.id_slot IN (SELECT For_who.id_creneau FROM For_who JOIN Year WHERE For_who.id_promo = (SELECT id FROM Year WHERE Year.libelle = ?))', [[langue], sport, promo], function(err, result){
			if(err){
				callback(err, null);
			}
			else {
				callback(null, result);
			}

		});
	}
}

function get_sport(callback){
	/* select the sports according to the data 
	 * @param {callback} the callback function to catch the result of the selection
	 */

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
	/* select the languages
	 * @param {callback} the callback function to catch the result of the selection
	 */

	con.query('SELECT libelle FROM Langue WHERE libelle != "anglais"',

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
	/* select the pormos availables
	 * @param {callback} the callback function to catch the result of the selection
	 */

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



//exports all the function 
exports.db_manager = con;
exports.get_last_name = get_last_name;
exports.add_data_student_id = add_data_student_id;
exports.add_data_class = add_data_class;
exports.add_data_langue = add_data_langue;
exports.get_sport = get_sport;
exports.get_langue = get_langue;
exports.get_promo = get_promo;
exports.get_class = get_class;
//exports.query_first_l = query_first_l;
//con.end((err) => {});

