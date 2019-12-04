var app = require('express')();
var server = require('http').createServer(app);
//var session = require('cookie-session');
//var bodyParser = require('body-parser');
//var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
//var url = require('url');
var io = require('socket.io').listen(server);
model.db_manager;

/*
.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined') {

		req.session.answers = [];
	}	
	next();
})*/

app.get('/shotgun', function(req, res) {
	res.sendfile('views/index.html');
})

io.sockets.on('connection', function (socket, pseudo) {
	socket.on('new_student', function(name) {
		socket.name = name;
	});
	socket.on('year', function(year) {
		console.log(year);
		socket.year = year;
	});
	socket.on('class1', function(class1) {
		socket.class1 = class1;
		model.add_data([socket.name, socket.year,  socket.class1]);
	});
})
/*
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

server.listen(8080);
