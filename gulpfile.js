var gulp    = require('gulp'),
	concat  = require('gulp-concat'),
	rename  = require('gulp-rename'),
	uglify  = require('gulp-uglify'),
	del     = require('del');
var webpack = require('webpack-stream');
var sass = require('gulp-sass');
var minifycss = require('gulp-minify-css');

var amdOptimize = require("amd-optimize");           //require优化
var watch       = require('gulp-watch');
var jshint      = require('gulp-jshint');           //js规范验证
var mapStream = require('map-stream');
var sourcemaps = require('gulp-sourcemaps');
var shell = require('gulp-shell');

const elixir = require('laravel-elixir');

require('laravel-elixir-vue');
elixir.config.assetsPath = './';
elixir.config.publicPath = './dist/';

//elixir(mix => {
//	mix.sass('app.scss')
//		.webpack('wula.js')
//		.copy('./dist/js/wula.js', '../../../app/wwwroot/modules/zine/assets/js/wula.js');
//});

var gwebpack = require('gulp-webpack');
var wwebpack = require('webpack');
var commonsPlugin = new wwebpack.optimize.CommonsChunkPlugin('common.js');
var webpack_config = {
	//插件项
	plugins: [commonsPlugin],
	//页面入口文件配置
	entry: {
		index : './js/wula.js'
	},
////	//入口文件输出配置
	output: {
//		path: './dist/js',
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
			AppStore : 'js/stores/AppStores.js',
			ActionType : 'js/actions/ActionType.js',
			AppAction : 'js/actions/AppAction.js'
		}
	},
	externals: {
		// require("jquery") 是引用自外部模块的
		// 对应全局变量 jQuery
		"jquery": "jQuery"
	}
};
gulp.task('webpack', shell.task([
	'webpack -p -d --display-error-details'
]));


gulp.task('default',  ['clean'], function() {
	return gulp.src('js/wula.js')
		.pipe(jshint())
		.pipe(jshint.reporter('default'))
		.pipe(gwebpack())
		.pipe(concat("wula.js"))           //合并
		.pipe(gulp.dest('dist/js'))
		.pipe(rename({suffix: '.min'}))   //rename压缩后的文件名
		.pipe(uglify())    //压缩
		.pipe(gulp.dest('../../../app/wwwroot/modules/zine/assets/js/'));  //输出


});
// 编译Sass
gulp.task('sass', function() {
	gulp.src('./scss/*.scss')
		.pipe(sourcemaps.init())
		.pipe(sass())
		.pipe(gulp.dest('./dist/css'))
		.pipe(rename({ suffix: '.min' }))
		.pipe(minifycss())
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest('./dist/css'));
});

//监控文件变化
gulp.task('watch',['default','sass'],  function () {

	gulp.watch("./js/**/*.js", function () {
		gulp.run('default');
	});

	// 监听sass
	gulp.watch('./scss/**/*.scss', function(){
		gulp.run('sass');
	});
});

gulp.task('clean', function (cb) {
	return del('dist/js', cb)
});

var path = "./js/**/*.js";
var outPath = "./dist/js/";
//脚本检查
gulp.task('lint', function () {
	gulp.src(path)
		.pipe(jshint())
		.pipe(jshint.reporter('default'));
});

//require合并
gulp.task('rjs', function () {
	gulp.src('./src/js/**/*.js')
		.pipe(amdOptimize("js/wula", {
			paths: {
				"fun"                 : "components/fun.js"
			}
		}))
		.pipe(concat("wula.js"))           //合并
		.pipe(gulp.dest("dist/js"))          //输出保存
		.pipe(rename({suffix: '.min'}))		//rename压缩后的文件名
		.pipe(uglify())                        //压缩
		.pipe(gulp.dest("dist/js"));         //输出保存

});



gulp.task('dev', ['clean'], function () {
	return gulp.src('js/*.js')
		.pipe(concat('wula.js'))    //合并所有js到main.js
		.pipe(gulp.dest('dist/js'))    //输出main.js到文件夹
		.pipe(rename({suffix: '.min'}))   //rename压缩后的文件名
		.pipe(uglify())    //压缩
		.pipe(gulp.dest('dist/js'));  //输出
});