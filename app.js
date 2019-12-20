var express = require('express');
var app = express();
//var server = require('http').createServer(app);
var session = require('cookie-session');
var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({extended: false});
var model = require('./model');
//var url = require('url');
//var io = require('socket.io').listen(server);
model.db_manager;
app.use(express.static("views"));

/*
.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined') {

		req.session.answers = [];
	}	
	next();
})*/

app.use(session({secret: 'shotgun'}))

.use(function(req, res, next) {
	if (typeof(req.session.answers) == 'undefined')
	{
		req.session.answers ={};
	}
	next();
})

.get('/shotgun', function(req, res) {
	res.render('index.ejs');
	if (typeof(req.session.answers.language) != 'undefined')
	{
		//console.log('langue' + req.session.answers.language);
		var list = [];	
		model.query_first_l([req.session.answers.language], list/*function(err, res) {
			if (err) throw err;
			list = res;
			model.push_cookie(req.session.answers, 'language_list', list);
		}*/);
		req.session.answers['language_list'] = list; 
		//model.push_cookie(req.session.answers, 'language_list', model.query_first_l([req.session.answers.language]));
		//console.log(req.session.answers.language_list)
		console.log(req.session.answers.language_list);
	}
	else
	{
		console.log('toujours rien');
	}

})

.post('/shotgun/add/form_1', urlencodedParser, function(req, res) {
	model.push_cookie(req.session.answers, 'name', req.body.name);
	model.push_cookie(req.session.answers, 'year', req.body.year);
	model.push_cookie(req.session.answers, 'language', req.body.langue);
	model.push_cookie(req.session.answers, 'sport', req.body.class1);
	
	//model.add_data_form_1([req.session.answers.name, req.session.answers.sport, req.session.answers.year]);
	res.redirect('/shotgun');
});



app.listen(8080);
