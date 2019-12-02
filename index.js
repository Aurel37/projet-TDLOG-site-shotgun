var express = require('express');
var session = require('cookie-session');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
var url = require('url');

model.db_manager;

var app = express();

app.use(session({secret: 'shotgun'}))

.use('shotgun' , function(req, res, next) {
		
	next();
})

.get('/shotgun', function(req, res) {
	res.render('main_page.ejs', {answers: req.session.answers});
})

.post('/shotgun/add/year', urlencodedParser, function(req, res) {
	if (typeof(req.session.answers) == 'undefined') {
		req.session.answers = [];
	}	
	model.add_data(req.body.year, 'year', 'student');
	res.redirect('/shotgun');
	
})

.post('/shotgun/add/year', urlencodedParser, function(req, res) {
	model.add_data(req.body.class1, 'class1', 'student');
	res.redirect('/shotgun');
})

.use(function(req, res, next){
	res.redirect('/shotgun');
})

.listen(8080);
