/*
Controller of the server
Below all the packages imported
*/
var express = require('express');
var app = express();  //app helps managing the server
var server = require('http').createServer(app); //the server is created thanks app
var session = require('express-session')({
	secret: 'shotgun',
	resave: true,
	saveUninitialized: true
});
var sharedsession = require("express-socket.io-session");
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
var url = require('url');
var io = require('socket.io').listen(server);

model.db_manager;

io.use(sharedsession(session, {
	autoSave: true
})); 

app.use(express.static("views"));

app.use(session) 

.get('/shotgun', function(req, res) {
	/* This function redirect the client to the main page index.ejs
	 ** @param {req} what is "provid" by the client
	 * @param {res} what is return by the server
	 */
	res.render('index.ejs');
})
.get('/shotgun/end_page', function(req, res) {
	/* This function redirect the client to the last page end_page.ejs
	 * @param {req} what is "provid" by the client
	 * @param {res} what is return by the server
	 */
	res.render('end_page.ejs');
})

.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	/* Handle the insertion of the client data into the database
	 * @param {req} what is "provid" by the client
	 * @param {res} what is return by the server
	 */
	if (typeof(req.session.first_name) ==  'undefined' || typeof(req.session.last_name) ==  'undefined' || typeof(req.session.year) ==  'undefined' || typeof(req.session.rank_langue_list) ==  'undefined' || typeof(req.session.sport) ==  'undefined' ||  typeof(req.session.number) ==  'undefined' || typeof(req.session.langue_selected) == 'undefined') {
		//if data haven't been provided, the form is reload to let the client provid all the data
		res.redirect('/shotgun');
	}
	else {
		model.add_data_student_id([req.session.first_name, req.session.last_name, req.session.year, req.session.number, req.session.sport]);
		model.add_data_class(req.session.rank_langue_list, req.session.last_name);
		model.add_data_langue(req.session.last_name, req.session.langue_selected);
		res.redirect('/shotgun/end_page');
	}
});



io.sockets.on('connection', function (socket){
		/* This is the direct link with the server by using the WebSockets
		 */

		model.get_promo(function(err, result) {
			/* get_promo provids all the promos available 
			 * @param {err} the error to catch if something go wrong
			 * @param {result} the data returned
			 */
				if (err) throw err;
				//socket.emit sends the data to the client with the tag 'promo_list' here
				socket.emit('promo_list', result);
			});

		model.get_sport(function(err, result) {
			/* get_sport provids all the sports available 
			 * @param {err} the error to catch if something go wrong
			 * @param {result} the data returned
			 */

				if (err) throw err;
				socket.emit('sport_list', result);
			});

		model.get_langue(function(err, result) {
			/* get_langue provids all the languages available 
			 * @param {err} the error to catch if something go wrong
			 * @param {result} the data to provid 
			 */

				if (err) throw err;
				socket.emit('langue_list', result);
			});
	
		//socket.on received the WebSoockets emit by the client with a tagname 
		socket.on('first_name', function(first_name) {
			socket.handshake.session.first_name = first_name;//we simply put the data in cookies 
			socket.handshake.session.save();
			
		});

		socket.on('last_name', function(last_name) {
			socket.handshake.session.last_name = last_name;
			socket.handshake.session.save();
			model.get_last_name(last_name, function(err, result) {
					/* get_last_name provid all students with the same last name as last_name 
					 * @param {err} the error to catch if something go wrong
			 	       	 * @param {result} the data returned
			 		 */
					if (err) throw err;

					//here we check if the last name of the client is already use, if so we forbid him to use it
					if (result.length == 0) {
						socket.emit('last_name', false);
					}
					else
					{
						socket.emit('last_name', true);
					}	
				});
		});

		socket.on('year', function(year) {
			socket.handshake.session.year = year;
			socket.handshake.session.save();
		});

		socket.on('sport', function(sport) {
			socket.handshake.session.sport = sport;
			socket.handshake.session.save();
		});

		socket.on('sport', function(sport) {
			socket.handshake.session.sport = sport;
			socket.handshake.session.save();
		});

		socket.on('langue_selected', function(langue_selected){
			socket.handshake.session.langue_selected = langue_selected;
			socket.handshake.session.save();
		});

		socket.on('classs', function(){
			model.get_class(socket.handshake.session.sport, socket.handshake.session.year, socket.handshake.session.langue_selected, function(err, result) {
			/* get_class provid all the class available according to the langue selected
			 * @param {err} the error to catch if something go wrong
			 * @param {result} the data returned
			 */

				if (err) throw err;
				socket.emit('classs', result);
			});
		})

		socket.on('number', function(number) {
			socket.handshake.session.number = number;
			socket.handshake.session.save();
		});

		socket.on('rank_langue', function(rank) {
			socket.handshake.session.rank_langue_list = rank;
			socket.handshake.session.save();
		});
		
});

//the server is send to the canal 8080 
server.listen(8080);
