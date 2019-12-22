var express = require('express');
var app = express();
var server = require('http').createServer(app);
var session = require('cookie-session');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
//var url = require('url');
var io = require('socket.io').listen(server);
model.db_manager;

function socket_add(tag, socket, req) {
	socket.on(tag, function(data) {
		console.log(data);
		model.push_cookie(req.session.answers, tag, data);
	});
}

app.use(express.static("views"));

app.use(session({secret: 'shotgun'}))

.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined')
	{
		req.session.answers ={};
	}
	next();
})

/*.all(function(req, res, next) {
	
	next()
})*/

.get('/shotgun', function(req, res) {
	res.render('index.ejs');
	/*if (typeof(req.session.answers.language) != 'undefined')
	{
		console.log(req.session.answers.name);	
		model.query_first_l([req.session.answers.language], function(err, result) {
			if (err) throw err;
			res.render('index.ejs', {language_list: result});
		});
		
	}
	else
	{
		res.render('index.ejs', {language_list: []});
	}*/
	
})

.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	console.log('newt');
	model.push_cookie(req.session.answers, 'name', req.body.first_name);
	model.push_cookie(req.session.answers, 'year', req.body.year);
	model.push_cookie(req.session.answers, 'language', req.body.langue);
	model.push_cookie(req.session.answers, 'sport', req.body.class1);
	
	//model.add_data_form_1([req.session.answers.name, req.session.answers.sport, req.session.answers.year]);
	res.redirect('/shotgun');
});
io.sockets.on('connection', function (socket) {
		console.log('io fonctionne correctement');
		socket.on('langue', function(langue_list) {
			model.query_first_l(langue_list, function(err, result) {
				if (err) throw err;
				socket.emit('langue', result);
			});
		});
});

server.listen(8080);
