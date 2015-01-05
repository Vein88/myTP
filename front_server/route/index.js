var request = require('request'); //request 
var async = require('async'); 	//并发请求.
var log4js = require('log4js'); //日志记录.
var logger = log4js.getLogger();

var config = require('../conf');
var env = config('dev');
//var env = config.loadConfig('dev');
var index = function (req, res, next) {
	//在这里进行一系列的路由过滤操作。 避免传递到后台处理。
	var option = env.config.apiHost + req.path + '?' + req.query;
	logger.debug(option);
	option = {
		url: option
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
}


exports.index = index;
