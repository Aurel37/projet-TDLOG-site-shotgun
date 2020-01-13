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

/*app.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined')
	{
		req.session.answers ={};
	}
	next();
})*/

/*.all(function(req, res, next) {
	
	next()
})*/

.get('/shotgun', function(req, res) {
	res.render('index.ejs');
	if (typeof(req.session.langue)  == 'undefined')
	{
		console.log(req.session.langue);
	}
})
.get('/shotgun/end_page', function(req, res) {
	res.render('end_page.ejs');
})

.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	console.log('newt');
	/*model.push_cookie(req.session.answers, 'name', req.session.first_name);
	model.push_cookie(req.session.answers, 'year', req.session.year);
	model.push_cookie(req.session.answers, 'language', req.session.langue);
	//model.push_cookie(req.session.answers, 'sport', req.session.class1);*/
	
	//model.add_data_form_1([req.session.answers.name, req.session.answers.sport, req.session.answers.year]);
	res.redirect('/shotgun/end_page');
});



io.sockets.on('connection', function (socket){

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
		socket.on('rank_langue', function(rank) {
			socket.handshake.session.langue = rank;
			socket.handshake.session.save();
			console.log(rank);
		});
		
});

server.listen(8080);
