var app = require('express')();
//var server = require('http').createServer(app);
var session = require('cookie-session');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
//var url = require('url');
//var io = require('socket.io').listen(server);
model.db_manager;

/*
.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined') {

		req.session.answers = [];
	}	
	next();
})*/

app.use(session({secret: 'shotgun'}))

.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined') {
		req.session.answers ={};
	}
	next();
})

.get('/shotgun', function(req, res) {
	res.render('index.ejs');
})

.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	model.push_cookie(req.session.answers, 'name', req.body.name);
	model.push_cookie(req.session.answers, 'year', req.body.year); 
	model.push_cookie(req.session.answers, 'sport', req.body.class1);
	console.log(req.session.answers);
	model.add_data([req.session.answers.name, req.session.answers.sport, req.session.answers.year]);
	res.redirect(index.ejs);
});
/*
io.sockets.on('connection', function (socket, pseudo) {
	socket.on('name', function(name) {
		socket.name = name;
	});
	socket.on('year', function(year) {
		console.log(year);
		socket.year = year;
	});
	socket.on('class1', function(class1) {
		socket.class1 = class1;
	});
	
	socket.on('form_1', function() {
		model.add_data([socket.name, socket.year, socket.class1]);
	});
	
})

.post('/shotgun/add/name', urlencodedParser, function(req, res) {
	cookies.name = req.body.name;
	model.add_data(req.body.name, 'name', 'student', true, cookies.name);
})

.post('/shotgun/add/year', urlencodedParser, function(req, res) {	
	console.log(cookies);
	model.add_data(req.body.year, 'year', 'student', false, cookies.name);	
})

.post('/shotgun/add/class1', urlencodedParser, function(req, res) {
	model.add_data(req.body.class1, 'class1', 'student', false, cookies.name);
	//res.redirect('/shotgun/finish');
})

.use(function(req, res, next){
	res.redirect('/shotgun');
})
*/

app.listen(8080);
