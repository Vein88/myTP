//fis.cofig.set('settings.sprinter.csssprintes');
fis.config.set('namespace', 'common');

//fis.config.set('root_dir', '/home/vein/myTP');

fis.config.set('roadmap.path', []);
fis.config.set('modules.parser.less', 'less');
fis.config.set('roadmap.ext.less', 'css');
fis.config.merge({
	roadmap: {
		domain: 'http://localhost:8242/',
		path: [
			{
				reg: /^\/page\/(.*)$/,
				url: '${namespace}/$1',
				release: '/template/${namespace}/$1',
			},
			{
				reg: /^\/widget\/(.*\.tpl)$/,
				isMod: false,
				url: '${namespace}/widget/$1',
				release: '/template/${namespace}/widget/$1'
			},
			{
				reg: /^\/widget\/(.*\.(less|css|js|jpg|png))$/,
				isMod: false,
				url: '${namespace}/widget/$1',
				release: '/static/${namespace}/widget/$1'
			},
			{
				reg: /^\/static\/(.*\.(less|css|js|jpg|png|map))$/,
				url: '${namespace}/$1',
				release: '/static/${namespace}/$1'
			},
			{
				reg: '${namespace}-map.json',
				release: '/configs/${namespace}-map.json'
			}
		]
	},
	deploy: {
		local: [
			{
				to: '../release'
			}
		]
	}
}
);
