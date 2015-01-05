var $uglify = require('uglify-js');

var $min = process.env.opt_suffix || '.min.js'

var fs = require('fs');
process.argv.slice(2).forEach(uglify);

function uglify(path) {
    var idx = path.lastIndexOf('/') + 1, folder = path.substr(0, idx), names = path.substring(idx, path.length - 3).split('+');
    fs.writeFileSync(folder + names.join('+') + $min, names.map(function (name) {
        return run(folder + name + '.js');
    }).join('\n'));
}
function run(path) {
    // console.log('uglify ' + path);
    var res = fs.readFileSync(path, 'utf8');
    console.log('uglify ', path, res.length);
    var ret = $uglify.minify(res, {
        fromString: true
    });
    return ret.code;
}