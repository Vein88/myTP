global.config = require('./conf');

var express = require('express');
var route = require('./route');
var http  = require('http');
var path = require('path');

var app = express();
app.set('port', process.env.APPCORE_PORT || 8555);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.set('jsonp callback name', 'cb');

app.use(express.static(path.join(__dirname, 'public')));

app.get('/*', route.index);
//app.get('/static/*', route.static); #静态资源。
var server = http.createServer(app).listen(app.get('port'), function() {
	console.log('Server start at port: ' + app.get('port'));
});
