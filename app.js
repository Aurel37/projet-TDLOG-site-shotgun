var express = require('express');
var app = express();
var server = require('http').createServer(app);
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

function socket_add(tag, socket, req) {
	socket.on(tag, function(data) {
		model.push_cookie(req.session.answers, tag, data);
	});
}


io.use(sharedsession(session, {
	autoSave: true
}));

app.use(express.static("views"));
app.use(session)


.get('/shotgun', function(req, res) {
	res.render('index.ejs');
})
.get('/shotgun/end_page', function(req, res) {
	res.render('end_page.ejs');
})

.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	console.log('first_name', typeof(req.session.first_name));
	console.log('last_name', typeof(req.session.last_name));
	console.log('year', typeof(req.session.year));
console.log('langue_list', typeof(req.session.rank_langue_list));
console.log('sport', typeof(req.session.sport));
console.log('number', typeof(req.session.number));




	if (typeof(req.session.first_name) ==  'undefined' || typeof(req.session.last_name) ==  'undefined' || typeof(req.session.year) ==  'undefined' || typeof(req.session.rank_langue_list) ==  'undefined' || typeof(req.session.sport) ==  'undefined' ||  typeof(req.session.number) ==  'undefined' || typeof(req.session.langue_selected) == 'undefined') {
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


		model.get_promo(function(err, result) {
				if (err) throw err;
				socket.emit('promo_list', result);
			});

		model.get_sport(function(err, result) {
				if (err) throw err;
				socket.emit('sport_list', result);
			});
		model.get_langue(function(err, result) {
				if (err) throw err;
				socket.emit('langue_list', result);
			});
		socket.on('first_name', function(first_name) {
			socket.handshake.session.first_name = first_name;
			socket.handshake.session.save();
			
		});
		socket.on('last_name', function(last_name) {
			socket.handshake.session.last_name = last_name;
			socket.handshake.session.save();
			model.get_last_name(last_name, function(err, result) {
					if (err) throw err;
					console.log(result);
					if (result.length == 0) {
						console.log('true');
						socket.emit('last_name', false);
					}
					else
					{
						console.log('false');
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


		/*socket.on('langue', function(langue) {
			socket.handshake.session.langue = langue;
			socket.handshake.session.save();


		});*/
		socket.on('sport', function(sport) {
			socket.handshake.session.sport = sport;
			socket.handshake.session.save();
		});
		socket.on('langue_selected', function(langue_selected){
			console.log('langue slected' + langue_selected);
			socket.handshake.session.langue_selected = langue_selected;
			socket.handshake.session.save();
		});

		socket.on('classs', function(){
			model.get_class(socket.handshake.session.sport, socket.handshake.session.year, socket.handshake.session.langue_selected, function(err, result) {
				if (err) throw err;
				socket.emit('classs', result);
			});
		})

		

		socket.on('number', function(number) {
			socket.handshake.session.number = number;
			socket.handshake.session.save();
		});
		socket.on('rank_langue', function(rank) {
			console.log('rank', rank);
			socket.handshake.session.rank_langue_list = rank;
			socket.handshake.session.save();
		});
		
});

server.listen(8080);
