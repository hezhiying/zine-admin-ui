var webpack = require('webpack');
var commonsPlugin = new webpack.optimize.CommonsChunkPlugin('common.js');

module.exports = {
	//插件项
	plugins: [commonsPlugin],
	//页面入口文件配置
	entry: {
		index : './js/wula.js'
	},
	//入口文件输出配置
	output: {
		path: 'dist/js',
		filename: '[name].js'
	},
	module: {
		//加载器配置
		loaders: [
			{ test: /\.css$/, loader: 'style-loader!css-loader' },
			{ test: /\.js$/, loader: 'jsx-loader?harmony' },
			{ test: /\.scss$/, loader: 'style!css!sass?sourceMap'},
			{ test: /\.(png|jpg)$/, loader: 'url-loader?limit=8192'}
		]
	},
	//其它解决方案配置
	resolve: {
		root: './node_modules', //绝对路径
		extensions: ['', '.js', '.json', '.scss'],
		alias: {
			fun : 'js/components/fun.js',
		}
	},
	externals: {
		// require("jquery") 是引用自外部模块的
		// 对应全局变量 jQuery
		"jquery": "jQuery"
	}
};