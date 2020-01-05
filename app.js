var express = require('express');
var app = express();
var server = require('http').createServer(app);
var session = require('express-session')({
	secret: 'shotgun',
	resave: true,
	saveUninitialized: true
});
var sharedsession = require("express-socket.io-session");
//var bodyParser = require('body-parser');
//var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
//var url = require('url');
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
	if (typeof(req.session.sport) != 'undefined')
	{
		console.log('transfer operational');
	}
	if (typeof(req.session.langue) != 'undefined')
	{
		console.log('transfer operational');
	}

})

/*.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	console.log('newt');
	model.push_cookie(req.session.answers, 'name', req.body.first_name);
	model.push_cookie(req.session.answers, 'year', req.body.year);
	model.push_cookie(req.session.answers, 'language', req.body.langue);
	model.push_cookie(req.session.answers, 'sport', req.body.class1);
	
	//model.add_data_form_1([req.session.answers.name, req.session.answers.sport, req.session.answers.year]);
	res.redirect('/shotgun');
});*/


io.sockets.on('connection', function (socket){
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
		socket.on('sport', function(sport_list) {
			socket.handshake.session.sport = sport_list;
			socket.handshake.session.save();
			model.get_sport(sport_list, function(err, result) {
				if (err) throw err;
				socket.emit('sport', result);
			});
		});
});

server.listen(8080);
