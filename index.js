var fs = require('fs')
var vm = require('vm')
var express = require('express');
var session = require('cookie-session');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model')

model.db_manager;

var app = express();

app.use(session({secret: 'shotgun'}))

.use('shotgun' , function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined') {
		req.session.answers = [];
	}		
	next();
})

.get('/shotgun', function(req, res) {
	res.render('main_page.ejs', {answers: req.session.answers});
})

.use(function(req, res, next){
	res.redirect('/shotgun');
})

.listen(8080);
