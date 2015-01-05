//config 配置信息module
var fs = require('fs');
var path = require('path');
var config = {

	loadConfig: function(dir) {
		var configDir = __dirname + path.sep + dir;
		var files = fs.readdirSync(configDir);
		var config = {};
		for (var file in files) {
			var name = files[file];
			console.log(file);
			var basename = path.basename(name, '.json');
			config[basename] = require(configDir + path.sep + name);
		}

		return config;
		
	}

};

module.exports = config;
