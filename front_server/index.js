//这个是进行多核控制的脚本.
var cluster = require('cluster');
var log4js = require('log4js');
var conf = require('./conf');
global.config = conf('dev');
console.log(config);
global.logger = log4js.getLogger();
cluster.setupMaster({
	exec: 'app.js'
});

function forkOne() {
	var worker = cluster.fork();
	logger.info('Start process id: ' + worker.process.pid);
}

var workers = config.app.workers || require('os').cpus().length;
for (var i=0; i<workers; i++) {
	forkOne();
}

cluster.on('exit', function(worker, code, signal) {
	logger.warning(' worker ' + worker.process.pid + ' died');
	if(!hasWorker()) {
		process.exit();
	}
});


function eachWorker(callback) {
	for (var i in cluster.workers) {
		callback(cluster.workers[i]);
	}
}
function hasWorker() {
	for( var i in cluster.workers) {
		return true;
	}
	return false;
}

process.on('SIGHUP', function() {
	eachWorker(function(worker) {
		worker.send('stop');	
	});
	logger.info('[SIGHUP] Stoping Worker');
});
process.on('SIGUSR1', function() {
	eachWorker(function(worker) {
		worker.send('stop');	
	});
	logger.info('[SIGUSR1] Stoping Worker');
});
