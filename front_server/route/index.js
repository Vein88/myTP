var request = require('request');
var async = require('async');

var index = function (req, res, next) {
	console.log(req);
	option = {
		url: 'http://localhost:8000' + req.path + '?' + req.query
	};
	async.parallel(
		[
			function(cb){
				request(option, function(err, response, body){
					if(err) {
						console.log('Http request failed! Caused by ' + err);
					}
					//console.log(body);
					res.send(body);
					cb(null , response, body);	
				});	
			}
			
		], 
		function(err, response, ret){
			//res.send(ret[0]);
			if(err) {
				console.log('There must something wrong with the Async Plugins, error is ' + err);
				exit;
			}
			//console.log(response);
			//res.send(ret);
		}
	);
	//res.redirect('http://www.baidu.com');
	if(req.query.control) {
		console.log('control');	
	} else {
		console.log('no control');
	}
}


exports.index = index;
