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
	model.add_data_student_id([req.session.first_name, req.session.last_name, req.session.year, req.session.number, req.session.sport]);
	model.add_data_class(req.session.rank_langue_list, req.session.last_name);
	model.add_data_langue([req.session.last_name, req.session.langue]);
	res.redirect('/shotgun/end_page');
});



io.sockets.on('connection', function (socket){


		model.get_promo(function(err, result) {
				if (err) throw err;
				socket.emit('promo_list', result);
			});

		model.get_sport(function(err, result) {
				if (err) throw err;
				socket.emit('sport', result);
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
					console.log(last_name);
					if (typeof(result) != 'undefined') {
						socket.emit('last_name' ,true)
					}
				});
		});
		socket.on('year', function(year) {
			socket.handshake.session.year = year;
			socket.handshake.session.save();
		});
		socket.on('langue', function(langue_list) {
			socket.handshake.session.langue = langue_list;
			socket.handshake.session.save();
			model.query_first_l(langue_list, function(err, result) {
				if (err) throw err;
				socket.emit('langue', result);
			});
		});
		socket.on('sport', function(sport) {
			socket.handshake.session.sport = sport;
			socket.handshake.session.save();
		});
		socket.on('number', function(number) {
			socket.handshake.session.number = number;
			socket.handshake.session.save();
		});
		socket.on('rank_langue', function(rank) {
			socket.handshake.session.rank_langue_list = rank;
			socket.handshake.session.save();
		});
		
});

server.listen(8080);
